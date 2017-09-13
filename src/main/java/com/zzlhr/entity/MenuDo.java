package com.zzlhr.entity;


import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import java.io.Serializable;

@Data
@Entity
public class MenuDo implements Serializable{

  @Id
  @GeneratedValue
  private Integer id;

  private String menuName;

  private Integer menuGroup;

  private Integer menuFid;

  private String menuUri;

  private String doUri;

  private Integer doSerial;

  private Integer menuStatus;

}
