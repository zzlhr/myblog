package com.zzlhr.service;

import com.zzlhr.entity.Admin;
import com.zzlhr.vo.PageListData;
import org.springframework.data.domain.PageRequest;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.Map;

/**
 * Created by 刘浩然 on 2017/8/17.
 */
public interface AdminService {


    Map<String, Object> deleteAdmin(String adminName, String ip);


//    Map<String, Object> updateAdmin(Admin admin, String ip);


    /** 通过adminname和email查询管理员 */
    Admin findAdmin(String admin);

    /** 登录 */
    Map<String, Object> login(String admin, String password, String ip) throws UnsupportedEncodingException, NoSuchAlgorithmException;


    Map<String, Object> updateAdminPassword(String admin, String oldPassword, String newPassword, String ip) throws UnsupportedEncodingException, NoSuchAlgorithmException;


    Map<String, Object> addAdmin(Admin admin, String ip) throws UnsupportedEncodingException, NoSuchAlgorithmException;


    PageListData findAdminByAdminNameLike(String adminName, PageRequest pageRequest);


}
