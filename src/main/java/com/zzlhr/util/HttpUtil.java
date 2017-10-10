package com.zzlhr.util;

import org.apache.http.HttpEntity;
import org.apache.http.StatusLine;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;

import java.io.IOException;


public class HttpUtil {

    private String url;

    /**
     * get请求
     * @param url
     */
    public HttpUtil(String url){
        this.url = url;
    }

    public String get() throws IOException {
        CloseableHttpClient httpclient = HttpClients.createDefault();

        CloseableHttpResponse response = null;
        HttpEntity entity = null;
        try {

            HttpGet httpGet = new HttpGet(url);

            //提交http请求
            response = httpclient.execute(httpGet);

            //响应实体
            entity = response.getEntity();

            //请求状态 HTTP/1.1 200 OK
            StatusLine responseStatus = response.getStatusLine();

            //http版本号  HTTP/1.1
            System.out.println(response.getProtocolVersion());

            //http状态 200 404 500
            System.out.println(response.getStatusLine().getStatusCode());

            //原因  OK
            System.out.println(response.getStatusLine().getReasonPhrase());

            String result = "";
            if (entity != null) {
                // 打印响应内容长度
                System.out.println("Response content length: " + entity.getContentLength());
                // 打印响应内容
                result = EntityUtils.toString(entity);
                System.out.println("Response content: " + result);
            }
            return result;


        } catch (IOException e) {
            e.printStackTrace();
        }finally {
            try {
                response.close();
                httpclient.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return "";
    }






}
