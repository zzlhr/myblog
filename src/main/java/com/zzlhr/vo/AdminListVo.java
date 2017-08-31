package com.zzlhr.vo;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

/**
 * Created by 刘浩然 on 2017/8/30.
 */
@Data
public class AdminListVo {

    private Integer id;

    @JsonProperty("name")
    private String adminName;

    @JsonProperty("e-mail")
    private String adminEmail;


    @JsonProperty("status")
    private String adminStatus;

    @JsonProperty("ip")
    private String adminIp;

    @JsonProperty("address")
    private String adminAddress;

}
