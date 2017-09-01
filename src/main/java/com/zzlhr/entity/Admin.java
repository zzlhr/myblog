package com.zzlhr.entity;


import lombok.Data;

import javax.persistence.Column;
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

  /** 管理员邮箱 */
  private String adminEmail;

  /** 密码 */
  private String adminPassword;

  /** 令牌 */
  @Column(insertable = false)
  private String adminToken;

  /** 状态0为允许登录，1为禁止登录 */
  private Integer adminStatus = 0;

  /** 登录ip */
  private String adminIp = "0.0.0.0";

  /** 登录地址 */
  private String adminAddress;

  /** 所在权限组 */
  private Integer adminGroup;
}
