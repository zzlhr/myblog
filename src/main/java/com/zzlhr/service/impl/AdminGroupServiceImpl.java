package com.zzlhr.service.impl;

import com.zzlhr.dao.AdminGroupDao;
import com.zzlhr.entity.AdminGroup;
import com.zzlhr.service.AdminGroupService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author lhr
 * @create 2017/10/17
 */
@Service
public class AdminGroupServiceImpl implements AdminGroupService {
    @Autowired
    private AdminGroupDao dao;

    @Override
    public int addGroup(AdminGroup adminGroup) {
        try {
            return dao.save(adminGroup).getId();
        }catch (Exception e){
            e.printStackTrace();
            return 0;
        }
    }
}
