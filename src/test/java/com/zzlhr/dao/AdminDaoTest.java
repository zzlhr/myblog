package com.zzlhr.dao;

import com.zzlhr.entity.Admin;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.*;
/**
 * 管理员数据库操作测试
 * Created by 刘浩然 on 2017/7/24.
 */

@RunWith(SpringRunner.class)
@SpringBootTest
public class AdminDaoTest {

    @Autowired
    private AdminDao adminDao;

    @Test
    public void findAllTest(){
        List<Admin> result = adminDao.findAll();
        Assert.assertNotEquals(0, result.size());
    }
}