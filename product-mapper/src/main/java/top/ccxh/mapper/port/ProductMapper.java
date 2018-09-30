package top.ccxh.mapper.port;

import top.ccxh.mapper.my.SysMapper;
import top.ccxh.mapper.pojo.Product;

import java.util.List;

/**
 * @author admin
 */
public interface ProductMapper extends SysMapper<Product>{
    /**
     * 查询所有商品 包含图片 和分类信息
     * @return
     */
    List<Product> selectProductAll();
}
