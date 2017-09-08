package com.zzlhr.controller;

import com.google.gson.Gson;
import com.zzlhr.entity.Article;
import com.zzlhr.service.ArticleService;
import com.zzlhr.vo.ArticleListVo;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by 刘浩然 on 2017/7/30.
 */
@Controller
@RequestMapping("/")
public class PublicController {

    //前台

    @Autowired
    private ArticleService articleService;

    Gson gson = new Gson();

    @RequestMapping({"/","/index.*"})
    public ModelAndView index(){

        List<Article> comments = articleService.getCommendArticle(1,0);
        List<ArticleListVo> result = new ArrayList<>();
        for (Article comment : comments){
            ArticleListVo articleListVo = new ArticleListVo();
            BeanUtils.copyProperties(comment, articleListVo);
            articleListVo.setCreateTime(String.valueOf(comment.getCreateTime().getTime()));
            articleListVo.setUpdateTime(String.valueOf(comment.getUpdateTime().getTime()));
            result.add(articleListVo);
        }

        String articles = JSONArray.fromObject(result).toString();

        ModelAndView model = new ModelAndView("index");

        model.addObject("articles", articles);

        return model;
    }

    @RequestMapping("/article.html")
    public ModelAndView article(Integer id){


        ModelAndView model = new ModelAndView("article");

        Article article = articleService.getArticleDetails(id);

        JSONObject result = JSONObject.fromObject(article);
        Date updateTime = new Date(result.getJSONObject("updateTime").getLong("time"));
        Date createTime = new Date(result.getJSONObject("createTime").getLong("time"));

        result.remove("updateTime");
        result.remove("createTime");

        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        result.put("updateTime", formatter.format(updateTime));
        result.put("createTime", formatter.format(createTime));

        model.addObject("article", result.toString());




        return model;
    }



}
