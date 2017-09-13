package com.zzlhr.vo;

import lombok.Data;

import java.util.ArrayList;
import java.util.List;

@Data
public class MessageVo {

    private Integer id;
    private String messageName;
    private String messageValue;
    private Integer messageFid;
    private Integer messageReplaynum;
    private String messageIp;
    private String messageAddress;
    private java.sql.Timestamp createTime;
    private java.sql.Timestamp updateTime;

    private List<MessageVo> replay = new ArrayList<>();

}
