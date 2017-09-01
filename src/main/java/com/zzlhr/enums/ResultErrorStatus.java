package com.zzlhr.enums;
import java.util.HashMap;
import java.util.Map;
/**
 * 失败返回状态
 * Created by 刘浩然 on 2017/8/23.
 */
public enum ResultErrorStatus {


    UNKNOWN_ERROR(10000, "未知错误"),
    SYSTEM_ERROR(10001, "系统错误！请联系管理员！"),


    /*11000-12000管理员操作错误区段*/
    ADMIN_NOTEXIST(11000, "管理员不存在"),
    ADMIN_PASSWORD_ERROR(10001, "密码错误！"),
    ADMIN_ISEXIST(10002, "用户名或邮箱被占用！"),
    ADMIN_TWOINPUTPASSWORDNOTEQUAL(10003, "两次输入密码不相同！"),
    ADMIN_INPUTPASSWORDMUSTNOTNULL(10004, "输入密码不能为空！"),


    /* 12001-13000 权限异常 */
    GROUP_NOTEXIST(12001, "权限组不存在"),
    GROUP_PROHIBITMODIFYINGSUPERADMINISTRATORS(12002, "禁止修改超级管理员！"),
    MENU_NOTEXIST(12003, "菜单不存在"),
    URI_NOTEXIST(12004, "请求不存在"),


    ;



    private String msg;

    private int code;

    public String getMsg() {
        return msg;
    }

    public int getCode() {
        return code;
    }

    ResultErrorStatus(int code, String msg) {
        this.code = code;
        this.msg = msg;
    }


    public static Map<String, Object> toMap(ResultErrorStatus resultErrorStatus){
        Map<String, Object> result = new HashMap<>();
        result.put("code", resultErrorStatus.getCode());
        result.put("msg",resultErrorStatus.getMsg());
        return result;
    }


}
