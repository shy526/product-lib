package top.ccxh.service.impl;

public class BaseService {
    /**
     * 改变返回结果
     * @param result
     * @return
     */
    protected boolean judgeInteger(Integer result){
        return result>0;
    }
    /**
     * 改变返回结果
     * @param result
     * @return
     */
    protected boolean judgeEq(Integer result, Integer value){
        return result.equals(value);
    }
}
