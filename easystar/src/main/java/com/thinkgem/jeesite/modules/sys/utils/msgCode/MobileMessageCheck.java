package com.thinkgem.jeesite.modules.sys.utils.msgCode;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.http.HttpResponse;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

import com.alibaba.fastjson.JSON;

public class MobileMessageCheck {

    private static final String SERVER_URL="https://api.netease.im/sms/verifycode.action";//校验验证码的请求路径URL
    private static final String APP_KEY="90ba9b0252354af19745b9ddeeaa7311";//账号
    private static final String APP_SECRET="cfe37139a44e";//密钥
    private static final String NONCE="123456";//随机数

    public static String checkMsg(String phone,String sum) throws IOException {
        CloseableHttpClient httpclient = HttpClients.createDefault();
        HttpPost post = new HttpPost(SERVER_URL);

        String curTime=String.valueOf((new Date().getTime()/1000L));
        String checkSum=CheckSumBuilder.getCheckSum(APP_SECRET,NONCE,curTime);

        //设置请求的header
        post.addHeader("AppKey",APP_KEY);
        post.addHeader("Nonce",NONCE);
        post.addHeader("CurTime",curTime);
        post.addHeader("CheckSum",checkSum);
        post.addHeader("Content-Type","application/x-www-form-urlencoded;charset=utf-8");

        //设置请求参数
        List nameValuePairs =new ArrayList();
        nameValuePairs.add(new BasicNameValuePair("mobile",phone));
        nameValuePairs.add(new BasicNameValuePair("code",sum));
        
        post.setEntity(new UrlEncodedFormEntity(nameValuePairs,"utf-8"));

        //执行请求
        HttpResponse response=httpclient.execute(post);
        String responseEntity= EntityUtils.toString(response.getEntity(),"utf-8");

        //判断是否发送成功，发送成功返回true
        String code= JSON.parseObject(responseEntity).getString("code");
        if (code.equals("200")){
            return "success";
        }
        return "error";
    }
    
    public static void main(String[] args) {
    	try {
			String result=checkMsg("15527124409","8257");
			System.out.println(result);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}