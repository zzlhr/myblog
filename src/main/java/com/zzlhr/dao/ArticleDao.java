package com.zzlhr.dao;

import com.zzlhr.entity.Article;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * Created by 刘浩然 on 2017/7/27.
 */
@Repository
public interface ArticleDao extends JpaRepository<Article, Integer> {


    /** 通过文章分类和状态查询文章 */
    Page<Article> findByArticleClassAndArticleStatus(String articleClass, Integer articleStatus, Pageable pageable);

    /** 通过文章标题和状态查询文章 */
    Page<Article> findByArticleTitleLikeAndArticleStatus(String articleTitle, Integer articleStatus, Pageable pageable);

    /** 通过文章关键字和状态查询文章 */
    Page<Article> findByArticleKeywordLikeAndArticleStatus(String articleKeyword, Integer articleStatus, Pageable pageable);

    /** 通过推荐状态查询 */
    Page<Article> findByArticleCommendAndArticleStatus(Integer articleCommend, Integer articleStatus, Pageable pageable);

}
