package com.zzlhr.entity;


import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import java.io.Serializable;

@Data
@Entity
public class Admin implements Serializable{

  @Id
  @GeneratedValue
  /** 主键 */
  private Integer id;

  /** 用户名 */
  private String adminName;

  /** 密码 */
  private String adminPassword;

  /** 令牌 */
  private String adminToken;

  /** 状态0为允许登录，1为禁止登录 */
  private Integer adminStatus;

  /** 登录ip */
  private String adminIp;
}
