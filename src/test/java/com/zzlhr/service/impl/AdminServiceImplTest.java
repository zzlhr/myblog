package com.zzlhr.service.impl;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

/**
 * Created by 刘浩然 on 2017/8/18.
 */
@RunWith(SpringRunner.class)
@SpringBootTest
public class AdminServiceImplTest {

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
    }

    @Test
    public void addAdmin() throws Exception {
    }

}