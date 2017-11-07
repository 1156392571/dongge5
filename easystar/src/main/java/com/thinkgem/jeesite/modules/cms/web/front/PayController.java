/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.cms.web.front;

import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import com.pingplusplus.model.Charge;
import com.pingplusplus.Pingpp;
import com.pingplusplus.exception.APIConnectionException;
import com.pingplusplus.exception.APIException;
import com.pingplusplus.exception.AuthenticationException;
import com.pingplusplus.exception.ChannelException;
import com.pingplusplus.exception.InvalidRequestException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
	public void pay() throws AuthenticationException, InvalidRequestException, APIConnectionException, APIException, ChannelException{
		Date date=new Date();
		  DateFormat format=new SimpleDateFormat("yyyyMMddHHmmss");
		  int r1=(int)(Math.random()*(10));
		  String time=format.format(date);
		  String order_no=time+r1;
		  String amount="1";
		  String paytype="upacp";
		  BigDecimal b1 = new BigDecimal(Double.parseDouble(amount));
	      BigDecimal b2 = new BigDecimal(100);
	      double b3=b1.multiply(b2).doubleValue();
		  Pingpp.apiKey = "sk_live_H0qHCSvv1yvHDSubHOzDe10S";
		  Map<String, Object> chargeParams = new HashMap<String, Object>();
		  chargeParams.put("order_no",order_no);
		  chargeParams.put("amount", b3);//订单总金额, 人民币单位：分（如订单总金额为 1 元，此处请填 100）
		  Map<String, String> app = new HashMap<String, String>();
		  app.put("id", "app_H0uX9GTan5a5jLKm");
		  chargeParams.put("app", app);
		  chargeParams.put("channel", paytype);
		  chargeParams.put("currency", "cny");
		  chargeParams.put("client_ip",  "127.0.0.1");
		  chargeParams.put("subject",  "报名定金");
		  chargeParams.put("body",  "私教学车报名服务费");
		  Charge charge=Charge.create(chargeParams);
	}
	  
	
}
