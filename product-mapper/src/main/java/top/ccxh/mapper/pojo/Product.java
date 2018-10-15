package top.ccxh.mapper.pojo;

import javax.persistence.Table;
import javax.persistence.Transient;
import java.util.List;


/**
 * 产品实体
 */
@Table(name = "t_product")
public class Product extends BasePojo {
    private String name;
    private Integer typeId;
    private Integer guest;
    @Transient
    private ProductType productType;
    @Transient
    private List<ImgResource> imgResources;


    public Integer getTypeId() {
        return typeId;
    }

    public void setTypeId(Integer typeId) {
        this.typeId = typeId;
    }

    public ProductType getProductType() {
        return productType;
    }

    public void setProductType(ProductType productType) {
        this.productType = productType;
    }

    public List<ImgResource> getImgResources() {
        return imgResources;
    }

    public void setImgResources(List<ImgResource> imgResources) {
        this.imgResources = imgResources;
    }

    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }

    public Integer getGuest() {
        return guest;
    }

    public void setGuest(Integer guest) {
        this.guest = guest;
    }
}
