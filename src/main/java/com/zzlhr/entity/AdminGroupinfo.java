package com.zzlhr.entity;


import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import java.io.Serializable;

@Entity
@Data
public class AdminGroupinfo implements Serializable {

  @Id
  @GeneratedValue
  private Integer id;

  private Integer groupId;

  private Integer authModelId;

  private Integer groupValue;



}
