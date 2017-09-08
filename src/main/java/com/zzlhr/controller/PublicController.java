package com.zzlhr.controller;

import com.google.gson.Gson;
import com.zzlhr.entity.Article;
import com.zzlhr.service.ArticleService;
import com.zzlhr.util.JSONUtil;
import com.zzlhr.util.NetworkUtil;
import com.zzlhr.vo.ArticleListVo;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.ArrayList;
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
    public ModelAndView article(Integer id, HttpServletRequest request){


        ModelAndView model = new ModelAndView("article");

        //查询文章详情
        Article article = articleService.getArticleDetails(id);

        //转化json
        JSONObject result = JSONObject.fromObject(article);

        //格式化时间
        String[] keys = {"updateTime", "createTime"};

        result = JSONUtil.formatDate(result, keys, "yyyy-MM-dd HH:mm:ss");

        model.addObject("article", result.toString());

        //添加访问数量
        try {
            articleService.addArticleClick(id, NetworkUtil.getIpAddress(request));
        } catch (IOException e) {
            e.printStackTrace();
        }

        return model;
    }



}
