package com.zzlhr.service;

import com.zzlhr.entity.Admin;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;


import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.*;

/**
 * Created by 刘浩然 on 2017/7/26.
 */
@RunWith(SpringRunner.class)
@SpringBootTest
public class AdminServiceTest {

    @Autowired
    private AdminService adminService;

    @Test
    public void addTest(){
        Admin admin = new Admin();
        admin.setAdminPassword("123456");
        admin.setAdminEmail("2388399752@qq.com");
        admin.setAdminName("zzlhr");
        try {
            Map<String, Object> result = adminService.addAdmin(admin,"175.188.159.139");
            System.out.println(result);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
    }





    @Test
    public void login() throws Exception {
//        MsgVo<LoginVo> msgVo =
//                adminService.login("admin","123456","192.168.0.1");
//        System.out.println(msgVo);
    }

}