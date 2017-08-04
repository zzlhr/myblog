package com.zzlhr.util;

import javax.servlet.http.HttpServletRequest;

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
}
