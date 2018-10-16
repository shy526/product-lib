package top.ccxh.web.controller.jump;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author admin
 * 仅限制与控制页面跳转
 */
@Controller
@RequestMapping("page")
public class PageJumpController {
    @RequestMapping("type/manager")
    public String managerType(){
        return "type/manage";
    }
    @RequestMapping("product/add")
    public String addProduct(){
        return "product/add";
    }
    @RequestMapping("access/manager")
    public String managerAccess(){
        return "access/manage";
    }
}
