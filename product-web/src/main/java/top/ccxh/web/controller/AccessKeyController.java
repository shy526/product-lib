package top.ccxh.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import top.ccxh.mapper.pojo.Accesskey;
import top.ccxh.service.AccessKeyService;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 访问层
 */
@Controller
@RequestMapping("accesskey")
public class AccessKeyController {

    @Autowired
    AccessKeyService accessKeyService;
    @RequestMapping("all")
    @ResponseBody
    public List<Accesskey> selectAll(){
        List<Accesskey> accesskeys = accessKeyService.selectAll();
        System.out.println("accesskeys = " + accesskeys);
        return accesskeys;
    }
    @RequestMapping("delete")
    @ResponseBody
    public List<Accesskey> deleteIds(@RequestParam(value="ids[]") List<Integer >ids){
        System.out.println("ids = " + ids);;
        accessKeyService.bathDeleteAccessKeyByid(ids);
        return null;
    }
    @RequestMapping("page/list")
    public String goList(){
        return "access/list";
    }
}
