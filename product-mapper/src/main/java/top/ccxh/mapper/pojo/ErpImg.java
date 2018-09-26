package top.ccxh.mapper.pojo;

import javax.persistence.Table;

/**
 * @author admin
 */
@Table(name = "t_img")
public class ErpImg extends BasePojo {
    private String showUrl;
    private String path;

    public String getShowUrl() {
        return showUrl;
    }

    public void setShowUrl(String showUrl) {
        this.showUrl = showUrl;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }
}
