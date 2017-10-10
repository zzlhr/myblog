package com.zzlhr.entity;


import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Data
@Entity
public class Website {

  @Id
  @GeneratedValue
  private Integer id;
  private String websiteTitle;
  private String websiteLogo;
  private String websiteRealmname;
  private String websiteKeyword;
  private String websiteDescribe;
  private String websiteTel;
  private String websiteQq;
  private String websiteEmail;
  private String websiteAddress;
  private String websiteBottom;
  private Integer websiteStatus;
  private String websiteAboutme;

  @Column(updatable = false, insertable = false)
  private java.sql.Timestamp createTime;
  @Column(updatable = false, insertable = false)
  private java.sql.Timestamp updateTime;
}
