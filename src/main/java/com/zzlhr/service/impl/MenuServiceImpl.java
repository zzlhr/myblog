package com.zzlhr.service.impl;

import com.zzlhr.dao.AdminGroupinfoDao;
import com.zzlhr.dao.MenuDoDao;
import com.zzlhr.entity.Admin;
import com.zzlhr.entity.AdminGroupinfo;
import com.zzlhr.entity.MenuDo;
import com.zzlhr.enums.ResultSuccessStatus;
import com.zzlhr.service.AdminService;
import com.zzlhr.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

/**
 * Created by 刘浩然 on 2017/9/2.
 */
@Service
public class MenuServiceImpl implements MenuService {

    @Autowired
    private MenuDoDao menuDoDao;

    @Autowired
    private AdminService adminService;

    @Autowired
    private AdminGroupinfoDao adminGroupinfoDao;

    @Override
    public Map<String, Object> getMenuList(String admin) {
        //获取用户
        Admin admin1 = adminService.findAdmin(admin);
        //获取用户权限组
        Integer groupId = admin1.getAdminGroup();
        //获取权限组记录
        List<AdminGroupinfo> adminGroupinfoList =
                adminGroupinfoDao.findAdminGroupinfosByGroupId(groupId);

        //带查询菜单列表
        List<Integer> selectMenuList = new ArrayList<>();

        //循环获取所有不为0的菜单
        for (AdminGroupinfo adminGroupinfo : adminGroupinfoList){
            if (adminGroupinfo.getGroupValue() > 0){
                selectMenuList.add(adminGroupinfo.getMenuId());
            }
        }

        //查询所有菜单
        List<MenuDo> menuDos = menuDoDao.findAll(selectMenuList);

        Map<String, Object> result = ResultSuccessStatus.getResultSuccessMap();
        result.put("data", menuDos);

        return result;
    }





}
