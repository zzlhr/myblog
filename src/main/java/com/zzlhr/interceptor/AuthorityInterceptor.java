package com.zzlhr.interceptor;

import com.zzlhr.entity.MyApp;
import com.zzlhr.service.AdminService;
import com.zzlhr.service.AuthorityService;
import com.zzlhr.util.CookieUtils;
import com.zzlhr.util.NetworkUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;


/**
 * 拦截所有/admin的请求， 对所有admin的请求进行权限验证
 */
@Component
@Slf4j
public class AuthorityInterceptor implements HandlerInterceptor {

    @Autowired
    private AdminService adminService;

    @Autowired
    private MyApp myApp;

    @Autowired
    private AuthorityService authorityService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        log.info("【Http】:ip={}, uri={}", NetworkUtil.getIpAddress(request), request.getRequestURI());

        /*
        免检uri集合，可以排除一些例如登录的接口/页面地址。
         */
        List<String> exemptionUri = new ArrayList<>();
        exemptionUri.add("/admin/login.do");
        exemptionUri.add("/admin/login.html");



        /*
         判断请求是否免检
         */
        for (String uri : exemptionUri){
            if (uri.equals(request.getRequestURI())){
                return true;
            }
        }

        /*
        1.验证登录,只有登录的用户才有权限一说。
         */
        if (!adminService.verifyLogin(request)){
            //验证失败重定向到登录页
            response.sendRedirect(myApp.getProject().get("host")+"/admin/login.html");
            return false;
        }

        //2. 验证权限
        return authorityService.isHaveAuthority(CookieUtils.getCookieValue(request, "admin"),
                request.getRequestURI());


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
//        response.setHeader("Access-Control-Allow-Origin","*/*");
//        System.out.println(">>>MyInterceptor1>>>>>>>在整个请求结束之后被调用，也就是在DispatcherServlet 渲染了对应的视图之后执行（主要是用于进行资源清理工作）");
    }



}