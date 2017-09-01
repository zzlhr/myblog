package com.zzlhr.service;
import com.zzlhr.entity.AdminGroup;
import com.zzlhr.entity.MenuDo;
import com.zzlhr.vo.PageListData;

import java.util.Map;
/**
 * Created by 刘浩然 on 2017/9/1.
 */
public interface AuthorityService {

    /** 为用户设置所属权限组 */
    Map<String, Object> setAdminGroup(String admin, Integer group);



    /** 为权限组设置权限值 */

    /* 10 进制权限值 */
    Map<String, Object> setGroupValue(Integer group, Integer Menu, Integer groupValue);

    /** 2 进制权限值 */
    Map<String, Object> setGroupValue(Integer group, Integer Menu, String groupValue);




    /** 添加权限组 */
    Map<String, Object> addGroup(AdminGroup group);



    /** 修改权限组 */
    Map<String, Object> updateGroup(AdminGroup group);



    /** 删除权限组 */
    Map<String, Object> delectGroup(Integer groupId);


    /** 获取Menu菜单列表 */
    PageListData<AdminGroup> getGroupList(String groupName, Integer status, Integer page);

    /** 添加菜单 */
    Map<String, Object> addMenu(MenuDo menuDo);


    /** 修改菜单 */
    Map<String, Object> updateMenu(MenuDo menuDo);



    /** 删除菜单 */
    Map<String, Object> delectMenu(Integer menuId);



    /** 是否有权限 */
    Boolean isHaveAuthority(String uri, String admin, String token);


}
