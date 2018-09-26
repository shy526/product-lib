package top.ccxh.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import top.ccxh.mapper.pojo.Product;
import top.ccxh.service.ProductService;
import top.ccxh.web.pojo.Result;
import top.ccxh.web.util.IoUtil;

import javax.imageio.ImageIO;
import java.util.List;

/**
 * @author admin
 */
@Controller
@RequestMapping("product")
public class ProductController {

    @RequestMapping("add/page")
    public String toProductAdd(){
        return "product/add_step";
    }

    @RequestMapping("add")
    @ResponseBody
    public Result upload(List<MultipartFile> file, Product product){
        if (file!=null&&file.size()>0){
            for (MultipartFile f:file){
                IoUtil.imgOut(f,"./");
            }
            return Result.ok(null);
        }
        return Result.error("no");
    }
}
