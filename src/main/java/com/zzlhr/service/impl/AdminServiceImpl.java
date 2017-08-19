package com.zzlhr.service.impl;

import com.zzlhr.api.PassIpGetAddress;
import com.zzlhr.dao.AdminDao;
import com.zzlhr.entity.Admin;
import com.zzlhr.enums.AdminStatusEnum;
import com.zzlhr.enums.ExceptionEnum;
import com.zzlhr.enums.LoginEnum;
import com.zzlhr.service.AdminService;
import com.zzlhr.util.BlogException;
import com.zzlhr.util.Code;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

/**
 * Created by 刘浩然 on 2017/7/26.
 */
@Service
@Slf4j
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminDao dao;

    @Override
    public Map<String, String> deleteAdmin(String adminName, String ip) {

        Admin admin = null;

        Map<String, String> result = new HashMap<>();

        //查询管理员是否存在
        if ((admin = this.findAdmin(adminName)) == null){
            result.put("code", String.valueOf(ExceptionEnum.ADMIN_NOTEXIST.getCode()));
            result.put("msg", ExceptionEnum.ADMIN_NOTEXIST.getMessage());
            //不存在抛出异常
            throw new BlogException(ExceptionEnum.ADMIN_NOTEXIST.getMessage());
        }


        //删除管理员
        dao.delete(admin.getId());


        result.put("code", "0");
        result.put("msg", "操作成功");
        return result;
    }

    @Override
    public Admin updateAdmin(Admin admin, String ip) {
        return null;
    }

    @Override
    public Admin findAdmin(String admin) {

        Admin result = null;

        if ((result = dao.findByAdminName(admin)) != null ||
                (result = dao.findByAdminEmail(admin)) != null ){
            return result;
        }
        return null;
    }

    @Override
    @Transactional
    public Map login(String admin, String password, String ip) throws UnsupportedEncodingException, NoSuchAlgorithmException {
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
        return re;
    }


    @Override
    public Admin updateAdminPassword(String admin, String oldPassword, String newPassword, String ip) {
        return null;
    }

    @Override
    public Admin addAdmin(Admin admin, String ip) {
        return null;
    }





}
