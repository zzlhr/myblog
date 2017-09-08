package com.zzlhr.dao;

import com.zzlhr.entity.About;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * Created by 刘浩然 on 2017/9/8.
 */
@Repository
public interface AboutDao extends JpaRepository<About, Integer> {



}
