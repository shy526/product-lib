package top.ccxh.web.pojo;

import java.io.Serializable;

/**
 * result
 */
public class Result implements Serializable {
    private Integer code;
    private String errorMessage;
    private Object data;


    public static Result ok(Object data) {
        Result result = new Result();
        result.setCode(200);
        result.setData(data);
        return result;
    }

    public static Result ok() {
        Result result = new Result();
        result.setCode(200);
        return result;
    }

    public static Result is(boolean b) {
        if (b) {
            return Result.ok();
        } else {
            return Result.error();
        }
    }

    public static Result error(String errorMessage) {
        Result result = new Result();
        result.setCode(500);
        result.setErrorMessage(errorMessage);
        return result;
    }

    public static Result error() {
        Result result = new Result();
        result.setCode(500);
        return result;
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getErrorMessage() {
        return errorMessage;
    }

    public void setErrorMessage(String errorMessage) {
        this.errorMessage = errorMessage;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }
}
