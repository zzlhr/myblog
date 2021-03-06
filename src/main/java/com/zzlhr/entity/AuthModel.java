package com.zzlhr.entity;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Data
@Entity
public class AuthModel {

  @Id
  @GeneratedValue
  private Integer id;
  /**
   * 模块名
   */
  private String modelName;

  /**
   * 模块状态
   */
  private Integer modelStatus;
  /**
   * 模块排序
   */
  private Integer modelSite;


  @Column(insertable = false, updatable = false)
  private java.sql.Timestamp createTime;

  @Column(insertable = false, updatable = false)
  private java.sql.Timestamp updateTime;

}
