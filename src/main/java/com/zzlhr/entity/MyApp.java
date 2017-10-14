package com.zzlhr.entity;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

import java.util.Map;

/**
 * @author lhr
 * @create 2017/10/11
 */
@Component
@ConfigurationProperties(prefix="myapp")
@Data
public class MyApp {
    private Map<String, String> article;
    private Map<String, String> project;
}
