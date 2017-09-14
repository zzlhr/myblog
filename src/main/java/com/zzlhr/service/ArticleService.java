package com.zzlhr.service;

import com.zzlhr.entity.Article;
import org.springframework.data.domain.Page;

import java.util.List;
import java.util.Map;

/**
 * Created by 刘浩然 on 2017/8/18.
 */
public interface ArticleService {


    /**
     * 查询文章列表
     * @param keyword       关键字
     * @param page          页数
     * @return
     */
    List<Article> getArticleList(String keyword, int page);

    /** 获取推荐文章列表 */
    List<Article> getCommendArticle(int commend, int page);


    Page<Article> getArticleToClass(String clazz, int page);


    /** 查询文章详情 */
    Article getArticleDetails(int articleId);

    void addArticleClick(int id, String ip);


    Article saveArticle(Article article);





}
