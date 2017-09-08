package com.zzlhr.util;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * json的操作补充
 * Created by 刘浩然 on 2017/9/8.
 */
public class JSONUtil {

    /**
     * 格式化jsonObject对象中的时间对象
     * @param srcJson   json源
     * @param keys      时间格式的key值数组
     * @param format    格式 如：yyyy-MM-dd HH:mm:ss
     * @return          新的json对象
     */
    public static JSONObject formatDate(JSONObject srcJson, String[] keys, String format){

        //创建格式
        SimpleDateFormat formatter = new SimpleDateFormat(format);

        for (String key : keys){
            try {

                Date date = new Date(srcJson.getJSONObject(key).getLong("time"));

                srcJson.remove(key);

                srcJson.put(key, formatter.format(date));

            }catch (Exception e){

                e.printStackTrace();

                throw new RuntimeException("json格式时间失败:"+e.getMessage());

            }

        }

        return srcJson;
    }
    /**
     * 格式化jsonArray对象中的时间对象
     * @param srcJson   json源
     * @param keys      时间格式的key值数组
     * @param format    格式 如：yyyy-MM-dd HH:mm:ss
     * @return          新的json对象
     */
    public static JSONArray formatDate(JSONArray srcJson, String[] keys, String format){

        for (int i = 0; i < srcJson.size(); i++){
            try {
                srcJson.set(i, formatDate(srcJson.getJSONObject(i), keys, format));
            } catch (Exception e){
                srcJson.set(i, formatDate(srcJson.getJSONArray(i), keys, format));
            }
        }

        return srcJson;
    }




}
