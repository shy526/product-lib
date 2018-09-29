package top.ccxh.mapper.port;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import top.ccxh.BaseTest;
import top.ccxh.mapper.pojo.ImgResource;

import java.util.ArrayList;
import java.util.List;

import static org.junit.Assert.*;

public class ImgResourceMapperTest extends BaseTest {
    @Autowired
    ImgResourceMapper imgResourceMapper;
    @Test
    public void bathInsert() {
        List<ImgResource> imgResources = new ArrayList();
        ImgResource imgResource = new ImgResource();
        imgResource.quickTime();
        imgResource.setImgType(1);
        imgResource.setLocalPath("localPath");
        imgResource.setShowUrl("show");
        imgResources.add(imgResource);
        imgResource = new ImgResource();
        imgResource.quickTime();
        imgResource.setImgType(2);
        imgResource.setLocalPath("localPath2");
        imgResource.setShowUrl("show2");
        imgResources.add(imgResource);
        Integer integer = imgResourceMapper.bathInsert(imgResources);
        System.out.println("integer = " + integer);
    }
}