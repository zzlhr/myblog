package com.zzlhr.enums;

import java.util.*;


/**
 * Created by 刘浩然 on 2017/8/30.
 */
public enum ResultSuccessStatus {

    RESULT_SUCCESS_STATUS(0, "操作成功！");


    private String msg;

    private int code;

    public String getMsg() {
        return msg;
    }

    public int getCode() {
        return code;
    }

    ResultSuccessStatus(int code, String msg) {
        this.code = code;
        this.msg = msg;
    }


    public static Map<String, Object> getResultSuccessMap(){
        Map<String, Object> result = new HashMap<>();
        result.put("code", RESULT_SUCCESS_STATUS.getCode());
        result.put("msg",RESULT_SUCCESS_STATUS.getMsg());
        return result;
    }


}
