package top.ccxh.service;

import top.ccxh.mapper.pojo.ImgResource;
import top.ccxh.mapper.pojo.Product;

import java.util.List;

public interface ProductService {
    /**
     * 添加商品
     * @param imgResources
     * @param product
     * @return
     */
    boolean addProduct(List<ImgResource> imgResources, Product product);

}
