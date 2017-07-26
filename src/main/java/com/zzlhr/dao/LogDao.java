package com.zzlhr.dao;

import com.zzlhr.entity.Log;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * Created by 刘浩然 on 2017/7/26.
 */
@Repository
public interface LogDao extends JpaRepository<Log, Integer> {

}
