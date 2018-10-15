package top.ccxh.mapper.pojo;

import javax.persistence.Table;

/**
 *
 *  <th data-field="id">序号</th>
 *   <th data-field="accessKey">邀请码</th>
 *  <th data-field="name">名称</th>
 *         <th data-field="addPower">添加产品权力</th>
 *      <th data-field="omitPower">删除产品权力</th>
 *        <th data-field="managerPower">管理产品权力</th>
 *          <th data-field="description">描述</th>
 *          <th data-field="accessPower">访问权限</th>
 *      <th data-field="create_time">创建时间</th>
 *           <th data-field="update_time">更新时间</th>
 *           <th data-field="dataStatus">状态</th>
 * 访问key实体
 * @author admin
 */
@Table(name = "t_access_key")
public class Accesskey extends BasePojo{
    private String accessKey;
    private String accessPower;
    private Integer managerPower;
    private Integer dataStatus;
    private String description;

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getAccessKey() {
        return accessKey;
    }

    public void setAccessKey(String accessKey) {
        this.accessKey = accessKey;
    }

    public String getAccessPower() {
        return accessPower;
    }

    public void setAccessPower(String accessPower) {
        this.accessPower = accessPower;
    }

    public Integer getManagerPower() {
        return managerPower;
    }

    public void setManagerPower(Integer managerPower) {
        this.managerPower = managerPower;
    }

    public Integer getDataStatus() {
        return dataStatus;
    }

    public void setDataStatus(Integer dataStatus) {
        this.dataStatus = dataStatus;
    }
}
