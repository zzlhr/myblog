package com.zzlhr.dao;


import com.zzlhr.entity.AuthOperate;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AuthOperateDao extends JpaRepository<AuthOperate, Integer> {

    List<AuthOperate> findAuthOperateByOperateModelAndOperateSiteInAndOperateType(Integer model, List<Integer> operateSite, Integer operateType);

    AuthOperate findAuthOperateByOperateCodename(String operateCodename);



}
