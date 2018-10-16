package top.ccxh.mapper.pojo;

import javax.persistence.Table;

/**
 *
 * 访问key实体
 * @author admin
 */
@Table(name = "t_access_key")
public class Accesskey extends BasePojo{
    private String accessKey;
    private Integer accessPower;
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

    public Integer getAccessPower() {
        return accessPower;
    }

    public void setAccessPower(Integer accessPower) {
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
