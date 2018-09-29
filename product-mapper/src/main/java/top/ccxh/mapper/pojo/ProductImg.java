package top.ccxh.mapper.pojo;

import javax.persistence.Table;

@Table(name="t_product_img")
public class ProductImg extends BasePojo {
    private Integer productId;
    private Integer imgId;

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public Integer getImgId() {
        return imgId;
    }

    public void setImgId(Integer imgId) {
        this.imgId = imgId;
    }
}
