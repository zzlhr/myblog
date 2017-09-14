package com.zzlhr.service;

import com.zzlhr.vo.MessageVo;
import org.springframework.data.domain.PageRequest;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.List;

public interface MessageService {

    List<MessageVo> getMessage(PageRequest pageRequest);

    /**
     * 发表留言
     * @param name 昵称
     * @param link 联系方式
     * @param text 内容
     * @param request request 对象
     * @return  是否成功!
     */
    boolean sendMessage(String name, String link, String text, HttpServletRequest request) throws IOException;

}
