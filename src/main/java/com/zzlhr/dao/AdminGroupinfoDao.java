package com.zzlhr.dao;

import com.zzlhr.entity.AdminGroupinfo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;
/**
 * Created by 刘浩然 on 2017/9/1.
 */
@Repository
public interface AdminGroupinfoDao extends JpaRepository<AdminGroupinfo, Integer>{


    List<AdminGroupinfo> findAdminGroupinfosByGroupIdAndGroupValueNot(Integer groupId,
                                                                      Integer groupValue);

    AdminGroupinfo findAdminGroupinfoByAuthModelIdAndGroupId(Integer authModelId,
                                                                Integer groupId);

    List<AdminGroupinfo> findAdminGroupinfosByGroupId(Integer groupId);

}
