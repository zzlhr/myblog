package com.zzlhr.vo;

import lombok.Data;
import net.sf.json.JSONArray;

/**
 * Created by 刘浩然 on 2017/8/4.
 */
@Data
public class ArticleListVo extends ArticleVo {

    private Integer page;

    private Integer allpage;

    private JSONArray articles;

}
