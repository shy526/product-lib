package top.ccxh.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import top.ccxh.mapper.pojo.PageModel;
import top.ccxh.mapper.pojo.ProductType;
import top.ccxh.mapper.port.ProductTypeMapper;
import top.ccxh.service.ProductTypeService;

import java.util.List;

@Service
public class ProductTypeServiceImpl extends BaseService implements ProductTypeService {
    @SuppressWarnings("SpringJavaInjectionPointsAutowiringInspection")
    @Autowired
    private ProductTypeMapper productTypeMapper;
    @Override
    public List<ProductType> selectAll(){
       return productTypeMapper.selectAllByDataStatus();
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

    @Override
    public PageModel limitPage(PageModel pageModel) {
        int nowIndex = (pageModel.getPageNumber() - 1)*pageModel.getPageSize();
        pageModel.setData(productTypeMapper.limitPage(nowIndex, pageModel.getPageSize()));
        pageModel.setPageNumber(pageModel.getPageNumber()+1);
        pageModel.setTotal(productTypeMapper.findMapperCount());
        return pageModel;
    }

    @Override
    public boolean checkName(String name) {
       return productTypeMapper.selectTypeByName(name)==null;

    }
}
