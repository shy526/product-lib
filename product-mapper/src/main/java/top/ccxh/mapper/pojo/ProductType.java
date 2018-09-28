package top.ccxh.mapper.pojo;

import javax.persistence.Table;

/**
 * 类目
 * @author admin
 */
@Table(name = "t_product_type")
public class ProductType extends BasePojo {
    private String name ;
    private Integer paren ;
    private Integer dataStatus;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getParen() {
        return paren;
    }

    public void setParen(Integer paren) {
        this.paren = paren;
    }

    public Integer getDataStatus() {
        return dataStatus;
    }

    public void setDataStatus(Integer dataStatus) {
        this.dataStatus = dataStatus;
    }
}
