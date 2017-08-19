package com.zzlhr.controller;

import com.zzlhr.dao.AdminDao;
import com.zzlhr.dao.ArticleDao;
import com.zzlhr.entity.Article;
import com.zzlhr.vo.ArticleListVo;
import com.zzlhr.vo.ArticleVo;
import com.zzlhr.vo.MsgVo;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * Created by 刘浩然 on 2017/7/27.
 */
@RestController
@RequestMapping("/admin")
public class AdminController {

//    @Autowired
//    private AdminService adminService;

    @Autowired
    private ArticleDao articleDao;


    @Autowired
    private AdminDao adminDao;

//    @ResponseBody
//    @PostMapping("/login.do")
//    public String dLogin(String name, String password,
//                              HttpServletRequest request, HttpServletResponse response){
//        try {
//            MsgVo<LoginVo> msgVo = adminService.login(name,password, RequestUtil.getRemortIP(request));
//            if (LoginEnum.SUCCESS.getCode() == msgVo.getApiCode()){
//                //登录成功
//                Cookie cookie = new Cookie("name",msgVo.getData().getUserName());
//                response.addCookie(cookie);
//                cookie = new Cookie("token", msgVo.getData().getToken());
//                response.addCookie(cookie);
//                request.getSession().setAttribute("token",msgVo.getData().getToken());
//                request.getSession().setAttribute("name",msgVo.getData().getUserName());
//                return "<script>alert('"+LoginEnum.SUCCESS.getMsg()+"');location.href='index.html'</script>";
//            }else if (LoginEnum.PASSWORDERROR.getCode() == msgVo.getApiCode() ||
//                    LoginEnum.USERNOTEXIST.getCode() == msgVo.getApiCode()){
//                return "<script>alert('用户名或密码错误！');location.href='login.html'</script>";
//            }else {
//                return "<script>alert('登录失败！');location.href='login.html'</script>";
//            }
//        } catch (UnsupportedEncodingException e) {
//            e.printStackTrace();
//            return "<script>alert('登录失败！');location.href='login.html'</script>";
//        } catch (NoSuchAlgorithmException e) {
//            e.printStackTrace();
//            return "<script>alert('登录失败！');location.href='login.html'</script>";
//        }
//    }
//
//    @GetMapping("/login.html")
//    public String vLogin(){
//        return "admin/login";
//    }
//
//
//    @GetMapping("/index.html")
//    public String vIndex(HttpServletRequest request, Model model){
////        if (request.getSession().getAttribute("token") == null){
////            return "admin/login";
////        }
//        model.addAttribute("name",request.getSession().getAttribute("name"));
//        return "admin/index";
//    }
//
//
//
//    @GetMapping("/article.html")
//    public String vArticle(HttpServletRequest request){
//        return "admin/article";
//    }
//
//
    @ResponseBody
    @PostMapping("/article.do")
    public String articleDo(Article article, Integer type,
                            HttpServletRequest request, HttpServletResponse response,
                            Model model){
        switch (type){
            case 1:
                //添加
                if (article.getArticleTitle() == null){
                    return "<script>alert('请输入标题！');</script>";
                } else if (article.getArticleText() == null){
                    return "<script>alert('请输入内容！');</script>";
                }
//                Admin admin = adminDao.findByAdminName(article.getAdmin().getAdminName());
                article.setId(null);
//                article.setAdmin(admin);
                articleDao.save(article);
                return "<script>alert('操作成功！')</script>";
            case 2:
                //修改

                if (article.getArticleTitle() == null){
                    return "<script>alert('请输入标题！')</script>";
                } else if (article.getArticleText() == null){
                    return "<script>alert('请输入内容！')</script>";
                }
                //获取文章
                Article articleOld = articleDao.findOne(article.getId());
                System.out.println(articleOld);
                articleOld.setArticleTitle(article.getArticleTitle());
                articleOld.setArticleText(article.getArticleText());
                articleOld.setArticleClass(article.getArticleClass());
                articleOld.setArticleCommend(article.getArticleCommend());
                articleOld.setArticleStatus(article.getArticleStatus());
                articleOld.setArticleDescribe(article.getArticleDescribe());
                //组装admin
//                admin = adminDao.findByAdminName(article.getAdmin().getAdminName());
//                article.setAdmin(admin);
//                System.out.println(article);
                articleDao.save(articleOld);
                return "<script>alert('操作成功！')</script>";
            case 3:
                //删除
                if (article.getId() == null){
                    return "<script>alert('删除需要传入删除的文章id！')</script>";
                }
                Article delectArticle = articleDao.findOne(article.getId());
//                delectArticle.setStatus();
                articleDao.save(delectArticle);
                return "<script>alert('操作成功！')</script>";
        }
        return "redirect:error.html";
    }

//    @GetMapping("/article-add.html")
//    public ModelAndView addArticle(){
//        return new ModelAndView("admin/article-add");
//    }
//    @GetMapping("/article-update.html")
//    public ModelAndView updateArticle(Integer id, HttpServletRequest request){
//        ModelAndView model = new ModelAndView("admin/article-add");
//        Article article = articleDao.findOne(id);
//        model.addObject("request",request);
//        model.addObject("article", article);
//        return model;
//    }
//
//

    @RequestMapping("/articlelist")
    public String getArticleList(@RequestParam(value = "page", defaultValue = "1") Integer page){
        PageRequest pageRequest = new PageRequest(page-1,10);
        Page<Article> pages = articleDao.findAll(pageRequest);
        List<Article> articleList = pages.getContent();


        /* 创建消息对象 */
        MsgVo<ArticleListVo> msg = new MsgVo<ArticleListVo>();

        msg.setApiCode(0);

        msg.setApiMessage("ok");



        /* 创建msg.data对象 */
        ArticleListVo articleListVo = new ArticleListVo();


        JSONArray articleListVos = new JSONArray();

        for (Article article : articleList){

            ArticleVo articleVo = new ArticleVo();

            articleVo.setId(article.getId());
//            articleVo.setClazz(article.getArticleClass().getClassName());
//            articleVo.setCommend(article.getArticleCommend());
//            articleVo.setDescribe(article.getArticleDescribe());
//            articleVo.setStatus(article.getStatus().getValue());
//            articleVo.setText(article.getArticleText());
//            articleVo.setTime(article.getArticleTime());
            articleVo.setTitle(article.getArticleTitle());

            System.out.println(articleVo);
            articleListVos.add(JSONObject.fromObject(articleVo));
        }


        articleListVo.setArticles(JSONArray.fromObject(articleListVos));
        System.gc();

        msg.setData(articleListVo);

        JSONObject json = new JSONObject();
        json = JSONObject.fromObject(msg);
        System.out.println("=======>");
        System.out.println(json);
        return json.toString();
    }


    @RequestMapping("/get_article")
    public String getArticle(Integer id){
        Article article = articleDao.findOne(id);
        return JSONObject.fromObject(article).toString();
    }







}
