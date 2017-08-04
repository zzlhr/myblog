package com.zzlhr.entity;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Data
public class Article implements Serializable{
  @Id
  @GeneratedValue
  private Integer id;
  private String articleTitle;
  private String articleText;
  private String articlePicture;
  private Integer articleStatus;
  private String articleKeyword;
  private String articleDescribe;


  @Column(updatable = false, insertable = false)
  private java.sql.Timestamp articleTime;

  @OneToOne(cascade=CascadeType.REFRESH)
  @JoinColumn(name = "admin_id")
  private Admin admin;

  @Column(updatable = false, insertable = false)
  private Integer articleClick;

  @Column(updatable = false, insertable = false)
  private Integer articlePraise;

  @OneToOne(cascade=CascadeType.REFRESH)
  @JoinColumn(name = "article_class")
  private ArticleClass articleClass;
  private Integer articleCommend;

  @OneToOne(cascade = CascadeType.PERSIST)
  @JoinColumn(name = "status_id")
  private Status status;


}
