package com.zzlhr.controller;

import com.zzlhr.entity.Article;
import com.zzlhr.entity.Message;
import com.zzlhr.service.AboutService;
import com.zzlhr.service.ArticleService;
import com.zzlhr.service.MessageService;
import com.zzlhr.util.JSONUtil;
import com.zzlhr.util.NetworkUtil;
import com.zzlhr.vo.ArticleListVo;
import com.zzlhr.vo.MessageVo;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
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

    @Autowired
    private AboutService aboutService;

    @Autowired
    private MessageService messageService;

    @RequestMapping({"/","/index.*"})
    public ModelAndView index(){

        List<Article> comments = articleService.getCommendArticle(1,0);
        List<ArticleListVo> result = new ArrayList<>();

        for (Article comment : comments){
            ArticleListVo articleListVo = new ArticleListVo();
            BeanUtils.copyProperties(comment, articleListVo);
            result.add(articleListVo);
        }


        String articles = JSONUtil.formatDate(JSONArray.fromObject(result),
                new String[]{"updateTime", "createTime"}, "yyyy-MM-dd HH:mm:ss")
                .toString();

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


    @RequestMapping("/articles.html")
    public ModelAndView articles(String cs, @RequestParam(value = "page", defaultValue = "0") Integer page){
        Page<Article> articlePage = articleService.getArticleToClass(cs, page);
        List<Article> list = articlePage.getContent();
        List<ArticleListVo> result = new ArrayList<>();

        for (Article article : list){
            ArticleListVo articleListVo = new ArticleListVo();
            BeanUtils.copyProperties(article, articleListVo);
            result.add(articleListVo);
        }

        String articles = JSONUtil.formatDate(JSONArray.fromObject(result),
                new String[]{"updateTime", "createTime"}, "yyyy-MM-dd HH:mm:ss")
                .toString();

        ModelAndView model = new ModelAndView("articles");

        model.addObject("articles", articles);

        return model;
    }




    @ResponseBody
    @RequestMapping("/about.json")
    public String getAbout(){
        return String.valueOf(JSONObject.fromObject(aboutService.getAbout()));
    }



    @ResponseBody
    @RequestMapping("/articles.json")
    public String articles(){
        JSONArray array = JSONArray.fromObject(articleService.getCommendArticle(2,0));
        JSONObject json = new JSONObject();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        int i = 0;
        for (Object ar : array){
            JSONObject jsonar = JSONObject.fromObject(ar);
            json.put("title",jsonar.getString("articleTitle"));
            json.put("time", formatter.format(new Date(jsonar.getJSONObject("createTime").getLong("time"))));
            json.put("id", jsonar.getInt("id"));
            array.set(i, json);
            i++;
        }

        return String.valueOf(array);
    }


    @RequestMapping("/about.html")
    public String about(){
        return "about";
    }

    @RequestMapping("/message.html")
    public ModelAndView message(){
        //分页对象
        PageRequest pageRequest = new PageRequest(0,10, new Sort(Sort.Direction.DESC, "id"));
        //调用获取消息
        List<MessageVo> vos = messageService.getMessage(pageRequest);
        //创建model对象
        ModelAndView model = new ModelAndView("message");
        //向model对象插入对象

        model.addObject("messages", JSONUtil.formatDate(JSONArray.fromObject(vos),
                new String[]{"updateTime", "createTime"}, "yyyy-MM-dd HH:mm:ss")
                .toString());
        return model;
    }
    @RequestMapping("/works.html")
    public String works(){
        return "works";
    }



}
