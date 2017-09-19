package com.zzlhr.dao;


import com.zzlhr.entity.AuthModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AutoModelDao extends JpaRepository<AuthModel, Integer>{


}
