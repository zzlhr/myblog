package com.zzlhr.service.impl;

import com.zzlhr.dao.AdminDao;
import com.zzlhr.dao.AdminGroupDao;
import com.zzlhr.dao.AdminGroupinfoDao;
import com.zzlhr.dao.MenuDoDao;
import com.zzlhr.entity.Admin;
import com.zzlhr.entity.AdminGroup;
import com.zzlhr.entity.AdminGroupinfo;
import com.zzlhr.entity.MenuDo;
import com.zzlhr.enums.ResultErrorStatus;
import com.zzlhr.enums.ResultSuccessStatus;
import com.zzlhr.enums.StatusEnum;
import com.zzlhr.service.AdminService;
import com.zzlhr.service.AuthorityService;
import com.zzlhr.util.AuthorityUtil;
import com.zzlhr.vo.PageListData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by 刘浩然 on 2017/9/1.
 */
@Service
public class AuthorityServiceImpl implements AuthorityService {

    @Autowired
    private AdminService adminService;
    @Autowired
    private AdminDao adminDao;
    @Autowired
    private MenuDoDao menuDoDao;
    @Autowired
    private AdminGroupDao adminGroupDao;
    @Autowired
    private AdminGroupinfoDao adminGroupinfoDao;

    Map<String, Object> result = new HashMap<>();

    @Override
    public Map<String, Object> setAdminGroup(String admin, Integer group) {
        Admin ad = adminService.findAdmin(admin);

        if (!adminGroupDao.exists(group)){
            /* 权限组不存在 */
            result.put("code", ResultErrorStatus.GROUP_NOTEXIST.getCode());
            result.put("msg", ResultErrorStatus.GROUP_NOTEXIST.getMsg());
            return result;
        }

        //权限组存在执行操作
        ad.setAdminGroup(group);
        adminDao.save(ad);
        return ResultSuccessStatus.getResultSuccessMap();
    }

    @Override
    public Map<String, Object> setGroupValue(Integer group, Integer Menu, Integer groupValue) {





        return null;
    }

    @Override
    public Map<String, Object> setGroupValue(Integer group, Integer Menu, String groupValue) {
        return null;
    }

    @Transactional
    @Override
    public Map<String, Object> addGroup(AdminGroup group) {
        //添加失败回滚事务
        try {
            adminGroupDao.save(group);
        }catch (Exception e){
            e.printStackTrace();
            return ResultErrorStatus.toMap(ResultErrorStatus.UNKNOWN_ERROR);
        }
        return ResultSuccessStatus.getResultSuccessMap();
    }

    @Override
    @Transactional
    public Map<String, Object> updateGroup(AdminGroup group) {
        if (group.getId() == 1){
            //禁止修改超级管理员权限
            return ResultErrorStatus.toMap(ResultErrorStatus.GROUP_PROHIBITMODIFYINGSUPERADMINISTRATORS);
        }
        try {
            adminGroupDao.save(group);
        } catch (Exception e){
            e.printStackTrace();
            return ResultErrorStatus.toMap(ResultErrorStatus.UNKNOWN_ERROR);
        }
        return ResultSuccessStatus.getResultSuccessMap();
    }

    @Override
    public Map<String, Object> delectGroup(Integer groupId) {
        if (groupId == 1){
            //禁止修改超级管理员权限
            return ResultErrorStatus.toMap(ResultErrorStatus.GROUP_PROHIBITMODIFYINGSUPERADMINISTRATORS);
        }

        try {
            //查询权限组
            AdminGroup group = adminGroupDao.findOne(groupId);
            if (group == null){
                //如果权限组未找到，返回权限组不存在
                return ResultErrorStatus.toMap(ResultErrorStatus.GROUP_NOTEXIST);
            }
            //存在修改状态为禁用
            group.setGroupStatus(1);
            //保存权限组
            adminGroupDao.save(group);
        } catch (Exception e){
            return ResultErrorStatus.toMap(ResultErrorStatus.UNKNOWN_ERROR);
        }


        return ResultSuccessStatus.getResultSuccessMap();
    }

    @Override
    public PageListData<AdminGroup> getGroupList(String groupName, Integer status, Integer page) {


        PageRequest pageRequest = new PageRequest(0,1);
        Page<AdminGroup> adminGroupPage = adminGroupDao.findAdminGroupByGroupNameLikeAndGroupStatus("%"+groupName+"%", status, pageRequest);

        return PageListData.getMap(adminGroupPage);
    }

    @Override
    @Transactional
    public Map<String, Object> addMenu(MenuDo menuDo) {

        try {
            menuDoDao.save(menuDo);
        }catch (Exception e){
            return ResultErrorStatus.toMap(ResultErrorStatus.UNKNOWN_ERROR);
        }

        return ResultSuccessStatus.getResultSuccessMap();
    }

    @Override
    public Map<String, Object> updateMenu(MenuDo menuDo) {

        try{
            menuDoDao.save(menuDo);
        }catch (Exception e){
            return ResultErrorStatus.toMap(ResultErrorStatus.UNKNOWN_ERROR);
        }

        return ResultSuccessStatus.getResultSuccessMap();
    }

    @Override
    @Transactional
    public Map<String, Object> delectMenu(Integer menuId) {
        try {
            MenuDo menuDo = menuDoDao.findOne(menuId);
            if (menuDo == null){
                return ResultErrorStatus.toMap(ResultErrorStatus.MENU_NOTEXIST);
            }

            menuDo.setMenuStatus(1);
        }catch (Exception e){
            return ResultErrorStatus.toMap(ResultErrorStatus.UNKNOWN_ERROR);
        }

        return ResultSuccessStatus.getResultSuccessMap();
    }

    @Override
    public Boolean isHaveAuthority(String uri, String admin, String token) {

        //查询uri确认菜单
        MenuDo menu = menuDoDao.findMenuDoByDoUriAndMenuStatus(uri, StatusEnum.USERING.getCode());

        if (menu == null){
            return false;
        }
        //查询父菜单 父菜单才是真正寸权限
        menu = menuDoDao.findOne(menu.getMenuFid());


        //查询admin，确认admin
        Admin admin1 = adminService.findAdmin(admin);
        if (admin1 == null){
            return false;
        }

        //验证登录
        if (!token.equals(admin1.getAdminToken())){
            return false;
        }

        //验证权限

        //查询权限值
        AdminGroupinfo groupValue =adminGroupinfoDao.findAdminGroupinfoByGroupIdAndMenuId(admin1.getAdminGroup(), menu.getId());

        if (AuthorityUtil.isHaveAuthority(groupValue.getGroupValue(), menu.getDoSerial()) == 1){
            return true;
        }
        return false;
    }
}
