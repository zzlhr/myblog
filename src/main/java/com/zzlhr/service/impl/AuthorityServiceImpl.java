package com.zzlhr.service.impl;

import com.zzlhr.dao.*;
import com.zzlhr.entity.*;
import com.zzlhr.enums.ResultErrorStatus;
import com.zzlhr.enums.ResultSuccessStatus;
import com.zzlhr.enums.StatusEnum;
import com.zzlhr.service.AdminService;
import com.zzlhr.service.AuthorityService;
import com.zzlhr.util.AuthorityUtil;
import com.zzlhr.util.CookieUtils;
import com.zzlhr.vo.AuthTreeVo;
import com.zzlhr.vo.PageListData;
import org.apache.http.auth.AUTH;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.Transactional;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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
    @Autowired
    private MyApp myApp;
    @Autowired
    private AuthOperateDao authOperateDao;
    @Autowired
    private AuthModelDao authModelDao;





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
    public List<AdminGroup> getAllGroupList() {
        return adminGroupDao.findAll();
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
    public List<AuthTreeVo> getAuths() {

        //1. 获取models
        List<AuthModel> models = authModelDao.findAll();
        List<AuthOperate> authOperates = authOperateDao.findAll();

        List<AuthTreeVo> authTreeVos = new ArrayList<>();
        for (AuthModel model : models){
            authTreeVos.add(new AuthTreeVo(
                    model.getModelName(),
                    model.getId(),
                    0, false));
        }

        int i = 0;
        for (AuthOperate authOperate : authOperates){
            authTreeVos.add(new AuthTreeVo(
                    authOperate.getOperateName(),
                    authOperate.getId()+10000,
                    authOperate.getOperateModel(),
                    false
            ));
        }


        return authTreeVos;
    }

    @Override
    public List<AuthTreeVo> getAuths(Integer groupId) {
        //1. 通过groupId获取所有GroupInfo
        List<AdminGroupinfo> groupinfos =
                adminGroupinfoDao.findAdminGroupinfosByGroupId(groupId);
        List<Map> authList = new ArrayList<>();
        //创建一个map存放需要查询的操作
        //2. 通过groupinfo
        List<AuthOperate> operates = new ArrayList<>();
        for (AdminGroupinfo groupinfo : groupinfos){
            int modelId = groupinfo.getAuthModelId();
            byte[] valueByte = AuthorityUtil.decimalToBinary(groupinfo.getGroupValue());
            List<Integer> auths = new ArrayList<>();
            //计次
            int i = 0;
            for (byte bt : valueByte){
                if ((int)bt == 49){
                    auths.add(i);
                }
                i++;
            }
            operates.addAll(authOperateDao.findAuthOperateByOperateModelAndOperateSiteIn(modelId, auths));
        }
        List<AuthTreeVo> result = new ArrayList<>();
        for (AuthOperate authOperate : operates){
            result.add(new AuthTreeVo(authOperate.getOperateName(),
                    authOperate.getId()+10000,
                    authOperate.getOperateModel(),
                    true,
                    true));
        }


        return result;
    }


    @Override
    public Boolean isHaveAuthority(String admin, String uri) throws IOException {
        //1. 通过请求地址查询auth_operate表中的对应的operate_codename字段得到对应的操作记录
        //1.1 解析uri得到操作方法名
        String codeName = parseCodeName(uri);

        AuthOperate authOperate = authOperateDao.findAuthOperateByOperateCodename(codeName);

        //如果为查询到方法对象说明验证权限失败
        if (authOperate == null){
            return false;
        }

        //2. 通过auth_operate记录中的operate_model关联到auth_model表并获取model对象
        Integer modelId = authOperate.getOperateModel();

        AuthModel authModel = authModelDao.getOne(modelId);

        //3. 通过admin对象获取admin_group
        Admin adminObj = adminDao.findByAdminName(admin);

        Integer adminGroupId = adminObj.getAdminGroup();


        //4. 通过admin_group的 group_id和model_id 获取admin_groupinfo
        AdminGroupinfo adminGroupinfo = adminGroupinfoDao.
                findAdminGroupinfoByAuthModelIdAndGroupId(modelId, adminGroupId);

        //5. 获取到groupinfo的group_value权限值
        Integer groupValue = adminGroupinfo.getGroupValue();


        //6. 通过权限值和操作对象的位置得出是否拥有权限.
        //获取位置
        int site = authOperate.getOperateSite();
        if (AuthorityUtil.isHaveAuthority(groupValue, site) == 1){
            return true;
        }
        return false;
    }



    public String parseCodeName(String uri){
        //分割「/」
        String[] routes = uri.split("/");

        //获取请求接口/页面
        String func = routes[routes.length-1];

        //通过「.」截取方法
        //ps：这个\\.是为了截取. 进行的转义。
        String codeName = func.split("\\.")[0];

        return codeName;
    }


}
