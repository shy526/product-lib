package top.ccxh.mapper.port;

import org.apache.ibatis.annotations.Param;
import top.ccxh.mapper.my.SysMapper;
import top.ccxh.mapper.pojo.ImgResource;

import java.util.List;

public interface ImgResourceMapper extends SysMapper<ImgResource> {
    /**
     * 批量插入
     * @param imgResources
     * @return
     */
    Integer bathInsert(List<ImgResource> imgResources);

}
