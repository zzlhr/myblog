package com.zzlhr.enums;

/**
 * Created by 刘浩然 on 2017/7/26.
 */
public enum  AdminStatusEnum {
    OK(0,"正常"),
    NOTLOGIN(1, "禁止登录"),
    EXCEPTION(2, "账号异常")
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

    AdminStatusEnum(int code, String msg) {
        this.code = code;
        this.msg = msg;
    }
}
