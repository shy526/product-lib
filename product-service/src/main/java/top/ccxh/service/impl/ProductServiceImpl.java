package top.ccxh.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import top.ccxh.mapper.pojo.ImgResource;
import top.ccxh.mapper.pojo.Product;
import top.ccxh.mapper.port.ImgResourceMapper;
import top.ccxh.mapper.port.ProductImgMapper;
import top.ccxh.mapper.port.ProductMapper;
import top.ccxh.service.ProductService;

import java.util.List;

/**
 * @author admin
 */
@Service
public class ProductServiceImpl extends BaseService implements ProductService {
    private final static Logger LOGGER= LoggerFactory.getLogger(ProductServiceImpl.class);
    @SuppressWarnings("SpringJavaInjectionPointsAutowiringInspection")
    @Autowired
    ImgResourceMapper imgResourceMapper;
    @SuppressWarnings("SpringJavaInjectionPointsAutowiringInspection")
    @Autowired
    ProductMapper productMapper;
    @SuppressWarnings("SpringJavaInjectionPointsAutowiringInspection")
    @Autowired
    ProductImgMapper productImgMapper;
    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean addProduct(List<ImgResource> imgResources, Product product){
         imgResourceMapper.bathInsert(imgResources);
         product.quickTime();
         productMapper.insert(product);
        LOGGER.info("id:{}",product.getId());
        productImgMapper.bathInsertProductRe(product.getId(),imgResources);
         return true;
    }
}
