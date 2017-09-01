package com.zzlhr.interceptor;

import com.zzlhr.service.AuthorityService;
import com.zzlhr.util.CookieUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * 拦截所有/admin的请求， 对所有admin的请求进行权限验证
 */
@Component
public class AuthorityInterceptor implements HandlerInterceptor {

    @Autowired
    private AuthorityService authorityService;
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
//        System.out.println(">>>MyInterceptor1>>>>>>>在请求处理之前进行调用（Controller方法调用之前）");

        //排除登录接口
        if ("/admin/login.do".equals(request.getRequestURI())){
            return true;
        }


        return authorityService.isHaveAuthority(request.getRequestURI(),
                CookieUtils.getCookieValue(request,"admin"),
                CookieUtils.getCookieValue(request, "token"));

        // 只有返回true才会继续向下执行，返回false取消当前请求
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
            ModelAndView modelAndView) throws Exception {
//        System.out.println(">>>MyInterceptor1>>>>>>>请求处理之后进行调用，但是在视图被渲染之前（Controller方法调用之后）");
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
            throws Exception {
//        System.out.println(">>>MyInterceptor1>>>>>>>在整个请求结束之后被调用，也就是在DispatcherServlet 渲染了对应的视图之后执行（主要是用于进行资源清理工作）");
    }

}