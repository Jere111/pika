package pers.pika.center.common.core.vo;

import java.io.Serializable;

/**
 * Ajax通用返回
 *
 * @author Jere
 * @create 2018-04-30 0:10
 */

public class AjaxResult<T> implements Serializable {

    private static final long serialVersionUID = -7775868898873862469L;

    private Integer code = 200;
    private String msg = "success";
    private T result;

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public T getResult() {
        return result;
    }

    public void setResult(T result) {
        this.result = result;
    }

    public AjaxResult() {
    }

    public AjaxResult(String msg) {
        this.msg = msg;
    }

    public AjaxResult(Integer code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    public AjaxResult(Integer code, String msg, T result) {
        this.code = code;
        this.msg = msg;
        this.result = result;
    }
}
