package top.ccxh.mapper.port;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;
import top.ccxh.mapper.my.SysMapper;
import top.ccxh.mapper.pojo.ProductType;

import java.util.List;

/**
 *产品类目操作
 * @author admin
 */
public interface ProductTypeMapper extends SysMapper<ProductType> {

    /**
     * 批量删除
     * @param ids
     * @return
     */
    Integer bathDelete(List<Integer> ids);

    /**
     * 更新状态
     * @param id
     * @param status
     * @return
     */
    @Update("UPDATE t_product_type SET data_status=#{status}  WHERE id = #{id}")
    Integer updateStatus(@Param("id") Integer id, @Param("status")Integer status);

    /**
     * 分页
     * @param nowIndex
     * @param pageSize
     * @return
     */
    List<ProductType> limitPage(@Param("now") int nowIndex, @Param("size") Integer pageSize);

    /**
     * 根据名字
     * @param name
     * @return
     */
    ProductType selectTypeByName(String name);

    /**
     * 查询所有状态是0的数据
     * @return
     */
    List<ProductType> selectAllByDataStatus();

}
