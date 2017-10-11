package com.zzlhr.util;

import java.io.File;
import java.io.FileOutputStream;
import java.util.Date;
import java.util.Random;

/**
 * 上传文件辅助方法。
 * @author lhr
 * @create 2017/10/11
 */
public class FileUtil {

    //写文件
    public static void uploadFile(byte[] file, String filePath, String fileName) throws Exception {
        File targetFile = new File(filePath);
        if(!targetFile.exists()){
            targetFile.mkdirs();
        }
        FileOutputStream out = new FileOutputStream(filePath+fileName);
        out.write(file);
        out.flush();
        out.close();
    }

    //生成随机名
    public static String makeRandomName(){
        Long timstamp = new Date().getTime();
        return timstamp + makeRandom(3);
    }

    //生成n位随机数
    public static String makeRandom(int howlong){
        Random random = new Random();
        String result = "";
        for (int i=0; i<howlong; i++){
            result += random.nextInt(9);
        }
        return result;
    }

    //解析文件后缀
    public static String GetFileSuffix(String fileName){
        System.out.println(fileName);
//        String[] ar = fileName.split(".");
        String[] ar = fileName.split("/");
        return ar[ar.length-1];
    }



}
