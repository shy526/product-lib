package top.ccxh.mapper.port;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import top.ccxh.mapper.my.SysMapper;
import top.ccxh.mapper.pojo.Accesskey;

import java.util.List;

/**
 * 提供常规数据操作
 * @author admin
 */
public interface AccessKeyMapper extends SysMapper<Accesskey> {
    /**
     * 根据 id 更新 可用状态
     * @param id
     * @param status
     * @return
     */
    @Update("UPDATE t_access_key SET data_status=#{status} WHERE id = #{id}")
    Integer updateStatus(@Param("id") Integer id, @Param("status") Integer status);

    /**
     * 批量删除
     * @param ids
     * @return
     */
    Integer bathDelete(List<Integer> ids);
}
