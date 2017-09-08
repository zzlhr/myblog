package com.zzlhr.vo;

import lombok.Data;

import java.util.Date;

@Data
public class ArticleVo {

    private Integer id;

    private String title;

    private String describe;

    private String text;

    private String clazz;

    private Integer commend;

//    private String status;

    private Date time;
}
