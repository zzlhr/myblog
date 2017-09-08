package com.zzlhr.service.impl;

import com.zzlhr.dao.ArticleDao;
import com.zzlhr.entity.Article;
import com.zzlhr.enums.ArticleStatus;
import com.zzlhr.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Created by 刘浩然 on 2017/9/7.
 */
@Service
public class ArticleServiceImpl implements ArticleService {

    @Autowired
    private ArticleDao articleDao;

    @Override
    public Map<String, Object> getArticleList(String keyword, int page) {
        return null;
    }

    @Override
    public List<Article> getCommendArticle(int commend, int page) {

        PageRequest pageRequest = new PageRequest(page,5);

        Page<Article> articlePage = articleDao.findByArticleCommendAndArticleStatus(commend, ArticleStatus.SHOW.getCode(), pageRequest);

        List<Article> articleList = articlePage.getContent();

        return articleList;

    }

    @Override
    public Page<Article> getArticleToClass(String clazz, int page) {

        PageRequest pageRequest = new PageRequest(page,5);

        Page<Article> result = articleDao.findByArticleClassAndArticleStatus(clazz, ArticleStatus.SHOW.getCode(), pageRequest);

//        List<Article> articleList = articlePage.getContent();

        return result;

    }

    @Override
    public Article getArticleDetails(int articleId) {
        return articleDao.findOne(articleId);
    }
}
