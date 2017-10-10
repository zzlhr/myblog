package com.zzlhr.vo;

import com.zzlhr.entity.AuthOperate;
import lombok.Data;

import java.util.List;

/**
 * 菜单视图
 * @author lhr
 * @create 2017/10/10
 */
@Data
public class MenuVo {

    private Integer modelId;
    /**
     * 模块名
     */
    private String modelName;

    /**
     * 模块状态
     */
    private Integer modelStatus;
    /**
     * 模块排序
     */
    private Integer modelSite;


    /*模块功能列表*/
    private List<AuthOperate> operates;

}
