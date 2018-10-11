package top.ccxh.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import tk.mybatis.mapper.util.StringUtil;
import top.ccxh.mapper.pojo.ProductType;
import top.ccxh.service.ProductTypeService;
import top.ccxh.mapper.pojo.PageModel;
import top.ccxh.web.pojo.Result;

import java.util.List;

/**
 * @author admin
 */
@RestController
@RequestMapping("type")
public class ProductTypeController {
    @Autowired
    ProductTypeService productTypeService;
    @RequestMapping("delete")
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
    @RequestMapping("limit")
    public Result pageTypelimit(@RequestBody PageModel pageModel){
        if (pageModel!=null&&pageModel.getPageNumber()!=null&&pageModel.getPageSize()!=null){
            return Result.ok(productTypeService.limitPage(pageModel));
        }
        return Result.error();
    }
    @RequestMapping("check")
    public Result checkName(String name){
        if (StringUtil.isNotEmpty(name)){
            return Result.ok(productTypeService.checkName(name));
        }
        return Result.ok(false);
    }
}
