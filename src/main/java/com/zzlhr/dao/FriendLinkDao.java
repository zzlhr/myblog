package com.zzlhr.dao;

import com.zzlhr.entity.FriendLink;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface FriendLinkDao extends JpaRepository<FriendLink, Integer>{


}
