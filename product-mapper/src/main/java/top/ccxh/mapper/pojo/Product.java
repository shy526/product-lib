package top.ccxh.mapper.pojo;

import javax.persistence.Table;

/**
 * 产品实体
 */
@Table(name = "t_product")
public class Product extends BasePojo {
    private String name;
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
}
