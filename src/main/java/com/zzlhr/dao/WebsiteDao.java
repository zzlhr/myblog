package com.zzlhr.dao;

import com.zzlhr.entity.Website;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * @author lhr
 * @create 2017/10/10
 */
@Repository
public interface WebsiteDao extends JpaRepository<Website,Integer>{

}
