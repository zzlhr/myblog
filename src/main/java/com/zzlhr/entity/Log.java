package com.zzlhr.entity;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import java.io.Serializable;

@Entity
@Data
public class Log implements Serializable{

  @Id
  @GeneratedValue
  private Integer id;

  private Integer type;

  private String value;

  private java.sql.Timestamp time;

  private String ip;

  private String admin;

}
