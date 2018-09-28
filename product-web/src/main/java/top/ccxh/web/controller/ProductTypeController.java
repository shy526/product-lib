package top.ccxh.web.controller;

import org.omg.CORBA.INTERNAL;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import tk.mybatis.mapper.util.StringUtil;
import top.ccxh.mapper.pojo.Product;
import top.ccxh.mapper.pojo.ProductType;
import top.ccxh.service.ProductTypeService;
import top.ccxh.web.pojo.Result;

import java.util.List;

/**
 * @author admin
 */
@Controller
@RequestMapping("product/type")
public class ProductTypeController {
    @Autowired
    ProductTypeService productTypeService;
    @RequestMapping("page/list")
    public String gotoPageList(){
        return "product/type/list";
    }
    @RequestMapping("delete")
    @ResponseBody
    public Result bathDelete(@RequestParam(name = "ids[]")List<Integer> ids){
        if (ids!=null&&ids.size()>0){
          return   Result.is(productTypeService.bathDeleteProductTypeById(ids));
        }
        return Result.error();
    }

    @RequestMapping("all")
    @ResponseBody
    public List<ProductType> selectAll(){
       return productTypeService.selectAll();
    }
    @RequestMapping("update/status")
    @ResponseBody
    public Result updateStatus(Integer id,Integer status){
        if (id==null||status==null){
            return Result.error();
        }
        return Result.is(productTypeService.updateProductTypeStatusById(id,status));
    }
    @RequestMapping("add")
    @ResponseBody
    public Result addItem(ProductType productType){
        if (productType!=null&& StringUtil.isNotEmpty(productType.getName())){
            return Result.is(productTypeService.addProductType(productType));
        }
        return Result.error();
    }

    @RequestMapping("update")
    @ResponseBody
    public Result updateProductType(ProductType productType){
        if (productType!=null&& StringUtil.isNotEmpty(productType.getName())) {
            return Result.is(productTypeService.updateProductTypeById(productType));
        }
        return Result.error();
    }
}
