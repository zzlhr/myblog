package com.zzlhr.service.impl;

import com.zzlhr.dao.WebsiteDao;
import com.zzlhr.entity.Website;
import com.zzlhr.service.WebsiteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author lhr
 * @create 2017/10/10
 */
@Service
public class WebsiteServiceImpl implements WebsiteService{

    @Autowired
    private WebsiteDao websiteDao;

    @Override
    public Website getWebsite() {
        return websiteDao.getOne(1);
    }
}
