package com.zzlhr.entity;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
@Data
public class AdminGroup {

  @Id
  @GeneratedValue
  private Integer id;
  private String groupName;
  private String groupStatic;

}
