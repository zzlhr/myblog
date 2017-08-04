package com.zzlhr.vo;

import lombok.Data;

import java.util.Date;

/**
 * Created by 刘浩然 on 2017/8/4.
 */
@Data
public class ArticleListVo {
    private Integer id;
    private String title;
    private String describe;
    private String text;
    private String clazz;
    private String commend;
    private String status;
    private Date time;
}
