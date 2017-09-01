package com.zzlhr.service.impl;

import com.zzlhr.entity.AdminGroup;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

/**
 * Created by 刘浩然 on 2017/9/2.
 */
@RunWith(SpringRunner.class)
@SpringBootTest
public class AuthorityServiceImplTest {

    @Autowired
    private AuthorityServiceImpl authorityService;
    @Test
    public void setAdminGroup() throws Exception {
        AdminGroup adminGroup = new AdminGroup();
        adminGroup.setGroupStatus(1);
        adminGroup.setGroupName("test");
        System.out.println(authorityService.addGroup(adminGroup));
    }

    @Test
    public void setGroupValue() throws Exception {
    }

    @Test
    public void setGroupValue1() throws Exception {
    }

    @Test
    public void addGroup() throws Exception {
    }

    @Test
    public void updateGroup() throws Exception {
    }

    @Test
    public void delectGroup() throws Exception {
    }

    @Test
    public void getGroupList() throws Exception {
    }

    @Test
    public void addMenu() throws Exception {
    }

    @Test
    public void updateMenu() throws Exception {
    }

    @Test
    public void delectMenu() throws Exception {
    }

    @Test
    public void isHaveAuthority() throws Exception {
    }

}