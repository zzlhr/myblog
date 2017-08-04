package com.zzlhr.vo;

import lombok.Data;

import java.util.Date;
import java.util.List;

/**
 * Created by 刘浩然 on 2017/8/4.
 */
@Data
public class ArticleListVo extends ArticleVo {

    private Integer page;

    private Integer allpage;

    private List<ArticleVo> articles;

}
