package com.zzlhr.service;

import com.zzlhr.dao.AdminDao;
import com.zzlhr.entity.Admin;
import com.zzlhr.enums.AdminStatusEnum;
import com.zzlhr.enums.LogTypeEnum;
import com.zzlhr.enums.LoginEnum;
import com.zzlhr.util.Code;
import com.zzlhr.vo.LoginVo;
import com.zzlhr.vo.MsgVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.UUID;

/**
 * Created by 刘浩然 on 2017/7/26.
 */
@Service
public class AdminService {

    @Autowired
    private LogService log;

    @Autowired
    private AdminDao dao;


    /**
     * 登录更新token和ip方法
     *
     * @param admin 用户对象
     * @param ip    登录ip
     * @return      更新后的管理员对象
     */
    private Admin loginToUpdate(Admin admin, String ip){
        try {
            admin.setAdminToken(Code.EncoderByMd5(UUID.randomUUID().toString()));
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        admin.setAdminIp(ip);
        return dao.save(admin);
    }

    /**
     * 登录方法
     * @param adminName 用户名
     * @param password 密码
     * @return 登录结果
     */
    public MsgVo<LoginVo> login(String adminName, String password, String loginIp) throws UnsupportedEncodingException, NoSuchAlgorithmException {

        Admin admin = dao.findByAdminName(adminName);

        MsgVo msgVo = new MsgVo();


        if (admin == null){
            log.writeLog(LogTypeEnum.LOGIN_ERROR.getCode(),
                    LogTypeEnum.LOGIN_ERROR.getMsg(),adminName, loginIp);

            /* 用户不存在 */
            msgVo.setApiCode(LoginEnum.USERNOTEXIST.getCode());

            msgVo.setApiMessage(LoginEnum.USERNOTEXIST.getMsg());

            msgVo.setData(null);


            return msgVo;

        } else if (AdminStatusEnum.OK.getCode()
                != admin.getAdminStatus()){

            log.writeLog(LogTypeEnum.LOGIN_ERROR.getCode(),
                    LogTypeEnum.LOGIN_ERROR.getMsg(),adminName, loginIp);

            /* 用户名或密码错误 */
            msgVo.setApiCode(LoginEnum.NOTLOGIN.getCode());

            msgVo.setApiMessage(LoginEnum.NOTLOGIN.getMsg());

            msgVo.setData(null);

            return msgVo;

        } else if (Code.EncoderByMd5(password).equals(admin.getAdminPassword())){

            log.writeLog(LogTypeEnum.LOGIN_SUCCESS.getCode(),
                    LogTypeEnum.LOGIN_SUCCESS.getMsg(),adminName, loginIp);

            /* 登录成功 */

            //首先对ip进行存储，返回给客户的应该为上次登录ip
            String ip = admin.getAdminIp();

            /* 更新ip和token */
            admin = this.loginToUpdate(admin, loginIp);

            LoginVo loginVo = new LoginVo(admin.getAdminName(), admin.getAdminToken(), ip);

            msgVo.setApiCode(LoginEnum.SUCCESS.getCode());

            msgVo.setApiMessage(LoginEnum.SUCCESS.getMsg());

            msgVo.setData(loginVo);

            return msgVo;
        } else {

            log.writeLog(LogTypeEnum.LOGIN_ERROR.getCode(),
                    LogTypeEnum.LOGIN_ERROR.getMsg(),adminName, loginIp);


            /* 用户名或密码错误 */
            msgVo.setApiCode(LoginEnum.PASSWORDERROR.getCode());

            msgVo.setApiMessage(LoginEnum.PASSWORDERROR.getMsg());

            msgVo.setData(null);

            return msgVo;
        }
    }
}
