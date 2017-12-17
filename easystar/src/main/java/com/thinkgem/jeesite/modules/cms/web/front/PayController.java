/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.cms.web.front;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pingplusplus.model.Charge;
import com.pingplusplus.model.Event;
import com.pingplusplus.model.EventData;
import com.pingplusplus.model.PingppObject;
import com.pingplusplus.model.Webhooks;
import com.alibaba.fastjson.JSONObject;
import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.common.BitMatrix;
import com.pingplusplus.Pingpp;
import com.pingplusplus.exception.APIConnectionException;
import com.pingplusplus.exception.APIException;
import com.pingplusplus.exception.AuthenticationException;
import com.pingplusplus.exception.ChannelException;
import com.pingplusplus.exception.InvalidRequestException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.utils.IdGen;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.cms.entity.Site;
import com.thinkgem.jeesite.modules.cms.utils.CmsUtils;
import com.thinkgem.jeesite.modules.mt.entity.TTask;
import com.thinkgem.jeesite.modules.mt.entity.TUser;
import com.thinkgem.jeesite.modules.mt.service.TUserService;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.security.SystemAuthorizingRealm.Principal;
import com.thinkgem.jeesite.modules.sys.service.SystemService;
import com.thinkgem.jeesite.modules.sys.utils.MatrixToImageWriter;
import com.thinkgem.jeesite.modules.sys.utils.QRCodeEvents;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.sys.utils.http.HttpRequest;
import com.thinkgem.jeesite.modules.sys.utils.msgCode.MobileMessageCheck;
import com.thinkgem.jeesite.modules.sys.utils.msgCode.SendCode;

/**
 * 测试Controller
 * @author ThinkGem
 * @version 2014-02-28
 */
@Controller
@RequestMapping(value = "${frontPath}/pay")
public class PayController extends BaseController {
	@Autowired
	SystemService systemService;
    @Autowired
    TUserService tUserService;
    
	@RequestMapping("/apppay")
	@ResponseBody
	public String pay(String amount,String subject,String body) throws AuthenticationException, InvalidRequestException, APIConnectionException, APIException, ChannelException{
		Date date=new Date();
		  DateFormat format=new SimpleDateFormat("yyyyMMddHHmmss");
		  int r1=(int)(Math.random()*(10));
		  String time=format.format(date);
		  String order_no=time+r1;
//		  String amount="1";
		  String paytype="alipay_pc_direct";
		  BigDecimal b1 = new BigDecimal(Double.parseDouble(amount));
	      BigDecimal b2 = new BigDecimal(100);
	      double b3=b1.multiply(b2).doubleValue();
		  Pingpp.apiKey = "sk_live_8aTCa1yPeLG4iPebrDvj9i5S ";
		  Map<String, Object> chargeParams = new HashMap<String, Object>();
		  chargeParams.put("order_no",order_no);
		  chargeParams.put("amount", b3);//订单总金额, 人民币单位：分（如订单总金额为 1 元，此处请填 100）
		  Map<String, String> app = new HashMap<String, String>();
		  app.put("id", "app_n1eDy5DuffbHSivv");
		  chargeParams.put("app", app);
		  chargeParams.put("channel", paytype);
		  chargeParams.put("currency", "cny");
		  chargeParams.put("client_ip",  "127.0.0.1");
		  chargeParams.put("subject",subject);//标题：如学车本金
		  chargeParams.put("body", body);//内容：私教学车服务费
		  
		  Map<String, String> extramap = new HashMap<String, String>();
	        //extra的参数根据文档: https://pingxx.com/document/api#api-c-new
	        extramap.put("success_url", "http://192.168.1.103:8181/easystar/f/pay/backnotice");

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
        Event event = Webhooks.eventParse(buffer.toString());
        System.out.println(event);
        if ("charge.succeeded".equals(event.getType())) {
        	//
            EventData ed=event.getData();
            PingppObject po=ed.getObject();
            String s=po.toString();
            System.out.println(s);
        }
        response.setStatus(200);
	}
	
	@RequestMapping(value = "tophoto")
	public String tophoto(TUser tUser,Model model){
        model.addAttribute("tUser", tUser);
        return "modules/sys/mobileslider";
    }
	
	/**
	 * 
	  * @Description:扫码之后跳转到这个注册的页面，此时是含有邀请人链接的
	  * @param tUser
	  * @param model
	  * @return
	  * String 返回类型
	  * @author：dongge
	  * @date：2017年12月8日下午5:01:56
	 */
    @RequestMapping(value = "toreg")
    public String toreg(TUser tUser,Model model){
        model.addAttribute("tUser", tUser);
        return "modules/sys/reg";
    }
	
	
	/**
     * 此处是扫描之后跳转到此页面进行注册的操作
     * 二维码上面对应的url链接就是这边的。对应的就是他的手机号码
     * 保存的同时也要给当前用户生成一个二维码
	 * @throws Exception 
     */
    @RequestMapping(value="savereg")
    public String gettoreg(HttpServletRequest request,TUser tUser,Model model) throws Exception {
        //将对象进行保存-邀请人字段，已经直接映射到对象里了
        systemService.saveRegister(tUser);
        //通过注册的手机号，查询出当前所对应的t_user表中的id
        tUser=tUserService.getUserByLoginName(tUser.gettLoginname());
        //注册成功之后就同步生成二维码图片
//        String text ="http://192.168.1.103:8181/easystar/f/pay/toreg?tInviter="+tUser.getId();
        String text ="http://120.78.211.240/easystar/f/pay/tophoto?tInviter="+tUser.getId();
        int width = 100;    //二维码图片的宽
        int height = 100;   //二维码图片的高
        String format = "png";  //二维码图片的格式
        String pathname=tUser.getId();
        String pathName=QRCodeEvents.generateQRCode(request,pathname, text, width, height, format);
        //将图片的地址直接存在数据库中
        Map<String,String> map=new HashMap<String,String>();
        String id=IdGen.uuid();
        map.put("id", id);
        map.put("phone",pathname);
        map.put("pathName",pathName);
        tUserService.addpicturecode(map);
        String url=tUserService.getphotourl(pathname);
	    model.addAttribute("url", url);
//	    String result=HttpRequest.sendPost("http://192.168.1.103:8181/easystar/a/login", "username="+tUser.gettLoginname()+"&password="+tUser.getReserve1());
//	    System.out.println(result);
//	    return "modules/sys/mycenter";
        return "redirect:"+Global.getFrontPath()+"/pay/tologin?repage";
    } 
	
    /**
      * @Description: 登录
      * @param tUser
      * @param model
      * @return
      * String 返回类型
      * @author：dongge
      * @date：2017年12月12日上午10:18:45
     */
    @RequestMapping(value = "tologin")
    public String login(TUser tUser,Model model){
        return "modules/sys/login";
    }
    
    
    /**
     * 跳转到我的推广页面
     * @param tUser
     * @param model
     * @return
     */
    @RequestMapping(value = "toextend")
    public String toextend(TUser tUser,Model model){
    	//获取当前用户的id
    	Principal principal = UserUtils.getPrincipal();
    	tUser=tUserService.getUserByLoginName(principal.getLoginName());
    	String id=tUser.getId();
    	//通过当前用户id获取推广A类下的总人数
    	int extendA=tUserService.getcountExtendA(id);
    	int extendB=tUserService.getcountExtendB(id);
    	int extendC=tUserService.getcountExtendC(id);
    	int extendAll=extendA+extendB+extendC;
    	model.addAttribute("extendA", extendA);
    	model.addAttribute("extendB", extendB);
    	model.addAttribute("extendC", extendC);
    	model.addAttribute("extendAll", extendAll);
        return "modules/sys/myextend";
    }
    
    /**
     * 跳转到我的推广人数详细页面
     * @param tUser
     * @param model
     * @return
     */
    @RequestMapping(value = "toextenddetail")
    public String toextenddetail(String type,Model model){
    	//获取当前用户的id
    	Principal principal = UserUtils.getPrincipal();
    	TUser tUser=tUserService.getUserByLoginName(principal.getLoginName());
    	String id=tUser.getId();
    	//通过传递过来的类型，判断是A,B，C类
    	List<TUser> extendList=new ArrayList<TUser>();
    	if("A".equals(type)){
    		extendList=tUserService.getListExtendA(id);
    	}else if("B".equals(type)){
    		extendList=tUserService.getListExtendB(id);
    	}else if("C".equals(type)){
    		extendList=tUserService.getListExtendC(id);
    	}
    	model.addAttribute("extendList", extendList);
        return "modules/sys/myextenddetail";
    }
    
    
    /**
      * @Description: 发送验证码
      * @param postData
      * @param req
      * @param res
      * @return
      * Map<String,Object> 返回类型
      * @author：dongge
      * @date：2017年12月12日下午12:59:33
     */
    @RequestMapping(value = "getSmscode")
    @ResponseBody
    public String getSmscode(String phone){
        //项目的id  如果为空，则转递空字符串即可！
        String result=SendCode.sendMsg(phone);
        System.out.println(result);
        return result;
    }
    
    /**
      * @Description: 验证验证码
      * @param postData
      * @param req
      * @param res
      * @return
      * @throws IOException
      * Map<String,Object> 返回类型
      * @author：dongge
      * @date：2017年12月12日下午1:00:08
     */
    @RequestMapping(value = "checksmscode")
    @ResponseBody
    public String checksmscode(String phone,String code) throws IOException{
        //项目的id  如果为空，则转递空字符串即可！
        String result=MobileMessageCheck.checkMsg(phone, code);
        return result;
    }
    
    
    
    @RequestMapping(value = "smscodelogin")
    @ResponseBody
    public Map<String,String> smscodelogin(TUser tUser,Model model){
        System.out.println(tUser.gettPhone()+"====");
        tUser=tUserService.getTUserByPhone(tUser.gettPhone());
        Map<String,String> map=new HashMap<String,String>();
        if(tUser!=null){
        	map.put("username", tUser.gettLoginname());
            map.put("password", tUser.getReserve1());
            map.put("msg", "1");
        }else{
        	map.put("msg", "0");
        }
        return map;
    }
    
    /**
     * 
      * @Description: 查看用户名是否已经被注册过了
      * @param username
      * @return
      * String 返回类型
      * @author：dongge
      * @date：2017年12月14日下午4:16:03
     */
    @RequestMapping(value = "checkusername")
    @ResponseBody
    public String checkusername(String userName){
        int count=tUserService.checkusername(userName);
        String result="1";
        if(count>0){
            result="2"; 
        }
        return result;
    }
    
    
    @RequestMapping(value = "checkphone")
    @ResponseBody
    public String checkphone(String phone){
        int count=tUserService.checkphone(phone);
        String result="1";
        if(count>0){
            result="2"; 
        }
        return result;
    }
}
   