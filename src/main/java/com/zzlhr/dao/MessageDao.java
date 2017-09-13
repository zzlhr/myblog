package com.zzlhr.dao;

import com.zzlhr.entity.Message;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MessageDao extends JpaRepository<Message, Integer> {


    List<Message> findMessagesByMessageFid(Integer messageFid, Pageable pageable);

    List<Message> findMessagesByMessageFidIn(List<Integer> messageFid);


}
