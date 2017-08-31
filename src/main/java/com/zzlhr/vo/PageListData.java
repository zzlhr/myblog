package com.zzlhr.vo;

import lombok.Data;
import org.springframework.data.domain.Page;

/**
 * Created by 刘浩然 on 2017/8/30.
 */
@Data
public class PageListData<T> {

    private Integer pageNumber;

    private Integer pageSize;

    private Integer total;

    private T Data;

    public static PageListData getMap(Page page){
        PageListData pageListData = new PageListData();
        pageListData.setData(page.getContent());
        pageListData.setPageNumber(page.getNumber());
        pageListData.setPageSize(page.getSize());
        pageListData.setTotal(page.getTotalPages());
        return pageListData;
    }

    public static PageListData getMap(Page page, Object object){
        PageListData pageListData = new PageListData();
        pageListData.setData(object);
        pageListData.setPageNumber(page.getNumber());
        pageListData.setPageSize(page.getSize());
        pageListData.setTotal(page.getTotalPages());
        return pageListData;
    }


}
