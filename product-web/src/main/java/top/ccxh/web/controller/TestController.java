package top.ccxh.web.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.HashMap;
import java.util.Map;

/**
 * @author honey
 */
@Controller
public class TestController {
    @Value("${spring.freemarker.template-loader-path}")
   // @Value("${spring.datasource.druid.initial-size}")
    String now;
    @RequestMapping("/")
    public String ss(Model model){
        HashMap<String, Object> t = new HashMap<>();
        t.put("time",System.currentTimeMillis());
        model.addAttribute(t);
        System.out.println(System.currentTimeMillis()+"---"+now);
        return "index";
    }
}
