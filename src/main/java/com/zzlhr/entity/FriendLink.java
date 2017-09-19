package com.zzlhr.entity;


import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import java.io.Serializable;


@Entity
@Data
public class FriendLink implements Serializable{

  @Id
  @GeneratedValue
  private Integer id;

  private Integer linkLocation;

  private String linkValue;

  private String linkUrl;

  private String createAdmin;

  private Integer linkStatus;

  @Column(updatable = false, insertable = false)
  private java.sql.Timestamp createTime;

  @Column(updatable = false, insertable = false)
  private java.sql.Timestamp updateTime;

}

