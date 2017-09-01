package com.zzlhr.service.impl;

import com.zzlhr.entity.Admin;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.*;

/**
 * Created by 刘浩然 on 2017/8/18.
 */
@RunWith(SpringRunner.class)
@SpringBootTest
public class AdminServiceImplTest {

    private final String IP = "175.188.159.139";

    @Autowired
    private AdminServiceImpl adminService;

    @Test
    public void deleteAdmin() throws Exception {
    }

    @Test
    public void updateAdmin() throws Exception {
    }

    @Test
    public void findAdmin() throws Exception {

    }

    @Test
    public void login() throws Exception {
        java.util.Map result = adminService.login("heibai","123456","175.188.159.139");
        Assert.assertNotNull(result.get("token"));
    }

    @Test
    public void updateAdminPassword() throws Exception {
        Map result = adminService.updateAdminPassword("test_lhr","123456","654321", IP);
        Assert.assertEquals(0, result.get("code"));
    }

    @Test
    public void addAdmin() throws Exception {
        Admin admin = new Admin();
        admin.setAdminName("test_lhr1");
        admin.setAdminEmail("test_lhr1@qq.com");
        admin.setAdminPassword("123456");
        admin.setAdminIp("175.188.159.139");
        Map result = adminService.addAdmin(admin,IP);
        System.out.println(result);
        Assert.assertNotNull(result.get("data"));
    }

}