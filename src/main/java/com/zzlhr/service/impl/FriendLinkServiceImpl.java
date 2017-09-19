package com.zzlhr.service.impl;

import com.zzlhr.dao.FriendLinkDao;
import com.zzlhr.entity.FriendLink;
import com.zzlhr.service.FriendLinkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FriendLinkServiceImpl implements FriendLinkService {

    @Autowired
    private FriendLinkDao friendLinkDao;


    @Override
    @Cacheable(value = "friendlink")
    public List<FriendLink> getAllFrinedLink() {
//        Sort sort = new Sort(Sort.Direction.DESC,"link_location");
        return friendLinkDao.findAll();
    }
}
