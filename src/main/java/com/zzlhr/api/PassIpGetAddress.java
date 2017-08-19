package com.zzlhr.api;

import com.zzlhr.util.HttpClientUtil;
import lombok.Getter;
import net.sf.json.JSONObject;

import java.io.UnsupportedEncodingException;

/**
 * Created by 刘浩然 on 2017/8/18.
 */
@Getter
public class PassIpGetAddress {

    public static String getAddress(String ip) throws UnsupportedEncodingException {
        HttpClientUtil http = new HttpClientUtil();
        JSONObject result = JSONObject.fromObject(http.url("http://ip.taobao.com/service/getIpInfo.php").get().param("ip", ip).send());
        JSONObject data = result.getJSONObject("data");
        return data.getString("region") + "-" + data.getString("city");
    }

}