package com.zzlhr.dao;

import com.zzlhr.entity.Admin;
import net.sf.json.JSONObject;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;
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

    @Test
    public void findByAdminEmail(){
        Admin admin = adminDao.findByAdminEmail("2388399752@qq.com");
        Assert.assertNotNull(admin);
    }


    @Test
    public void findByAdminNameLike(){
        Page<Admin> page = adminDao.findAdminsByAdminNameLike("test%", new PageRequest(0,10));
//        Gson gson = new Gson();
//        System.out.println(page.getTotalPages());
//        System.out.println(page.getTotalElements());
//        System.out.println(page.getContent());
//        System.out.println(gson.toJson(page));
        JSONObject json = JSONObject.fromObject(page);
        System.out.println(json);
    }
}