package com.zzlhr.dao;

import com.zzlhr.entity.AdminGroupinfo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * Created by 刘浩然 on 2017/9/1.
 */
@Repository
public interface AdminGroupinfoDao extends JpaRepository<AdminGroupinfo, Integer>{

    AdminGroupinfo findAdminGroupinfoByGroupIdAndMenuId(Integer groupId, Integer menuId);

}
