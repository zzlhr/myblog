package com.zzlhr.controller;

import com.google.gson.Gson;
import com.zzlhr.entity.Admin;
import com.zzlhr.enums.ResultErrorStatus;
import com.zzlhr.enums.ResultSuccessStatus;
import com.zzlhr.service.AdminService;
import com.zzlhr.util.NetworkUtil;
import com.zzlhr.util.RequestUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Map;

import static com.zzlhr.enums.ResultErrorStatus.UNKNOWN_ERROR;
import static java.lang.String.valueOf;

/**
 * Created by 刘浩然 on 2017/7/27.
 */
@RestController
@RequestMapping("/admin")
@Slf4j
public class AdminController {

    @Autowired
    private AdminService adminService;

    Gson gson = new Gson();

    private Map<String, Object> errorRequst = new HashMap<>();

    public AdminController() {
        errorRequst.put("code", valueOf(UNKNOWN_ERROR.getCode()));
        errorRequst.put("msg",UNKNOWN_ERROR.getMsg());
    }


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
    public String adminList(@RequestParam(name = "admin_name", required = false, defaultValue = "") String admin_name, @RequestParam(value = "page", defaultValue = "1") Integer page, HttpServletRequest request){
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







}
