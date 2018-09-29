package top.ccxh.mapper.pojo;

import javax.persistence.Table;

/**
 * @author admin
 */
@Table(name = "t_img_resource")
public class ImgResource extends BasePojo {
    private String showUrl;
    private String localPath;
    private Integer imgType;

    public String getShowUrl() {
        return showUrl;
    }

    public void setShowUrl(String showUrl) {
        this.showUrl = showUrl;
    }

    public String getLocalPath() {
        return localPath;
    }

    public void setLocalPath(String localPath) {
        this.localPath = localPath;
    }

    public Integer getImgType() {
        return imgType;
    }

    public void setImgType(Integer imgType) {
        this.imgType = imgType;
    }
}
