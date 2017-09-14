package com.zzlhr.service.impl;

import com.zzlhr.dao.MessageDao;
import com.zzlhr.entity.Message;
import com.zzlhr.service.MessageService;
import com.zzlhr.util.NetworkUtil;
import com.zzlhr.util.RequestUtil;
import com.zzlhr.vo.MessageVo;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Service
public class MessageServiceImpl implements MessageService {

    @Autowired
    private MessageDao dao;

    @Override
    public List<MessageVo> getMessage(PageRequest pageRequest) {

        //查询一级
        List<Message> messagePage= dao.findMessagesByMessageFid(0,pageRequest);
        List<MessageVo> messages = new ArrayList<>();
//        List<Message> beanMessages = messagePage.getContent();
        //放置一级评论id
        List<Integer> page = new ArrayList<>();

        for (Message message : messagePage){
            MessageVo messageVo = new MessageVo();
            BeanUtils.copyProperties(message, messageVo);
            //向消息集合添加消息
            messages.add(messageVo);
            //设置需要查询子消息的id集合
            page.add(message.getId());
        }

        //查询所有子消息
        if (page.size() > 0){
            List<Message> sonMessages = dao.findMessagesByMessageFidIn(page);
            //循环子消息集合
            for (Message message : sonMessages){
                //循环一级消息集合
                int i = 0;
                for (MessageVo messageVo : messages){
                    if (messageVo.getId() == message.getMessageFid()){
                        List<MessageVo> vos = messageVo.getReplay();
                        MessageVo vo = new MessageVo();
                        BeanUtils.copyProperties(message, vo);
                        vos.add(vo);
                        messageVo.setReplay(vos);
                        messages.set(i, messageVo);
                    }
                    i++;
                }
            }
        }
        return messages;
    }


    @Override
    public boolean sendMessage(String name, String link, String text, HttpServletRequest request) throws IOException {
        Message message = new Message();
        message.setMessageName(name);
        message.setMessageLink(link);
        message.setMessageValue(text);
        message.setMessageAddress(NetworkUtil.getIpAddress(request));
        dao.save(message);



        return false;
    }
}
