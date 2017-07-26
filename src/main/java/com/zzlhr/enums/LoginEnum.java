package com.zzlhr.enums;

/**
 * Created by 刘浩然 on 2017/7/26.
 */
public enum LoginEnum {
    SUCCESS(0, "登录成功！"),
    USERNOTEXIST(1, "用户不存在"),
    PASSWORDERROR(2, "用户名或密码错误"),
    NOTLOGIN(3, "禁止登录")
    ;

    private LoginEnum(int code, String msg) {
        this.code = code;
        this.msg = msg;
    }
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

    private Integer code;
    private String msg;






}
