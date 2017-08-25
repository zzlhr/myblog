package com.zzlhr.enums;

/**
 * 失败返回状态
 * Created by 刘浩然 on 2017/8/23.
 */
public enum ResultErrorStatus {

    UNKNOWN_ERROR(10000, "未知错误"),


    /*11000-12000管理员操作错误区段*/
    ADMIN_NOTEXIST(11000, "管理员不存在"),
    ADMIN_PASSWORD_ERROR(10001, "密码错误！"),
    ADMIN_ISEXIST(10002, "用户名或邮箱被占用！"),
    ;



    private String msg;

    private int code;

    public String getMsg() {
        return msg;
    }

    public int getCode() {
        return code;
    }

    private ResultErrorStatus(int code, String msg) {
        this.code = code;
        this.msg = msg;
    }

}
