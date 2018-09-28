package top.ccxh.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import top.ccxh.mapper.pojo.ProductType;
import top.ccxh.mapper.port.ProductTypeMapper;
import top.ccxh.service.ProductTypeService;

import javax.print.attribute.IntegerSyntax;
import java.util.List;

@Service
public class ProductTypeServiceImpl extends BaseService implements ProductTypeService {
    @SuppressWarnings("SpringJavaInjectionPointsAutowiringInspection")
    @Autowired
    private ProductTypeMapper productTypeMapper;
    @Override
    public List<ProductType> selectAll(){
       return productTypeMapper.selectAll();
    }
    @Override
    public boolean bathDeleteProductTypeById(List<Integer> ids){
        return this.judgeEq(productTypeMapper.bathDelete(ids),ids.size());
    }
    @Override
    public boolean updateProductTypeById(ProductType productType){
        productType.quickUpdateTime();
        return this.judgeInteger(productTypeMapper.updateByPrimaryKeySelective(productType));
    }

    @Override
    public boolean updateProductTypeStatusById(Integer id, Integer status) {
        return this.judgeInteger(productTypeMapper.updateStatus(id,status));
    }

    @Override
    public boolean addProductType(ProductType productType) {
        productType.quickTime();
        return this.judgeInteger(productTypeMapper.insertSelective(productType));
    }
}
