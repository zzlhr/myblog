package com.zzlhr.vo;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

/**
 * Created by 刘浩然 on 2017/7/26.
 */
@Data
public class MsgVo<T> {

    /* 消息状态 */
    @JsonProperty("code")
    private Integer apiCode;

    /* 消息状态信息 */
    @JsonProperty("msg")
    private String apiMessage;

    /* 消息体 */
    private T data;
}
