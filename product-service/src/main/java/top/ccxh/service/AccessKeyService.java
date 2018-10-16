package top.ccxh.service;

import top.ccxh.mapper.pojo.Accesskey;
import top.ccxh.mapper.pojo.PageModel;
import top.ccxh.mapper.pojo.Power;

import java.util.List;

/**
 * AccessKeyService 相关服务
 * @author admin
 */
public interface AccessKeyService {
    /**
     * 插入一条新数据 只插入非空属性
     * @param accesskey
     * @param accessPower
     * @return
     */
    boolean insertSelective(Accesskey accesskey, List<Power> accessPower);

    /**
     * 根据主键 更新 accessKey
     * @param accesskey
     * @param accessPower
     * @return
     */
    boolean updateAccessKey(Accesskey accesskey, List<Power> accessPower);

    /**
     * 更新 datat_status状态
     * @param id
     * @param status
     * @return
     */
    boolean updateAccessKeyStatus(Integer id, Integer status);

    /**
     * 删除 access
     * @param id
     * @return
     */
    boolean deleteAccessKeyByid(Integer id);

    /**
     * 查询全部
     * @return
     */
    List<Accesskey> selectAll();

    /**
     * 批量删除
     * @param ids
     * @return
     */
    boolean bathDeleteAccessKeyByid(List<Integer> ids);

    /**
     * 检查名称
     * @param accessKey
     * @return
     */
    Accesskey selectByName(String accessKey);

    /**
     * 搜索id
     * @param id
     * @return
     */
    Accesskey selectById(int id);

    PageModel limitPage(PageModel pageModel);

    /**
     *只更新非空字段更新管理权限
     * @return
     */
    boolean updateByPrimaryKeySelective(Accesskey accesskey);


}
