package com.zzlhr.enums;

/**
 * 公共状态
 * Created by 刘浩然 on 2017/9/1.
 */
public enum StatusEnum {

    //启用
    USERING(0, "启用"),
    //禁用
    MISTAKE(1, "禁用"),
    ;



    private int code;
    private String msg;

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    StatusEnum(int code, String msg) {
        this.code = code;
        this.msg = msg;
    }
}
