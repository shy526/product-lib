package top.ccxh.service;

/**
 * 定义标准
 * @author admin
 */

public enum LegalEnum {
    /**
     * 有效
     */
    VALID(0),
    /**
     * 无效
     */
    INVALID(1);
    private  Integer code;

    LegalEnum(Integer code) {
        this.code = code;
    }

    public Integer getCode() {
        return code;
    }
}
