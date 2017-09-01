package com.zzlhr.conf;

import com.zzlhr.interceptor.AuthorityInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

@Configuration
public class WebAppConfigurer
        extends WebMvcConfigurerAdapter {
    //拦截器中需要用bean方式new，否则自动注入的内容无法注入
    @Bean
    AuthorityInterceptor authorityInterceptor(){
        return new AuthorityInterceptor();
    }


    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        // 多个拦截器组成一个拦截器链
        // addPathPatterns 用于添加拦截规则
        // excludePathPatterns 用户排除拦截
        registry.addInterceptor(authorityInterceptor()).addPathPatterns("/admin/*.do");
        super.addInterceptors(registry);
    }

}