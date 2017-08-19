package com.zzlhr.enums;

import lombok.Getter;

/**
 * Created by 刘浩然 on 2017/8/18.
 */
@Getter
public enum  ExceptionEnum {

    ADMIN_NOTEXIST(1, "管理员不存在"),

    ;



    private Integer code;
    private String message;

    ExceptionEnum(Integer code, String message){
        this.code = code;
        this.message = message;
    }


}
