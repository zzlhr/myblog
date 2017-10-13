package com.zzlhr.controller;

import com.google.gson.Gson;
import com.zzlhr.entity.*;
import com.zzlhr.enums.LoginEnum;
import com.zzlhr.enums.ResultErrorStatus;
import com.zzlhr.enums.ResultSuccessStatus;
import com.zzlhr.service.AdminService;
import com.zzlhr.service.ArticleService;
import com.zzlhr.service.FriendLinkService;
import com.zzlhr.service.MenuService;
import com.zzlhr.util.*;
import com.zzlhr.vo.LayuiUploadDataVo;
import com.zzlhr.vo.LayuiUploadVo;
import javassist.compiler.ast.Keyword;
import lombok.extern.slf4j.Slf4j;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static com.zzlhr.enums.ResultErrorStatus.UNKNOWN_ERROR;
import static java.lang.String.valueOf;

/**
 * Created by 刘浩然 on 2017/7/27.
 */
@Controller
@RequestMapping("/admin")
@Slf4j
public class AdminController {

    @Autowired
    private AdminService adminService;

    @Autowired
    private MenuService menuService;

    @Autowired
    private ArticleService articleService;

    @Autowired
    private FriendLinkService friendLinkService;


    @Autowired
    private MyApp myApp;


    Gson gson = new Gson();

    private Map<String, Object> errorRequst = new HashMap<>();

    public AdminController() {
        errorRequst.put("code", valueOf(UNKNOWN_ERROR.getCode()));
        errorRequst.put("msg",UNKNOWN_ERROR.getMsg());
    }


    @ResponseBody
    @RequestMapping("/article-add.do")
    public String addArticle(String articelTitile, String articleKeyword,
                             String articleDescribe, String articleClass,
                             Integer articleCommend, Integer articleStatus,
                             String articleText, HttpServletRequest request){
        Article article = new Article();
        article.setArticleTitle(articelTitile);
        article.setArticleKeyword(articleKeyword);
        article.setArticleDescribe(articleDescribe);
        article.setArticleClass(articleClass);
        article.setArticleCommend(articleCommend);
        article.setArticleStatus(articleStatus);
        article.setArticleText(articleText);
        article.setArticleAdmin(CookieUtils.getCookieValue(request,"admin"));
        Article result = articleService.saveArticle(article);
        return JSONObject.fromObject(result).toString();
    }



    @ResponseBody
    @RequestMapping("/admin_add.do")
    public String addAdmin(String name, String password, String email, HttpServletRequest request){
        String ip;
        try {
            ip = NetworkUtil.getIpAddress(request);
        } catch (IOException e) {
            e.printStackTrace();
            ip = "未知";
        }
        log.info("【添加管理员】 /admin/admin_add.do  name={}, password={}, email={}, ip={}", name, password, email, ip);

        try {
            Admin admin = new Admin();
            admin.setAdminName(name);
            admin.setAdminPassword(password);
            admin.setAdminEmail(email);
            return gson.toJson(adminService.addAdmin(admin, ip));
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return gson.toJson(errorRequst);
    }


    @RequestMapping("/admin_updatepassword.do")
    public String updatePassword(String old_password, String new_password, String next_password, HttpServletRequest request) throws IOException, NoSuchAlgorithmException {
        //判断两次密码是否为空
        if (old_password == null || new_password == null || next_password == null){
            errorRequst.replace("code", ResultErrorStatus.ADMIN_INPUTPASSWORDMUSTNOTNULL.getCode());
            errorRequst.replace("msg", ResultErrorStatus.ADMIN_INPUTPASSWORDMUSTNOTNULL.getMsg());
            return gson.toJson(errorRequst);
        }
        //判断两次密码是否相同
        if(!new_password.equals(next_password)){
            errorRequst.replace("code", ResultErrorStatus.ADMIN_TWOINPUTPASSWORDNOTEQUAL.getCode());
            errorRequst.replace("msg", ResultErrorStatus.ADMIN_TWOINPUTPASSWORDNOTEQUAL.getMsg());
            return gson.toJson(errorRequst);
        }

        Cookie[] cookies = request.getCookies();
        System.out.println(cookies);
        String adminName = RequestUtil.getCookie(cookies, "admin_name");
        //如果无法获取adminName，重定向到登录页
        if (adminName == null){
            return "redirect:/login.html";
        }
        return gson.toJson(adminService.updateAdminPassword(adminName,old_password, new_password, NetworkUtil.getIpAddress(request)));

    }


    @RequestMapping("/admin_list.json")
    public String adminList(
            @RequestParam(name = "admin_name", required = false, defaultValue = "") String admin_name,
            @RequestParam(value = "page", defaultValue = "1") Integer page,
            HttpServletRequest request){
        errorRequst = ResultSuccessStatus.getResultSuccessMap();
        try {
            errorRequst.put("data",
                    adminService.findAdminByAdminNameLike(admin_name+"%",
                            new PageRequest(page-1,10)));

        }catch (Exception e){
            errorRequst.put("code", ResultErrorStatus.UNKNOWN_ERROR.getCode());
            errorRequst.put("msg", ResultErrorStatus.UNKNOWN_ERROR.getMsg());
        }
        return gson.toJson(errorRequst);
    }


    /**
     * 查看管理员详情
     * @param id       管理员id
     * @return
     * {
     *     msg: "操作成功！",
     *     code: 0,
     *     data: {
     *        id: 10003,
     *        adminName: "test",
     *        adminEmail: "test@qq.com",
     *        adminIp: "175.188.159.139",
     *        adminAddress: "河南省-郑州市"
     *
     * }
     */
    @RequestMapping("/admin_details.do")
    public String adminDetails(Integer id){
        return gson.toJson(adminService.findAdminById(id));
    }


    @ResponseBody
    @RequestMapping("/menulist.do")
    public String menuList(String token, HttpServletRequest request){
       return JSONArray.fromObject(adminService.getMenuList(token)).toString();
    }


    @RequestMapping("/menu_add.do")
    public String menuAdd(MenuDo menu){
        System.out.println(menu);
        return gson.toJson(menu);
    }


    @RequestMapping("/login.html")
    public ModelAndView pageLogin(){
        ModelAndView mv = new ModelAndView("admin/login");
        return mv;
    }

    @RequestMapping("/login.do")
    public String login(String admin, String password,
                        HttpServletRequest request, HttpServletResponse response) throws IOException, NoSuchAlgorithmException {
        JSONObject json = JSONObject.fromObject(adminService.login(admin, password, NetworkUtil.getIpAddress(request)));
        if (json.getInt("code") == LoginEnum.SUCCESS.getCode()){
            /*登录名*/
            response.addCookie(new Cookie("admin", json.getString("admin")));
            /*token*/
            response.addCookie(new Cookie("token", json.getString("token")));
            /*登录时间*/
            response.addCookie(new Cookie("lt", String.valueOf(new Date().getTime())));
            return "redirect:/admin/index.html";
        }
//        return gson.toJson(json);
        return "<script>alert(\"用户名或密码错误!\");</script>";
    }

    @RequestMapping("/index.html")
    public ModelAndView pageIndex(HttpServletRequest request){
        ModelAndView mv = new ModelAndView("admin/index");
        mv = init(mv,request);
        return mv;
    }


    @RequestMapping(value = "/findArticleLst.html")
    public ModelAndView findArticleLst(
            @RequestParam(required = false, name = "page",defaultValue = "1") Integer page,
            @RequestParam(required = false, name = "keyword", defaultValue = "") String keyword,
            HttpServletRequest request){
        ModelAndView mv = new ModelAndView("admin/findArticleLst");
        Page<Article> result = articleService.getArticleList("%"+keyword+"%",page);
        mv.addObject("articleList", JSONUtil.formatDate(JSONArray.fromObject(result.getContent()),
                new String[]{"updateTime", "createTime"}, "yyyy-MM-dd HH:mm:ss")
                .toString());
        mv.addObject("count",result.getTotalElements());//总记录数
        mv.addObject("totalPage", result.getTotalPages());//总页数
        mv.addObject("page",page);//当前页数
        mv = init(mv,request);
        return mv;
    }

    @GetMapping("/addArticle.html")
    public ModelAndView page_addArticle(HttpServletRequest request){
        ModelAndView mv = new ModelAndView("admin/addArticle");
        mv = init(mv, request);
        return mv;
    }

    /**
     * 添加文章接口
     * @param title     标题
     * @param clazz     分类
     * @param commend   推荐
     * @param keyword   关键字
     * @param describe  描述
     * @param content   内容
     * @param request
     * @return
     */
    @PostMapping("/addArticle.html")
    public ModelAndView addArticle(String title, String clazz,
                                   Integer commend,
                                   @RequestParam(required = false, defaultValue = "off", name = "status")
                                               String status, String keyword, String describe,
                                   String content, HttpServletRequest request){
        ModelAndView mv = new ModelAndView("admin/result");

        Article article = new Article();
        article.setArticleTitle(title);
        article.setArticleClass(clazz);
        article.setArticleCommend(commend);
        article.setArticleKeyword(keyword);
        article.setArticleDescribe(describe);
        article.setArticleText(content);
        article.setArticleAdmin(CookieUtils.getCookieValue(request,"admin"));
        if ("on".equals(status)){
            article.setArticleStatus(0);
        }else {
            article.setArticleStatus(1);
        }
        try {
            articleService.saveArticle(article);
        }catch (Exception e){
            mv.addObject("message","添加文章失败:"+e.getMessage());
            mv.addObject("href", "javascript:history.back(-1)");
            return mv;
        }
        mv.addObject("message", "添加文章成功");
        mv.addObject("href", "findArticleLst.html");

        mv = init(mv, request);
        return mv;
    }


    @GetMapping("/updateArticle.html")
    public ModelAndView page_updateArticle(Integer id, HttpServletRequest request){

        ModelAndView mv = new ModelAndView("admin/updateArticle");

        Article article = articleService.getArticleDetails(id);

        String articelJson = JSONUtil.formatDate(JSONObject.fromObject(article),
                new String[]{"updateTime", "createTime"}, "yyyy-MM-dd HH:mm:ss")
                .toString();

        mv.addObject("article", articelJson);
        mv = init(mv, request);
        return mv;
    }


    @PostMapping("/updateArticle.html")
    public ModelAndView updateArticle(Integer id, String title, String clazz,
                                   Integer commend,
                                   @RequestParam(required = false, defaultValue = "off", name = "status")
                                          String status, String keyword, String describe,
                                   String content, HttpServletRequest request){
        ModelAndView mv = new ModelAndView("admin/result");

        Article article = articleService.getArticleDetails(id);
        article.setArticleTitle(title);
        article.setArticleClass(clazz);
        article.setArticleCommend(commend);
        article.setArticleKeyword(keyword);
        article.setArticleDescribe(describe);
        article.setArticleText(content);
        article.setArticleAdmin(CookieUtils.getCookieValue(request,"admin"));
        if ("on".equals(status)){
            article.setArticleStatus(0);
        }else {
            article.setArticleStatus(1);
        }

        try {
            articleService.saveArticle(article);
        }catch (Exception e){
            mv.addObject("message","修改文章失败:"+e.getMessage());
            mv.addObject("href", "javascript:history.back(-1)");
            return mv;
        }
        mv.addObject("message", "修改文章成功");
        mv.addObject("href", "findArticleLst.html");

        mv = init(mv, request);
        return mv;
    }


    @GetMapping("/findFriendLinkList.html")
    public ModelAndView page_findFriendLinkList(HttpServletRequest request){
        ModelAndView mv = new ModelAndView("admin/findFriendLinkList");
        mv = init(mv, request);
        List<FriendLink> friendLinks = friendLinkService.getAllFrinedLink();
        String friendLinksJson = JSONUtil.formatDate(JSONArray.fromObject(friendLinks),
                new String[]{"updateTime", "createTime"}, "yyyy-MM-dd HH:mm:ss")
                .toString();
        mv.addObject("friendLinks", friendLinksJson);
        return mv;
    }







    /**
     * 添加文章富文本对接上传接口
     * @param file
     * @param request
     * @return
     */
    @ResponseBody
    @PostMapping("/addArticleUpdate")
    public String addArticleUpdate(MultipartFile file, HttpServletRequest request){

        LayuiUploadVo uploadVo = new LayuiUploadVo();
        LayuiUploadDataVo uploadDataVo = new LayuiUploadDataVo();

        String contentType = file.getContentType();
//        String fileName = file.getOriginalFilename();
        String fileName = FileUtil.makeRandomName() + "."
                + FileUtil.GetFileSuffix(contentType);
//        String filePath = request.getSession().getServletContext().getRealPath("articleImage/");
        String filePath = myApp.getArticle().get("uploadpath");
        try {
            FileUtil.uploadFile(file.getBytes(), filePath, fileName);
        } catch (Exception e) {
            // TODO: handle exception
            uploadVo.setCode(1);
            uploadVo.setMsg(e.getMessage());
        }

        uploadDataVo.setSrc("../articleImage/"+fileName);
        uploadDataVo.setTitle(fileName);
        uploadVo.setCode(0);
        uploadVo.setMsg("上传成功");
        uploadVo.setData(uploadDataVo);

        //返回json
        return JSONObject.fromObject(uploadVo).toString();
    }



    public ModelAndView init(ModelAndView mv, HttpServletRequest request){
        //查询菜单
        String token = CookieUtils.getCookie(request, "token").getValue();
        mv.addObject("menus", JSONArray.fromObject(adminService.getMenuList(token)).toString());

        return mv;
    }



}
