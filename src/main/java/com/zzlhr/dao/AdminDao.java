package com.zzlhr.dao;

import com.zzlhr.entity.Admin;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * 管理员数据库操作
 * Created by 刘浩然 on 2017/7/24.
 */
@Repository
public interface AdminDao extends JpaRepository<Admin, Integer>{
    /**
     * 通过管理员name获取管理员对象
     * @param adminName
     * @return  管理员对象
     */
    Admin findByAdminName(String adminName);

    Admin findByAdminEmail(String adminEmail);

    Page<Admin> findAdminsByAdminNameLike(String adminName, Pageable pageable);

    Admin findByAdminToken(String adminToken);

}
