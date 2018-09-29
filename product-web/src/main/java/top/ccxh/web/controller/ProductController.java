package top.ccxh.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import top.ccxh.mapper.pojo.ImgResource;
import top.ccxh.mapper.pojo.Product;
import top.ccxh.service.ProductService;
import top.ccxh.web.pojo.Result;
import top.ccxh.web.util.IoUtil;

import javax.imageio.ImageIO;
import java.util.ArrayList;
import java.util.List;

/**
 * @author admin
 */
@Controller
@RequestMapping("product")
public class ProductController {
    @Value("${config.file.local.path}")
    private String localPath;
    @Value("${config.file.show.url}")
    private String showUrl;
    @Autowired
    private ProductService productService;
    @RequestMapping("page/add")
    public String toProductAdd(){
        return "product/add_step";
    }
    @RequestMapping("page/info")
    public String toInfo(Model model){
        model.addAttribute("name","测试");
        return "product/info";
    }

    @RequestMapping("add")
    @ResponseBody
    public Result upload(List<MultipartFile> file, Product product){
        if (file!=null&&file.size()>0){
                List<ImgResource> imgResources = new ArrayList<>();
                for (MultipartFile f : file) {
                    String path = IoUtil.imgOut(f, localPath);
                    if (path!=null){
                        ImgResource imgResource = new ImgResource();
                        imgResource.setLocalPath(path);
                        imgResource.quickTime();
                        imgResource.setShowUrl(showUrl);
                        imgResources.add(imgResource);
                    }

                }
                if (imgResources.size()>0){
                    return Result.is(productService.addProduct(imgResources,product));
                }
        }
        return Result.error("no");
    }
}
