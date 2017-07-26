package com.zzlhr.enums;

/**
 * Created by 刘浩然 on 2017/7/27.
 */
public enum LogTypeEnum {
    LOGIN_SUCCESS(0,"登录成功"),
    LOGIN_ERROR(1,"登录失败")
    ;

    private String msg;

    private int code;

    public String getMsg() {
        return msg;
    }

    public int getCode() {
        return code;
    }

    private LogTypeEnum(int code, String msg) {
        this.code = code;
        this.msg = msg;
    }


}
