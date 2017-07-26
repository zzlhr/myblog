package com.zzlhr.vo;

import lombok.Data;
import com.fasterxml.jackson.annotation.JsonProperty;

/**
 * Created by 刘浩然 on 2017/7/26.
 */
@Data
public class LoginVo {

    /**
     * 用户名
     */
    @JsonProperty("name")
    private String userName;

    /**
     * token令牌
     */
    private String token;


    /**
     * 上次登录ip
     */
    private String ip;

    public LoginVo(String userName, String token, String ip) {
        this.userName = userName;
        this.token = token;
        this.ip = ip;
    }
}
