package top.ccxh.service;

import top.ccxh.mapper.pojo.ImgResource;
import top.ccxh.mapper.pojo.Product;

import java.util.List;

/**
 * 产品操作
 * @author admin
 */
public interface ProductService {
    /**
     * 添加商品
     * @param imgResources
     * @param product
     * @return
     */
    boolean addProduct(List<ImgResource> imgResources, Product product);

    /**
     * 返回所有商品
     * @return
     */
    List<Product> selectAll();

    /**
     * 分页 返回该用户所能观看的 商品 和所有默认展示商品
     * @param page
     * @return
     */
    List<Product> selectProduct(Integer page,Integer id);
}
