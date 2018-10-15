package top.ccxh.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import top.ccxh.service.ProductTypeService;
import top.ccxh.web.pojo.Result;

/**
 * 此处的Type 没管理权限
 * @author admin
 */
@RestController
@RequestMapping("type")
public class NoTypeController {
    @Autowired
    ProductTypeService productTypeService;


    @RequestMapping(value = "all")
    public Result selectAll(){
       return Result.ok(productTypeService.selectAll()) ;
    }
}
