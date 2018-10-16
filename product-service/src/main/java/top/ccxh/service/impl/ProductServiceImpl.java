package top.ccxh.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import top.ccxh.mapper.pojo.Accesskey;
import top.ccxh.mapper.pojo.ImgResource;
import top.ccxh.mapper.pojo.Product;
import top.ccxh.mapper.port.ImgResourceMapper;
import top.ccxh.mapper.port.ProductImgMapper;
import top.ccxh.mapper.port.ProductMapper;
import top.ccxh.service.AccessKeyService;
import top.ccxh.service.LegalEnum;
import top.ccxh.service.ProductService;

import java.util.ArrayList;
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
    @Autowired
    AccessKeyService accessKeyService;
    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean addProduct(List<ImgResource> imgResources, Product product){
         imgResourceMapper.bathInsert(imgResources);
         product.quickTime();
         productMapper.insert(product);

        productImgMapper.bathInsertProductRe(product.getId(),imgResources);
         return true;
    }

    @Override
    public List<Product> selectAll() {
        return productMapper.selectProductAll();
    }

    @Override
    public List<Product> selectProduct(Integer page,Integer id) {
        List<Product> list=new ArrayList<>();
        int number = (page - 1)*20;
        Accesskey accesskey = accessKeyService.selectById(id);
        if (accesskey!=null){
            //默认账户
            if (accesskey.getId().equals(1)&&accesskey.getDataStatus().equals(LegalEnum.VALID.getCode())){
                return productMapper.selectDefaultAllLimit(number,20);
            }
            /**
             * 同时 拥有 管理权限 和访问权限 才能访问 所有数据 包括 状态为1 的
             */
            if (accesskey.getManagerPower().equals(LegalEnum.VALID.getCode())&&accesskey.getAccessPower().equals(LegalEnum.VALID.getCode())){
                return productMapper.selectManagerLimit(number,20);
            }
            //智能看到 有效数据和 指定的数据
            if (accesskey.getAccessPower().equals(LegalEnum.VALID.getCode())&&accesskey.getDataStatus().equals(LegalEnum.VALID.getCode())){
                return productMapper.selectProductByIdLimit(number,20,id);
            }
        }
        return  list;
    }
}
