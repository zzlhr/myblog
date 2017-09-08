package com.zzlhr.enums;

/**
 * Created by 刘浩然 on 2017/9/7.
 */
public enum ArticleStatus {


    SHOW(0, "显示"),
    HIDE(1, "隐藏"),
    DELECT(2, "删除"),

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

    ArticleStatus(int code, String msg) {
        this.code = code;
        this.msg = msg;
    }
}
