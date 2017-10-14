package com.zzlhr.util;

/**
 * 权限操作
 * Created by 刘浩然 on 2017/8/18.
 */
public class AuthorityUtil {

    /**
     * 权限算法，第一个参数是权限值，第二个值是对应位置
     * @param number    权限值
     * @param serialNumber  对应位置
     * @return 该位置的值，1为拥有权限
     */
    public static Integer isHaveAuthority(Integer number, Integer serialNumber){
        //无敌的与运算，直接出权限
        Integer result = (number >> serialNumber) & 1;
        System.out.println(result);
        return result;
    }

    /**
     * 十进制转二进制
     * @param decimal 十进制值
     * @return 二进制值
     */
    public static byte[] decimalToBinary(int decimal){
        String bin = Integer.toBinaryString(decimal);
        return bin.getBytes();
    }
    public static void main(String[] args) {
        isHaveAuthority(1,1);
    }



}
