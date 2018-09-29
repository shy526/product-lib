package top.ccxh.mapper.port;

import org.apache.ibatis.annotations.Param;
import top.ccxh.mapper.my.SysMapper;
import top.ccxh.mapper.pojo.ImgResource;
import top.ccxh.mapper.pojo.ProductImg;

import java.util.List;

public interface ProductImgMapper extends SysMapper<ProductImg> {
    /**
     * 批量插入
     * @param list
     * @return
     */
    Integer bathInsert(List<ProductImg> list);

    /**
     * 批量插入2
     *
     * @param productId
     * @param resources
     * @return
     */
    Integer bathInsertProductRe(@Param("productId") Integer productId, @Param("resources")  List<ImgResource> resources);
}
