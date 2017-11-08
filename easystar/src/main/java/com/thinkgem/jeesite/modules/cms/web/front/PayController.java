/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.cms.web.front;

import java.io.BufferedReader;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pingplusplus.model.Charge;
import com.pingplusplus.model.Event;
import com.pingplusplus.model.EventData;
import com.pingplusplus.model.PingppObject;
import com.pingplusplus.model.Webhooks;
import com.pingplusplus.Pingpp;
import com.pingplusplus.exception.APIConnectionException;
import com.pingplusplus.exception.APIException;
import com.pingplusplus.exception.AuthenticationException;
import com.pingplusplus.exception.ChannelException;
import com.pingplusplus.exception.InvalidRequestException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.thinkgem.jeesite.common.web.BaseController;

/**
 * 测试Controller
 * @author ThinkGem
 * @version 2014-02-28
 */
@Controller
@RequestMapping(value = "${frontPath}/pay")
public class PayController extends BaseController {
	
	@RequestMapping("/apppay")
	@ResponseBody
	public String pay() throws AuthenticationException, InvalidRequestException, APIConnectionException, APIException, ChannelException{
		Date date=new Date();
		  DateFormat format=new SimpleDateFormat("yyyyMMddHHmmss");
		  int r1=(int)(Math.random()*(10));
		  String time=format.format(date);
		  String order_no=time+r1;
		  String amount="1";
		  String paytype="alipay_pc_direct";
		  BigDecimal b1 = new BigDecimal(Double.parseDouble(amount));
	      BigDecimal b2 = new BigDecimal(100);
	      double b3=b1.multiply(b2).doubleValue();
		  Pingpp.apiKey = "sk_test_ibbTe5jLGCi5rzfH4OqPW9KC ";
		  Map<String, Object> chargeParams = new HashMap<String, Object>();
		  chargeParams.put("order_no",order_no);
		  chargeParams.put("amount", b3);//订单总金额, 人民币单位：分（如订单总金额为 1 元，此处请填 100）
		  Map<String, String> app = new HashMap<String, String>();
		  app.put("id", "app_1Gqj58ynP0mHeX1q");
		  chargeParams.put("app", app);
		  chargeParams.put("channel", paytype);
		  chargeParams.put("currency", "cny");
		  chargeParams.put("client_ip",  "127.0.0.1");
		  chargeParams.put("subject",  "报名定金");
		  chargeParams.put("body", "私教学车报名服务费");
		  
		  Map<String, String> extramap = new HashMap<String, String>();
	        //extra的参数根据文档: https://pingxx.com/document/api#api-c-new
	        extramap.put("success_url", "http://192.168.1.150:8181/easystar/f/pay/backnotice");

	        // extra 取值请查看相应方法说明
	        chargeParams.put("extra", extramap);
		  
		  Charge charge=Charge.create(chargeParams);
		  System.out.println(charge.toString());
		  return charge.toString();
	}
	  
	
	@RequestMapping(value="backnotice")
	@ResponseBody
	public void backnotice(HttpServletRequest request,HttpServletResponse response) throws IOException{
		System.out.println("=====这是回调的额函数");
		//获取头部所有信息
        Enumeration headerNames = request.getHeaderNames();
        while (headerNames.hasMoreElements()) {
            String key = (String) headerNames.nextElement();
            String value = request.getHeader(key);
            System.out.println(key+" "+value);
        }
     // 获得 http body 内容
        BufferedReader reader = request.getReader();
        StringBuffer buffer = new StringBuffer();
        String string;
        while ((string = reader.readLine()) != null) {
            buffer.append(string);
        }
        reader.close();
        // 解析异步通知数据
//        Event event = Webhooks.eventParse(buffer.toString());
//        System.out.println(event);
//        if ("charge.succeeded".equals(event.getType())) {
//        	//
//            EventData ed=event.getData();
//            PingppObject po=ed.getObject();
//            String s=po.toString();
//            System.out.println(s);
//        }
        response.setStatus(200);
	}
}
