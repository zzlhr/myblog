package com.zzlhr.controller;

import com.zzlhr.entity.*;
import com.zzlhr.service.*;
import com.zzlhr.util.JSONUtil;
import com.zzlhr.util.NetworkUtil;
import com.zzlhr.util.WeiXinUtil;
import com.zzlhr.vo.ArticleListVo;
import com.zzlhr.vo.MessageVo;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.*;
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

    @Autowired
    private FriendLinkService friendLinkService;

    @Autowired
    private WebsiteService websiteService;

    @Autowired
    private MyApp myApp;



    @RequestMapping({"/","/index.*"})
    public ModelAndView index(){
        ModelAndView model = new ModelAndView("index");

        /* 推荐友链 */
        model = getFriendLinks(model);


        /* 推荐首页文章 */
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
        model.addObject("articles", articles);
        return model;
    }

    @RequestMapping("/article.html")
    public ModelAndView article(Integer id, HttpServletRequest request){

        ModelAndView model = new ModelAndView("article");

        /* 推荐友链 */
        model = getFriendLinks(model);

        //查询文章详情
        Article article = articleService.getArticleDetails(id);
        model.addObject("keyword",article.getArticleKeyword());
        model.addObject("description", article.getArticleDescribe());
        //转化json
        JSONObject result = JSONObject.fromObject(article);

        //格式化时间
        String[] keys = {"updateTime", "createTime"};

        result = JSONUtil.formatDate(result, keys, "yyyy-MM-dd HH:mm:ss");

        model.addObject("article", result.toString());
        model.addObject("title", article.getArticleTitle());

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

        ModelAndView model = new ModelAndView("articles");

        /* 推荐友链 */
        model = getFriendLinks(model);

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


        model.addObject("articles", articles);

        return model;
    }




    @ResponseBody
    @RequestMapping("/about.json")
    public String getAbout(){
        return String.valueOf(JSONObject.fromObject(aboutService.getAbout()));
    }



//    @ResponseBody
//    @RequestMapping("/articles.json")
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
    public ModelAndView about(){
        ModelAndView model = new ModelAndView("about");

        /* 推荐友链 */
        model = getFriendLinks(model);

        return model;
    }

    @RequestMapping("/message.html")
    public ModelAndView message(){

        //创建model对象
        ModelAndView model = new ModelAndView("message");

        /* 推荐友链 */
        model = getFriendLinks(model);


        //分页对象
        PageRequest pageRequest = new PageRequest(0,10, new Sort(Sort.Direction.DESC, "id"));
        //调用获取消息
        List<MessageVo> vos = messageService.getMessage(pageRequest);

        //向model对象插入对象

        model.addObject("messages", JSONUtil.formatDate(JSONArray.fromObject(vos),
                new String[]{"updateTime", "createTime"}, "yyyy-MM-dd HH:mm:ss")
                .toString());

        return model;
    }
    @RequestMapping("/works.html")
    public ModelAndView works(){
        ModelAndView model = new ModelAndView("works");

        /* 推荐友链 */
        model = getFriendLinks(model);

        return model;
    }

    @ResponseBody
    @RequestMapping("/message-send.do")
    public String sendMessage(String name, String link, String text, HttpServletRequest request){
        if (name == null || link == null || text == null ||
                "".equals(name) || "".equals(link) || "".equals(text)){
            return "<script>alert('请输入必填信息');location.href='message.html';</script>";
        }
        try {
            messageService.sendMessage(name, link, text, request);
        } catch (IOException e) {
            e.printStackTrace();
            return "<script>alert('发表留言失败！');location.href='message.html';</script>";
        }
        return "<script>alert('发表成功！');location.href='message.html';</script>";
    }


    /**
     * 公共获取友链方法
     * @param model modelAndView
     * @return
     */
    public ModelAndView getFriendLinks(ModelAndView model){
        /* 友链 */
        List<FriendLink> friendLinklist = friendLinkService.getAllFrinedLink();
        String friendLinks = JSONUtil.formatDate(JSONArray.fromObject(friendLinklist),
                new String[]{"updateTime", "createTime"}, "yyyy-MM-dd HH:mm:ss")
                .toString();
        model.addObject("friendLinks",friendLinks);
        //添加网站基本信息
        if (model.getViewName() != "article"){
            Website website = websiteService.getWebsite();
            model.addObject("website", website);
        }
        //关于我
//        Website website = websiteService.getWebsite();
        About aboutMe = aboutService.getAbout();
        model.addObject("aboutme", JSONObject.fromObject(aboutMe).toString());
        //最新文章
        model.addObject("leftArticles", JSONArray.fromObject(articles()).toString());


        return model;
    }
    @Autowired
    private WeiXinUtil wx;

    @ResponseBody
    @RequestMapping("/getwxconf.json")
    public String getWxConf(String url, String params){
        try {
            wx.setUrlAndParams(url,params);
            return wx.getWeiXinConf().toString();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "获取失败";
    }


    /**
     * 返回图片
     * @param request
     * @param response
     * @throws IOException
     */
    @GetMapping("/articleImage/*")
    public void getArticleImage(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String url = request.getRequestURL().toString();
        System.out.println("[url]:"+url);
        File fileImage = new File(myApp.getArticle().get("uploadpath") +
                url.split("/")[url.split("/").length-1]);
        FileInputStream inputStream = new FileInputStream(fileImage);
        byte[] data = new byte[(int)fileImage.length()];
        int length = inputStream.read(data);
        inputStream.close();

        response.setContentType("image/png");
        OutputStream stream = response.getOutputStream();
        stream.write(data);
        stream.flush();
        stream.close();
    }



}
