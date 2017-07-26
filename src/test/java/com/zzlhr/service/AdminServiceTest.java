package com.zzlhr.service;

import com.zzlhr.vo.LoginVo;
import com.zzlhr.vo.MsgVo;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

/**
 * Created by 刘浩然 on 2017/7/26.
 */
@RunWith(SpringRunner.class)
@SpringBootTest
public class AdminServiceTest {

    @Autowired
    private AdminService adminService;

    @Test
    public void login() throws Exception {
        MsgVo<LoginVo> msgVo =
                adminService.login("admin","123456","192.168.0.1");
        System.out.println(msgVo);
    }

}