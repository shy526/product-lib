package top.ccxh.mapper.port;

import com.alibaba.fastjson.JSONArray;
import org.apache.ibatis.annotations.Param;
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


    /**
     * 默认权限所能看到的商品
     * @param now
     * @param size
     * @return
     */
    List<Product> selectDefaultAllLimit(@Param("now") int now, @Param("size")int size);

    /**
     *  指定用户可以看到 的列表
     * @param now
     * @param size
     * @param id
     * @return
     */
    List<Product> selectProductByIdLimit(@Param("now") int now, @Param("size")int size,@Param("id") Integer id);

    /**
     * 拥有管理员权限和 访问权限的人 才能看
     * @param number
     * @param size
     * @return
     */
    List<Product> selectManagerLimit(@Param("now")int number,  @Param("size")int size);
}
