package top.ccxh.web.controller;

import com.github.pagehelper.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import top.ccxh.mapper.pojo.Product;
import top.ccxh.service.ProductService;
import top.ccxh.web.pojo.Result;
import top.ccxh.web.util.CookieUtils;

import java.util.List;

/**
 * 非权限操作
 * @author admin
 */
@RestController
@RequestMapping("product")
public class NoProductController {

    @Autowired
    private ProductService productService;
    @RequestMapping("page")
    public Result selectProduct(Integer page){
        if (page!=null&&page>0){
            String access = CookieUtils.getCookie("access");
            if (!StringUtils.isEmpty(access)){
                return Result.ok(productService.selectProduct(page, Integer.parseInt(access)));
            }

        }
        return Result.error();
    }
}
