package com.zzlhr.entity;


import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import java.io.Serializable;

@Entity
@Data
public class Status implements Serializable {
  @Id
  @GeneratedValue
  private Integer id;
  private String value;
  private Integer cs;
  private String classname;
  private Integer number;
  private Integer fid;

  public Status(Integer statusId){
    this.id = statusId;
  }

  public Status(){

  }
}
