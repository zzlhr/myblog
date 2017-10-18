package com.zzlhr.controller;

import com.google.gson.Gson;
import com.sun.tools.internal.ws.wscompile.AuthInfo;
import com.zzlhr.dao.AdminGroupDao;
import com.zzlhr.dao.AdminGroupinfoDao;
import com.zzlhr.dao.AuthModelDao;
import com.zzlhr.dao.AuthOperateDao;
import com.zzlhr.entity.*;
import com.zzlhr.enums.LoginEnum;
import com.zzlhr.enums.ResultErrorStatus;
import com.zzlhr.enums.ResultSuccessStatus;
import com.zzlhr.service.*;
import com.zzlhr.util.*;
import com.zzlhr.vo.AuthTreeVo;
import com.zzlhr.vo.LayuiUploadDataVo;
import com.zzlhr.vo.LayuiUploadVo;
import javassist.compiler.ast.Keyword;
import jdk.nashorn.internal.objects.annotations.Getter;
import lombok.extern.slf4j.Slf4j;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.omg.CORBA.Request;
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
import java.util.*;

import static com.zzlhr.enums.ResultErrorStatus.UNKNOWN_ERROR;
import static java.lang.String.valueOf;

/**
 * Created by 刘浩然 on 2017/7/27.
 */
@SuppressWarnings("AlibabaAvoidNewDateGetTime")
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
    private AuthorityService authorityService;


    @Autowired
    private AdminGroupService adminGroupService;


    @Autowired
    private AdminGroupinfoDao adminGroupinfoDao;


    @Autowired
    private AdminGroupDao adminGroupDao;

    @Autowired
    private AuthOperateDao authOperateDao;
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
            response.addCookie(new Cookie("lt", String.valueOf(System.currentTimeMillis())));
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


    /**
     * 友链列表
     * @param request
     * @return
     */
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
     * 权限列表
     * @param groupId 权限组id
     * @return
     */
    @GetMapping("/findAuth.html")
    public ModelAndView page_findAuth(@RequestParam(required = false, defaultValue = "1") Integer groupId, HttpServletRequest request){
        ModelAndView mv = new ModelAndView("admin/findAuth");

        List<AdminGroup> groupList = authorityService.getAllGroupList();
        String groups = JSONArray.fromObject(groupList).toString();
        mv.addObject("groups", groups);


        List<AuthTreeVo> authTreeVos = authorityService.getAuths();
        String authTree = JSONArray.fromObject(authTreeVos).toString();
        mv.addObject("authTree", authTree);

        //拥有的权限
        List<AuthTreeVo> authTreeVos1 = authorityService.getAuths(groupId);
        String authTree1 = JSONArray.fromObject(authTreeVos1).toString();
        mv.addObject("possessAuth", authTree1);


        mv.addObject("groupId", groupId);



        mv = init(mv, request);
        return mv;
    }



    @GetMapping("/addAuth.html")
    public ModelAndView pageAddAuth(HttpServletRequest request){
        ModelAndView mv = new ModelAndView("admin/addAuth");

        List<AuthTreeVo> authTreeVos = authorityService.getAuths();
        String authTree = JSONArray.fromObject(authTreeVos).toString();
        mv.addObject("authTree", authTree);

        mv = init(mv, request);
        return mv;
    }

    @PostMapping("/addAuth.html")
    public ModelAndView addAuth(String name, HttpServletRequest request) throws IOException {
        ModelAndView mv = new ModelAndView("admin/result");
        mv = init(mv, request);
        if (name != ""){
            AdminGroup adminGroup = new AdminGroup();
            adminGroup.setGroupName(name);
            adminGroup.setGroupStatus(0);
            int groupId = adminGroupService.addGroup(adminGroup);
            if (groupId!=0){
                mv.addObject("message", "添加成功！");
                mv.addObject("href", "updateAuth.html?groupId=" + groupId);
                return mv;
            }else {
                mv.addObject("message", "添加失败！");
                mv.addObject("href", "addAuth.html");
                return mv;
            }
        }
        mv.addObject("message", "添加失败！");
        mv.addObject("href", "addAuth.html");
        return mv;
    }

    @GetMapping("/updateAuth.html")
    public ModelAndView pageUpdateAuth(Integer groupId,HttpServletRequest request){
        ModelAndView mv = new ModelAndView("/admin/updateAuth");

        List<AdminGroup> groupList = authorityService.getAllGroupList();
        String groups = JSONArray.fromObject(groupList).toString();
        mv.addObject("groups", groups);

        mv.addObject("groupId", groupId);

        List<AuthTreeVo> authTreeVos = authorityService.getAuths();
        String authTree = JSONArray.fromObject(authTreeVos).toString();
        mv.addObject("authTree", authTree);

        //拥有的权限
        List<AuthTreeVo> authTreeVos1 = authorityService.getAuths(groupId);
        String authTree1 = JSONArray.fromObject(authTreeVos1).toString();
        mv.addObject("possessAuth", authTree1);
        mv = init(mv, request);
        return mv;
    }

    @ResponseBody
    @PostMapping("/updateAuth.html")
    public String updateAuth(String auths, Integer groupId){
        JSONArray authList = JSONArray.fromObject(auths);
        System.out.println(authList);
        List<Map> infoList = new ArrayList<>();
        for (Object auth : authList){
            JSONObject json = JSONObject.fromObject(auth);
            int pid = json.getInt("pid");
            int id = json.getInt("id");

            if (pid == 0){
                Map map = new HashMap();
                map.put("modelId", id);
                List list = new ArrayList<>();
                map.put("funcs", list);
                infoList.add(map);
                continue;
            }
            int a = 0;

            for (Map info : infoList){
                if (pid == (int)info.get("modelId")){
                    List list = (List) info.get("funcs");
                    list.add(id - 10000);
                    info.put("funcs", list);
                    a = 1;
                    break;
                }

            }
            if (a == 1){
                continue;
            }
            Map map = new HashMap();
            map.put("modelId", pid);
            List list = new ArrayList<>();
            list.add(id - 10000);
            map.put("funcs", list);
            System.out.println(infoList);
        }

        List<AdminGroupinfo> list = adminGroupinfoDao.findAdminGroupinfosByGroupId(groupId);

        List<Integer> infoIdList = new ArrayList<>();
        for (Map info : infoList){
            infoIdList.addAll((List)info.get("funcs"));
        }
        System.out.println(infoIdList);
        List<AuthOperate> operates
                = authOperateDao.findAll(infoIdList);



        for (Map info : infoList){
            int ye = 0;
            for (AdminGroupinfo item : list){
                if (item.getAuthModelId() == (Integer) info.get("modelId")){
                    List<Integer> funcs = (List<Integer>) info.get("funcs");
                    int valueBin = 0;
                    for (Integer func : funcs){
                        System.out.println(func);
                        for (AuthOperate operate : operates){
                            if (operate.getId() == func){
                                valueBin += 1 * Math.pow(10, operate.getOperateSite());
                                System.out.println(valueBin);
                            }
                        }
                    }
                    int value = Integer.parseInt(String.valueOf(valueBin),2);
                    item.setGroupValue(value);
                    ye = 1;
                }
            }

            if (ye == 1){
                continue;
            }
            AdminGroupinfo adminGroupinfo = new AdminGroupinfo();

            adminGroupinfo.setAuthModelId((Integer) info.get("modelId"));
            adminGroupinfo.setGroupId(groupId);




            List<Integer> funcs = (List<Integer>) info.get("funcs");
            int valueBin = 0;
            for (Integer func : funcs){
                System.out.println(func);
                for (AuthOperate operate : operates){
                    if (operate.getId() == func){
                        valueBin += 1 * Math.pow(10, operate.getOperateSite());
                        System.out.println(valueBin);
                    }
                }
            }
            int value = Integer.parseInt(String.valueOf(valueBin),2);
            adminGroupinfo.setGroupValue(value);
            list.add(adminGroupinfo);
        }


        adminGroupinfoDao.save(list);
        return "操作成功！";
    }


    @ResponseBody
    @GetMapping("/delectAuth.html")
    public String delectAuth(Integer groupId){
        AdminGroup adminGroup = adminGroupDao.findOne(groupId);
        adminGroup.setGroupStatus(1);
        adminGroupDao.save(adminGroup);
        return "<script>alert(\"已禁用权限组！\")</script>";
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
        String fileName = FileUtil.makeRandomName() + "."
                + FileUtil.GetFileSuffix(contentType);
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
