package com.zzlhr.dao;


import com.zzlhr.entity.AuthOperate;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AuthOperateDao extends JpaRepository<AuthOperate, Integer> {
}
