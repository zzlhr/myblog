package com.zzlhr.util;

/**
 * 权限操作
 * Created by 刘浩然 on 2017/8/18.
 */
public class AuthorityUtil {

    /**
     * 权限算法，第一个参数是权限值，第二个值是对应位置
     * @param number    权限值
     * @param menuDoId  对应位置（操作id）
     * @return          该位置的值
     */
    public static Integer isHaveAuthority(Integer number, Integer menuDoId){
//        System.out.println(number + "----" + menuDoId);
        //无敌的与运算，直接出权限
        Integer result = (number >> menuDoId) & 1;
        System.out.println(result);
        return result;

    }


    public static void main(String[] args) {
        isHaveAuthority(1,1);

    }



}
