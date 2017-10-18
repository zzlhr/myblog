package com.zzlhr.vo;

import lombok.Data;

/**
 * 后台权限初始化需要的json
 * @author lhr
 * @create 2017/10/15
 */
@Data
public class AuthTreeVo {

    private String name;

    private int id;

    private boolean open = true;

    private int pId;

    private Boolean isChecked = false;


    public AuthTreeVo(String name, int id, int pId, boolean open, Boolean isChecked){
        this.name = name;
        this.id = id;
        this.open = open;
        this.pId = pId;
        this.isChecked = isChecked;
    }
    public AuthTreeVo(String name, int id, int pId, Boolean isChecked){
        this.name = name;
        this.id = id;
        this.pId = pId;
        this.isChecked = isChecked;
    }

}
