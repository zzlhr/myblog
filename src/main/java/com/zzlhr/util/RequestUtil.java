package com.zzlhr.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Cookie;
/**
 * Created by 刘浩然 on 2017/7/27.
 */
public class RequestUtil {
    public static String getRemortIP(HttpServletRequest request) {
        if (request.getHeader("x-forwarded-for") == null) {
            return request.getRemoteAddr();
        }
        return request.getHeader("x-forwarded-for");
    }

    /**
     * 通过cookie 的 key 获取cookie的value
     * @param cookies
     * @param key
     * @return  value 如果返回null表示未找到。
     */
    public static String getCookie(Cookie[] cookies, String key){
        for (Cookie cookie : cookies){
            if (cookie.getName().equals(key)){
                return cookie.getValue();
            }
        }
        return null;
    }
}
