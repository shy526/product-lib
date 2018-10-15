package top.ccxh.web.controller.restful;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import top.ccxh.mapper.pojo.ImgResource;
import top.ccxh.mapper.pojo.Product;
import top.ccxh.service.ProductService;
import top.ccxh.web.pojo.Result;
import top.ccxh.web.util.IoUtil;

import java.util.ArrayList;
import java.util.List;

/**
 * @author admin
 */
@RestController
@RequestMapping("product")
public class ProductController {
    @Value("${config.file.local.img-path}")
    private String localPath;
    @Value("${config.file.show.url}")
    private String showUrl;
    @Autowired
    private ProductService productService;

    @RequestMapping("add")
    public Result upload(List<MultipartFile> files, Product product){
        if (files!=null&&files.size()>0){
                List<ImgResource> imgResources = new ArrayList<>();
                for (MultipartFile f : files) {
                    String path = IoUtil.imgOut(f, localPath);
                    if (path!=null){
                        ImgResource imgResource = new ImgResource();
                        imgResource.setLocalPath(path);
                        imgResource.quickTime();
                        imgResource.setShowUrl(path.substring(path.indexOf(showUrl)));
                        imgResources.add(imgResource);
                    }

                }
                if (imgResources.size()>0){
                    return Result.is(productService.addProduct(imgResources,product));
                }
        }
        return Result.error("no");
    }

    @RequestMapping("all")
    @ResponseBody
    public List<Product> selectAll(){
        List<Product> products = productService.selectAll();
        return products;
    }
}
