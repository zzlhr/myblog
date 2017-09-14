package com.zzlhr.entity;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import java.io.Serializable;

@Data
@Entity
public class Message implements Serializable {
    @Id
    @GeneratedValue
    private Integer id;
    private String messageName;
    private String messageValue;
    private Integer messageFid = 0;
    private Integer messageReplaynum = 0;
    private String messageIp;
    private String messageAddress;
    private String messageLink;
    @Column(updatable = false, insertable = false)
    private java.sql.Timestamp createTime;
    @Column(updatable = false, insertable = false)
    private java.sql.Timestamp updateTime;
}
