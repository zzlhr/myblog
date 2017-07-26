package com.zzlhr.util;

import org.junit.Test;

/**
 * Created by 刘浩然 on 2017/7/26.
 */
public class CodeTest {
    @Test
    public void encoderByMd5() throws Exception {
        String password = Code.EncoderByMd5("123456");
        System.out.println(password);
    }

}