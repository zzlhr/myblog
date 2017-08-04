package com.zzlhr.dao;

import com.zzlhr.entity.Article;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * Created by 刘浩然 on 2017/7/27.
 */
@Repository
public interface ArticleDao extends JpaRepository<Article, Integer> {


}
