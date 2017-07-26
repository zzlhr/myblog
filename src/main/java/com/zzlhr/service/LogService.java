package com.zzlhr.service;

import com.zzlhr.dao.LogDao;
import com.zzlhr.entity.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by 刘浩然 on 2017/7/26.
 */

@Service
public class LogService {

    @Autowired
    private LogDao dao;

    public void writeLog(Integer type, String value, String adminName, String ip){
        Log log = new Log();
        log.setType(type);
        log.setValue(value);
        log.setIp(ip);
        log.setAdmin(adminName);
        dao.save(log);
    }

}
