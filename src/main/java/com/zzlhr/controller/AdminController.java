package com.zzlhr.controller;

import com.google.gson.Gson;
import com.zzlhr.entity.Admin;
import com.zzlhr.entity.Article;
import com.zzlhr.entity.MenuDo;
import com.zzlhr.enums.LoginEnum;
import com.zzlhr.enums.ResultErrorStatus;
import com.zzlhr.enums.ResultSuccessStatus;
import com.zzlhr.service.AdminService;
import com.zzlhr.service.ArticleService;
import com.zzlhr.service.MenuService;
import com.zzlhr.util.CookieUtils;
import com.zzlhr.util.JSONUtil;
import com.zzlhr.util.NetworkUtil;
import com.zzlhr.util.RequestUtil;
import lombok.extern.slf4j.Slf4j;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
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


    @RequestMapping("/login.do")
    public String login(String admin, String password, HttpServletRequest request, HttpServletResponse response) throws IOException, NoSuchAlgorithmException {
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
    public ModelAndView login(){
        ModelAndView mv = new ModelAndView("admin/login");
        return mv;
    }
}
