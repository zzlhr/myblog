package com.zzlhr.service.impl;

import com.zzlhr.api.PassIpGetAddress;
import com.zzlhr.dao.*;
import com.zzlhr.entity.*;
import com.zzlhr.enums.*;
import com.zzlhr.service.AdminService;
import com.zzlhr.util.AuthorityUtil;
import com.zzlhr.util.BlogException;
import com.zzlhr.util.Code;
import com.zzlhr.vo.AdminListVo;
import com.zzlhr.vo.AdminVo;
import com.zzlhr.vo.MenuVo;
import com.zzlhr.vo.PageListData;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.*;

/**
 * Created by 刘浩然 on 2017/7/26.
 */
@Service
@Slf4j
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminDao dao;

    @Autowired
    private AdminGroupDao adminGroupDao;

    @Autowired
    private AdminGroupinfoDao adminGroupinfoDao;

    @Autowired
    private AuthModelDao authModelDao;

    @Autowired
    private AuthOperateDao authOperateDao;

    @Override
    public Map<String, Object> deleteAdmin(String adminName, String ip) {

        Admin admin = null;

        Map<String, Object> result = new HashMap<>();

        //查询管理员是否存在
        if ((admin = this.findAdmin(adminName)) == null){
            result.put("code", String.valueOf(ResultErrorStatus.ADMIN_NOTEXIST.getCode()));
            result.put("msg", ResultErrorStatus.ADMIN_NOTEXIST.getMsg());
            //不存在抛出异常
            throw new BlogException(ResultErrorStatus.ADMIN_NOTEXIST.getMsg());
        }


        //删除管理员
        dao.delete(admin.getId());


        result.put("code", "0");
        result.put("msg", "操作成功");
        return result;
    }

    @Override
    public Admin findAdminList(String admin) {
        return findAdmin(admin);
    }

    @Override
    public Map<String, Object> loginIn(String admin, String password, String ip) throws UnsupportedEncodingException, NoSuchAlgorithmException {
        return login(admin, password, ip);
    }

    @Override
    public Map<String, Object> loginOut(String admin, String token, String ip) throws UnsupportedEncodingException, NoSuchAlgorithmException {
        return null;
    }

    @Transactional
    Map<String, Object> updateAdmin(Admin admin, String ip) {
        log.info("【修改管理员】Admin={}",admin);
        Map result = new HashMap();
        //查询admin是否存在
        if (dao.findOne(admin.getId()) == null){
            result.put("code", ResultErrorStatus.ADMIN_NOTEXIST.getCode());
            result.put("msg", ResultErrorStatus.ADMIN_NOTEXIST.getMsg());
            return result;
        }

        //存在进行更新
        dao.save(admin);
        result.put("code", 0);
        result.put("msg", "操作成功!");
        return result;
    }

    @Override
    public Admin findAdmin(String admin) {

        Admin result = null;

        //存在返回admin
        if ((result = dao.findByAdminName(admin)) != null ||
                (result = dao.findByAdminEmail(admin)) != null ){
            return result;
        }

        //失败返回空
        return null;
    }

    @Override
    @Transactional
    public Map<String, Object> login(String admin, String password, String ip) throws UnsupportedEncodingException, NoSuchAlgorithmException {
        Map re = new HashMap<>();
        Admin result = null;
        //查询admin
        if ((result = this.findAdmin(admin)) == null){
            re.put("code",LoginEnum.USERNOTEXIST.getCode());
            re.put("msg", LoginEnum.USERNOTEXIST.getMsg());
            return re;
        }

        //判断账号状态是否可登录
        if (result.getAdminStatus() == AdminStatusEnum.EXCEPTION.getCode()){
            re.put("code",LoginEnum.ADMINEXCEPTION.getCode());
            re.put("msg", LoginEnum.ADMINEXCEPTION.getMsg());
            return re;
        } else if (result.getAdminStatus() == AdminStatusEnum.NOTLOGIN.getCode()){
            re.put("code",LoginEnum.NOTLOGIN.getCode());
            re.put("msg", LoginEnum.NOTLOGIN.getMsg());
            return re;
        }


        //验证密码
        if (!result.getAdminPassword().equals(Code.EncoderByMd5(password))){
            re.put("code",LoginEnum.PASSWORDERROR.getCode());
            re.put("msg", LoginEnum.PASSWORDERROR.getMsg());
            return re;
        }

        //更新ip
        result.setAdminIp(ip);

        //查询ip地址
        try {
            result.setAdminAddress(PassIpGetAddress.getAddress(ip));
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

        //生成token
        String token = Code.EncoderByMd5(UUID.randomUUID().toString());
        result.setAdminToken(token);


        //保存管理员
        dao.save(result);

        //写日志
        log.info("【管理员登陆】Admin={}",result);

        re.put("code",LoginEnum.SUCCESS.getCode());
        re.put("msg", LoginEnum.SUCCESS.getMsg());
        re.put("token", token);
        re.put("admin",admin);
        return re;
    }


    @Override
    public Map<String, Object> updateAdminPassword(String admin, String oldPassword, String newPassword, String ip) throws UnsupportedEncodingException, NoSuchAlgorithmException {

        //获取admin对象
        Admin admin1 = findAdmin(admin);
        Map result = new HashMap();

        //判断admin是否存在
        if(admin1 == null){
            result.put("code", ResultErrorStatus.ADMIN_NOTEXIST.getCode());
            result.put("msg", ResultErrorStatus.ADMIN_NOTEXIST.getMsg());
            return result;
        }

        //判断oldpassword 是否 等于 admin当前密码
        if (!Code.EncoderByMd5(oldPassword).equals(admin1.getAdminPassword())){
            result.put("code", ResultErrorStatus.ADMIN_PASSWORD_ERROR.getCode());
            result.put("msg", ResultErrorStatus.ADMIN_PASSWORD_ERROR.getMsg());
            return result;
        }

        //修改
        admin1.setAdminPassword(Code.EncoderByMd5(newPassword));
        dao.save(admin1);
        //日志
        log.info("【修改密码】admin={}",admin);

        result.put("code", 0);
        result.put("msg", "操作成功！");
        return result;
    }

    @Override
    public Map<String, Object> addAdmin(Admin admin, String ip) throws UnsupportedEncodingException, NoSuchAlgorithmException {
        Map result = new HashMap();

        //设置主键为null，防止自定义
        admin.setId(null);

        //查询admin是否存在
        if (dao.findByAdminName(admin.getAdminName()) != null ||
                dao.findByAdminEmail(admin.getAdminEmail()) != null){
            result.put("code", ResultErrorStatus.ADMIN_ISEXIST.getCode());
            result.put("msg", ResultErrorStatus.ADMIN_ISEXIST.getMsg());
            return result;
        }

        //设置加密密码
        admin.setAdminPassword(Code.EncoderByMd5(admin.getAdminPassword()));
        //设置ip
        admin.setAdminIp(ip);

        //查询并设置ip地址
        String address = PassIpGetAddress.getAddress(ip);
        admin.setAdminAddress(address);

        dao.save(admin);
        AdminVo adminVo = new AdminVo();
        BeanUtils.copyProperties(admin, adminVo);
        result.put("code", 0);
        result.put("msg", "操作成功！");
        result.put("data",adminVo);
        return result;
    }

    @Override
    public PageListData findAdminByAdminNameLike(String adminName, PageRequest pageRequest) {
        Page<Admin> page = dao.findAdminsByAdminNameLike(adminName, pageRequest);

        java.util.List<Admin> list = page.getContent();
        List<AdminListVo> adminListVoList = new ArrayList<>();
        for (Admin admin : list){
            AdminListVo adminListVo = new AdminListVo();
            BeanUtils.copyProperties(admin, adminListVo);
            adminListVoList.add(adminListVo);
        }
        return PageListData.getMap(page, adminListVoList);
    }

    @Override
    public Map<String, Object> findAdminById(Integer id) {
        Admin admin = dao.findOne(id);
        Map<String, Object> result = new HashMap<>();
        if (admin == null){
            result.put("code", ResultErrorStatus.ADMIN_NOTEXIST.getCode());
            result.put("msg", ResultErrorStatus.ADMIN_NOTEXIST.getMsg());
            return result;
        }

        //转换admin对象为vo对象
        AdminListVo vo = new AdminListVo();

        BeanUtils.copyProperties(admin, vo);
        result.put("code", 0);
        result.put("msg", "操作成功！");
        result.put("data", vo);

        return result;
    }



    /*获取菜单*/
    @Override
    public List<MenuVo> getMenuList(String adminToken) {
        //通过token获取用户
        Admin admin = dao.findByAdminToken(adminToken);
        //通过用户获取用户组
        int adminGroupId = admin.getAdminGroup();
        //通过用户组获取权限
        //获取所有拥有权限的model
        List<AdminGroupinfo> adminGroupinfoList =
                adminGroupinfoDao.findAdminGroupinfosByGroupIdAndGroupValueNot(adminGroupId,0);

        List<Integer> modelsId = new ArrayList<>();
        //存放查询功能集合
        Map<Integer, List<AuthOperate>> operatelists = new HashMap<>();
        for (AdminGroupinfo adminGroupinfo : adminGroupinfoList){
            //拼装modelsId
            modelsId.add(adminGroupinfo.getAuthModelId());
            //拼装需要查询的模块下的功能排序值
            int tenValue = adminGroupinfo.getGroupValue();
            //将十进制转换为二进制。
            byte[] bytes = AuthorityUtil.decimalToBinary(tenValue);
            //用与计次
            int byteNumber = 0;
            List operates = new ArrayList();
            for (byte b : bytes){
                if (b == '1'){
                    operates.add(byteNumber);
                }
                byteNumber++;
            }
            List<AuthOperate> operateList = authOperateDao.findAuthOperateByOperateModelAndOperateSiteInAndOperateType(adminGroupinfo.getAuthModelId(), operates, 1);
            operatelists.put(adminGroupinfo.getAuthModelId(),operateList);
        }
        //查询所有权限内model
        List<AuthModel> models = authModelDao.findAll(modelsId);


        List<MenuVo> result = new ArrayList<>();
        for (AuthModel authModel : models){
            MenuVo menuVo = new MenuVo();
            BeanUtils.copyProperties(authModel, menuVo);
            menuVo.setModelId(authModel.getId());
            menuVo.setOperates(operatelists.get(authModel.getId()));
            System.out.println(menuVo);
            result.add(menuVo);
        }
        //通过拥有权限的菜单.

        //哦,写到这里我感觉自己太帅了！！！
        return result;

    }











/*====================================*/
}
