package com.zzlhr.dao;

import com.zzlhr.entity.Article;
import lombok.extern.slf4j.Slf4j;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.test.context.junit4.SpringRunner;

/**
 * Created by 刘浩然 on 2017/8/17.
 */
@RunWith(SpringRunner.class)
@SpringBootTest
@Slf4j
public class ArticleDaoTest {

    @Autowired
    private ArticleDao dao;

    @Test
    public void findByArticleClassAndArticleStatus() throws Exception {
        PageRequest pageRequest = new PageRequest(0,10);
        Page<Article> articleList = dao.findByArticleClassAndArticleStatus("未分类", 0, pageRequest);
        log.info("【文章列表】articleList={}",articleList.getContent());
        Assert.assertNotEquals(0,articleList.getContent().size());
    }

    @Test
    public void findByArticleTitleLikeAndArticleStatus() throws Exception {
        PageRequest pageRequest = new PageRequest(0,10);
        Page<Article> articleList = dao.findByArticleTitleLikeAndArticleStatus("关%", 0, pageRequest);
        log.info("【文章列表】articleList={}",articleList.getContent());
        Assert.assertNotEquals(0,articleList.getContent().size());
    }

}