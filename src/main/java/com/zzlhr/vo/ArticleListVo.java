package com.zzlhr.vo;

import lombok.Data;

import java.util.Date;

/**
 * Created by 刘浩然 on 2017/8/4.
 */
@Data
public class ArticleListVo extends ArticleVo {

    private Integer id;

    /** 文章标题 */
    private String articleTitle;

    /** 文章管理员 */
    private String articleAdmin;

//    /** 文章内容 */
//    private String articleText;

//    /** 文章图片地址 */
//    private String articlePicture;

//    /** 文章关键字 */
//    private String articleKeyword;

    /** 文章描述 */
    private String articleDescribe;

    /** 文章点击数 */
    private Integer articleClick;

    /** 文章点赞数 */
    private Integer articlePraise;

    /** 文章分类 */
    private String articleClass;

//    /** 文章推荐 0.不推荐，1.推荐到首页，2为推荐到右侧列表 */
//    private Integer articleCommend;

//    /** 文章状态 0为显示，1为隐藏，3为删除 */
//    private Integer articleStatus;


    private Date updateTime;

    private Date createTime;





}
