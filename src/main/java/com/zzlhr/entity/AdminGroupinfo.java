package com.zzlhr.entity;


import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
@Data
public class AdminGroupinfo {

  @Id
  @GeneratedValue
  private Integer id;
  private Integer groupId;
  private Integer menuId;
  private Integer groupValue;

}
