package top.ccxh.mapper.pojo;

import java.util.List;

/**
 * 描述一个可以查看的 分类
 * 但不能查看的id
 * @author admin
 */
public class Power {
    private ProductType productType;
    private List<Integer> notAccessId;

    public ProductType getProductType() {
        return productType;
    }

    public void setProductType(ProductType productType) {
        this.productType = productType;
    }

    public List<Integer> getNotAccessId() {
        return notAccessId;
    }

    public void setNotAccessId(List<Integer> notAccessId) {
        this.notAccessId = notAccessId;
    }
}
