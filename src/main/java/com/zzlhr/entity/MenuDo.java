package com.zzlhr.entity;


import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Data
@Entity
public class MenuDo {


  @Id
  @GeneratedValue
  private Integer id;
  private String menuName;
  private Integer menuGroup;
  private Integer menuFid;
  private String menuUri;
  private String doUri;
  private Integer doSerial;

}
