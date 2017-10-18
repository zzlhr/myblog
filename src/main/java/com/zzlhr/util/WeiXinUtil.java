package com.zzlhr.util;

import com.sun.org.apache.xml.internal.security.Init;
import lombok.Data;
import net.sf.json.JSONObject;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.security.DigestException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Date;
import java.util.Map;

@SuppressWarnings("AlibabaAvoidNewDateGetTime")
@Data
//@Component
@ConfigurationProperties(prefix = "weixin")
public class WeiXinUtil {

    private String appId;
    private String AppSecret;


    private Long timestamp = System.currentTimeMillis();
    private String nonceStr = "tongxinruanjian";
    private String signature;

    private String ticket;
    private String token;


    private String url;
    private String params;


    public void setUrlAndParams(String url,String params){
        this.url = url;
        this.params = params;
        init(url, params);
    }

//    public WeiXinUtil() {
//
//    }


    public void init(String url, String params) {
        getTicket();
        sign(url,params);
    }
    public void sign(String sendUrl, String params) {
        String str = "jsapi_ticket="+ticket+"&noncestr="+nonceStr+"&timestamp="+timestamp+"&url="+sendUrl+"&params"+params;
        try {
            signature = SHA1(str);
        } catch (DigestException e) {
            e.printStackTrace();
        }
    }

    public static String SHA1(String str) throws DigestException {
        //获取信息摘要 - 参数字典排序后字符串
        try {
            //指定sha1算法
            MessageDigest digest = MessageDigest.getInstance("SHA-1");
            digest.update(str.getBytes());
            //获取字节数组
            byte messageDigest[] = digest.digest();
            // Create Hex String
            StringBuffer hexString = new StringBuffer();
            // 字节数组转换为 十六进制 数
            for (int i = 0; i < messageDigest.length; i++) {
                String shaHex = Integer.toHexString(messageDigest[i] & 0xFF);
                if (shaHex.length() < 2) {
                    hexString.append(0);
                }
                hexString.append(shaHex);
            }
            return hexString.toString().toUpperCase();

        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            throw new DigestException("签名错误！");
        }
    }


    public String getTicket() {
//        if ()
        //查询数据库验证是否需要重新获取ticket

            //不需要获取
                //设置this.token 和 this.ticket
                //返回ticket


            //需要获取
            String response = "";
            try {
                getToken();
                String url = "https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token="+token+"&type=jsapi";
                HttpUtil httpUtil = new HttpUtil(url);
                response = httpUtil.get();
                System.out.println("ticket:"+response);
                JSONObject json = JSONObject.fromObject(response);
                if (json.getString("ticket") != null){
                    this.ticket =  json.getString("ticket");
                }

                //把this.token 和 this.ticket 入库 同时更新时间


            } catch (IOException e) {
                e.printStackTrace();
            }

            return response;
    }


    public String getToken(){
        String url = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&" +
                "appid="+appId+"&secret="+AppSecret;
        HttpUtil httpUtil = new HttpUtil(url);
        String response = null;
        try {
            response = httpUtil.get();
        } catch (IOException e) {
            e.printStackTrace();
        }
        System.out.println("token:"+response);
        JSONObject json = JSONObject.fromObject(response);
        if (json.getString("access_token") != null){
            this.token =  json.getString("access_token");
        }
        return response;
    }
    public JSONObject getWeiXinConf() throws IOException {

        JSONObject json = new JSONObject();
        json.put("appId", this.appId);
        json.put("timestamp", this.timestamp);
        json.put("nonceStr", this.nonceStr);
        json.put("signature", this.signature);
        return json;
    }


}
