package com.zzlhr.vo;

import lombok.Data;

/**
 * layui富文本指定上传返回格式
 * @author lhr
 * @create 2017/10/11
 */
@Data
public class LayuiUploadVo {

    /*状态 0表示成功，其它失败*/
    private int code;

    /*提示信息 一般上传失败后返回*/
    private String msg;

    private LayuiUploadDataVo data;
}
