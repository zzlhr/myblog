package com.zzlhr.service;

import com.zzlhr.entity.Admin;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.Map;

/**
 * Created by 刘浩然 on 2017/8/17.
 */
public interface AdminService {

    Map<String, String> deleteAdmin(String adminName, String ip);

    Admin updateAdmin(Admin admin, String ip);


    /** 通过adminname和email查询管理员 */
    Admin findAdmin(String admin);

    /** 登录 */
    Map login(String admin, String password, String ip) throws UnsupportedEncodingException, NoSuchAlgorithmException;

    Admin updateAdminPassword(String admin, String oldPassword, String newPassword, String ip);

    Admin addAdmin(Admin admin, String ip);
}
