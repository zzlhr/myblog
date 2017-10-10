package com.zzlhr.entity;


import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

/**
 * 操作
 */
@Data
@Entity
public class AuthOperate {

  @Id
  @GeneratedValue
  private Integer id;
  /**
   * 操作名称
   */
  private String operateName;
  /**
   * 所属模块
   */
  private Integer operateModel;
  /**
   * 代码中的名称
   */
  private String operateCodename;
  /**
   * 排序，用于二进制存储辨别位置使用
   */
  private Integer operateSite;

  /**
   * 功能类型 0为操作不可见,1为显示菜单
   */
  private Integer operateType;

}
