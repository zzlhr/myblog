package com.zzlhr.dao;

import com.zzlhr.entity.MenuDo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by 刘浩然 on 2017/9/1.
 */
@Repository
public interface MenuDoDao extends JpaRepository<MenuDo, Integer>{

    MenuDo findMenuDoByDoUriAndMenuStatus(String doUri, Integer menuStatus);


    List<MenuDo> findMenuDosById(List<Integer> id);


}
