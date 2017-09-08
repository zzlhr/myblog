package com.zzlhr.service.impl;

import com.zzlhr.dao.AboutDao;
import com.zzlhr.entity.About;
import com.zzlhr.service.AboutService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by 刘浩然 on 2017/9/8.
 */
@Service
public class AboutServiceImpl implements AboutService{

    @Autowired
    private AboutDao dao;

    @Override
    public About getAbout() {
        About about = dao.findOne(1);
        return about;
    }
}
