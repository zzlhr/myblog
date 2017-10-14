package com.zzlhr.service;

import com.zzlhr.entity.Admin;
import com.zzlhr.vo.MenuVo;
import com.zzlhr.vo.PageListData;
import org.springframework.data.domain.PageRequest;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.List;
import java.util.Map;

/**
 * Created by 刘浩然 on 2017/8/17.
 */
public interface AdminService {


    Map<String, Object> deleteAdmin(String adminName, String ip);


//    Map<String, Object> updateAdmin(Admin admin, String ip);


    /** 通过adminname和email查询管理员 */
    Admin findAdminList(String admin);

    /** 登录 */
    Map<String, Object> loginIn(String admin, String password, String ip) throws UnsupportedEncodingException, NoSuchAlgorithmException;

    /** 登出 */
    Map<String, Object> loginOut(String admin, String token, String ip) throws UnsupportedEncodingException, NoSuchAlgorithmException;


    Admin findAdmin(String admin);

    Map<String, Object> login(String admin, String password, String ip) throws UnsupportedEncodingException, NoSuchAlgorithmException;

    Map<String, Object> updateAdminPassword(String admin, String oldPassword, String newPassword, String ip) throws UnsupportedEncodingException, NoSuchAlgorithmException;


    Map<String, Object> addAdmin(Admin admin, String ip) throws UnsupportedEncodingException, NoSuchAlgorithmException;


    PageListData findAdminByAdminNameLike(String adminName, PageRequest pageRequest);


    Map<String, Object> findAdminById(Integer id);


    /** 获取菜单 */
    List<MenuVo> getMenuList(String adminToken);

    /**
     * 验证用户登录
     * @param request
     * @return true为验证成功，false为失败，需要后续跳转到登录页面。
     */
    Boolean verifyLogin(HttpServletRequest request);



}
