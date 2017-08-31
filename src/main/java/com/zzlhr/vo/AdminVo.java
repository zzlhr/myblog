package com.zzlhr.vo;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

/**
 * Created by 刘浩然 on 2017/7/26.
 */
@Data
public class AdminVo {

    /**
     * 用户名
     */
    @JsonProperty("name")
    private String adminName;

    /**
     * token令牌
     */
    @JsonProperty("token")
    private String adminToken;


    /**
     * 上次登录ip
     */
    @JsonProperty("adminIp")
    private String adminIp;
}
