package top.ccxh.mapper.port;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import top.ccxh.BaseTest;
import top.ccxh.mapper.pojo.BasePojo;
import top.ccxh.mapper.pojo.ImgResource;
import top.ccxh.mapper.pojo.ProductImg;

import java.util.ArrayList;
import java.util.List;

import static org.junit.Assert.*;

public class ProductImgMapperTest extends BaseTest {
    @Autowired
    ProductImgMapper ProductImgMapper;
    @Test
    public void bathInsertProductRe() {
        List<ImgResource> imgResources = new ArrayList();
        ImgResource imgResource = new ImgResource();
       // imgResource.setId(1);
        imgResource.quickTime();
        imgResource.setImgType(1);
        imgResource.setLocalPath("localPath");
        imgResource.setShowUrl("show");
        imgResources.add(imgResource);
        imgResource = new ImgResource();
       // imgResource.setId(2);
        imgResource.quickTime();
        imgResource.setImgType(2);
        imgResource.setLocalPath("localPath2");
        imgResource.setShowUrl("show2");
        imgResources.add(imgResource);
        Integer integer = ProductImgMapper.bathInsertProductRe( 1,imgResources);

       System.out.println("integer = " + imgResources.get(1).getId());
    }

    @Test
    public void bathInsert() {
        ArrayList<ProductImg> productImgs = new ArrayList<>();
        ProductImg productImg = new ProductImg();
        productImg.setImgId(1);
        productImg.setProductId(2);
        productImg.quickTime();
        productImgs.add(productImg);
        productImg = new ProductImg();
        productImg.setImgId(3);
        productImg.setProductId(4);
        productImg.quickTime();
        productImgs.add(productImg);
       // Integer integer = ProductImgMapper.bathInsertProductRe(1,productImgs);

    }
}