package com.zzlhr.vo;

import com.fasterxml.jackson.annotation.JsonProperty;

/**
 * Created by 刘浩然 on 2017/7/26.
 */
public class AdminVo {

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
}
