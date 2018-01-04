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
import com.thinkgem.jeesite.common.utils.DateUtils;
import com.thinkgem.jeesite.common.utils.IdGen;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.cms.entity.Site;
import com.thinkgem.jeesite.modules.cms.utils.CmsUtils;
import com.thinkgem.jeesite.modules.mt.entity.TMobileTask;
import com.thinkgem.jeesite.modules.mt.entity.TMobiletaskApply;
import com.thinkgem.jeesite.modules.mt.entity.TTask;
import com.thinkgem.jeesite.modules.mt.entity.TTixian;
import com.thinkgem.jeesite.modules.mt.entity.TUser;
import com.thinkgem.jeesite.modules.mt.service.TMobileTaskService;
import com.thinkgem.jeesite.modules.mt.service.TMobiletaskApplyService;
import com.thinkgem.jeesite.modules.mt.service.TTixianService;
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
    @Autowired
    TMobileTaskService tMobileTaskService;
    @Autowired
    TMobiletaskApplyService tMobiletaskApplyService;
    @Autowired
    TTixianService tTixianService;
    
    
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
	
	/**
	  * @Description: 扫描二维码图片之后进行图片轮播
	  * @param tUser  邀请人的id信息
	  * @param model
	  * @return
	  * String 返回类型
	  * @author：dongge
	  * @date：2017年12月20日下午1:06:48
	 */
	@RequestMapping(value = "tophoto")
	public String tophoto(TUser tUser,Model model){
        model.addAttribute("tUser", tUser);
        return "modules/sys/mobileslider";
    }
	
	/**
	 * 
	  * @Description:扫码之后跳转到这个注册的页面，此时是含有邀请人链接的
	  * @param tUser 邀请人的id信息
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
    @ResponseBody
    public String gettoreg(HttpServletRequest request,TUser tUser,Model model) throws Exception {
        //将对象进行保存-邀请人字段，已经直接映射到对象里了
        //设置签到字段默认为1，签到天数为0
        tUser.setReserve2("1");
        tUser.setReserve3(0);
        String result="";
        try {
     	   systemService.saveRegister(tUser);
            //通过注册的手机号，查询出当前所对应的t_user表中的id
            tUser=tUserService.getUserByLoginName(tUser.gettLoginname());
            //注册成功之后就同步生成二维码图片
//            String text ="http://192.168.1.103:8181/easystar/f/pay/toreg?tInviter="+tUser.getId();
            String text ="http://www.168mitu.com/easystar/f/pay/tophoto?tInviter="+tUser.getId();
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
            //注册成功之后将获得理财金的消息推送到消息列表中
            Map<String,Object> usermap=new HashMap<String,Object>();
            String dtlId=IdGen.uuid();
            usermap.put("id", dtlId);
            usermap.put("tma_userid", tUser.getId());
            usermap.put("tma_dtlname", "注册送理财金");
            usermap.put("tma_jine",100);
            tUserService.addtomobileacountdtl(usermap);
            //注册成功之后，将你的上面的人，增加对应的理财金，同时增加对应的理财金消息
            //1.获取自己的上级A,B,C
            String Auserid=tUser.gettInviter();
            String Buserid=tUserService.get(Auserid).gettInviter();
            String Cuserid=tUserService.get(Buserid).gettInviter();
            System.out.println(Auserid+Buserid+Cuserid);
            //-------------------------------------------
            Map<String,Object> Ausermap=new HashMap<String,Object>();
            String Aid=IdGen.uuid();
            Ausermap.put("id", Aid);
            Ausermap.put("tma_userid", Auserid);
            Ausermap.put("tma_dtlname", tUser.gettPhone());
            Ausermap.put("tma_jine",50);
            Ausermap.put("tma_comeuserid",tUser.getId());
            tUserService.addtomanageacountdtl(Ausermap);
            //通过用户id以及金额给对应的理财金账户加钱
            tUserService.addmanageacount(Ausermap);
          //-------------------------------------------
            Map<String,Object> Busermap=new HashMap<String,Object>();
            String Bid=IdGen.uuid();
            Busermap.put("id", Bid);
            Busermap.put("tma_userid", Buserid);
            Busermap.put("tma_dtlname", tUser.gettPhone());
            Busermap.put("tma_jine",30);
            Busermap.put("tma_comeuserid",tUser.getId());
            tUserService.addtomanageacountdtl(Busermap);
          //通过用户id以及金额给对应的理财金账户加钱
            tUserService.addmanageacount(Busermap);
          //-------------------------------------------
            Map<String,Object> Cusermap=new HashMap<String,Object>();
            String Cid=IdGen.uuid();
            Cusermap.put("id", Cid);
            Cusermap.put("tma_userid", Cuserid);
            Cusermap.put("tma_dtlname", tUser.gettPhone());
            Cusermap.put("tma_jine",20);
            Cusermap.put("tma_comeuserid",tUser.getId());
            tUserService.addtomanageacountdtl(Cusermap);
          //通过用户id以及金额给对应的理财金账户加钱
            tUserService.addmanageacount(Cusermap);
            result="1";
 		} catch (Exception e) {
 			e.getMessage();
 			result="0";
 		}
        return result;
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
     * 注册成功之后跳转到扫公众号页面
     * @return
     */
    @RequestMapping(value = "tomygongzhonghao")
    public String tomygongzhonghao(){
        return "modules/sys/mygongzhonghao";
    }
    
    /**
     * 
     * @param tUser
     * @param model
     * @return
     */
    @RequestMapping(value = "tomycenter")
    public String tomycenter(TUser tUser,Model model){
    	Principal principal = UserUtils.getPrincipal();
    	tUser=tUserService.getUserByLoginName(principal.getLoginName());
    	String id=tUser.getId();
	    String url=tUserService.getphotourl(id);
	    model.addAttribute("url", url);
	    model.addAttribute("tUser", tUser);
	    //查出推荐人信息
	    TUser tUser1=tUserService.get(tUser.gettInviter());
	    String phone="";
	    if(tUser1!=null){
	    	phone=tUser1.gettPhone();
	    }
	    model.addAttribute("phonenumber",phone);
	    return "modules/sys/mycenter";
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
    	//获取当前时间
    	String nowtime=DateUtils.getDate();
    	model.addAttribute("nowtime", nowtime);
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
    
    
    /**
     * 通过手机号获取当前的账户密码信息
      * @Description: 短信验证码登录的接口
      * @param tUser
      * @param model
      * @return
      * Map<String,String> 返回类型
      * @author：dongge
      * @date：2017年12月20日下午1:05:42
     */
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
    
    /**
     * 
      * @Description: 查看数据库中是否已经含有相同的手机号码了
      * @param phone
      * @return
      * String 返回类型
      * @author：dongge
      * @date：2017年12月20日下午1:03:36
     */
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
    
    /**
     * 
      * @Description: 签到信息
      * @param tUser
      * @return
      * String 返回类型
      * @author：dongge
      * @date：2017年12月20日下午1:09:34
     */
    @RequestMapping(value = "register")
    @ResponseBody
    public String register(TUser tUser){
        String result="0";
        //获取当前用户信息
        Principal principal=UserUtils.getPrincipal();
        String loginName=principal.getLoginName();
        //通过当前用户名获取登录状态
        tUser=tUserService.getUserByLoginName(loginName);
        if("1".equals(tUser.getReserve2())){
            //说明还未签到
            try{
            	//新增签到信息
                tUserService.register(loginName);
                //签到的同时想明细表中添加明细
                Map<String,Object> map=new HashMap<String,Object>();
                String id=IdGen.uuid();
                map.put("id", id);
                map.put("tma_userid", tUser.getId());
                map.put("tma_dtlname", "签到");
                map.put("tma_jine",0.5);
                tUserService.addtomobileacountdtl(map);
                result="1";
            }
            catch (Exception e){
                e.getMessage();
            }
        }else{
            result="2";
        }
        return result;
    }
    
    /**
     * 跳转到任务列表页面
     * @param tUser
     * @param model
     * @return
     */
    @RequestMapping(value = "tomytask")
    public String tomytask(TUser tUser,Model model){
        //获取当前的所有任务列表，并排序
        TMobileTask tMobileTask=new TMobileTask();
        List<TMobileTask> list=tMobileTaskService.findList(tMobileTask);
        model.addAttribute("list", list);
        return "modules/sys/mytask";
    }
    
    /**
      * @Description: 跳转到我任务详情页面
      * @param tMobileTask
      * @param model
      * @return
      * String 返回类型
      * @author：dongge
      * @date：2017年12月21日下午4:07:39
     */
    @RequestMapping(value = "totaskdetails")
    public String totaskdetails(TMobileTask tMobileTask,Model model){
        //获取当前的所有任务列表，并排序
        tMobileTask=tMobileTaskService.get(tMobileTask);
        Principal principal=UserUtils.getPrincipal();
        String loginName=principal.getLoginName();
        //通过当前用户名获取登录状态
        TUser tUser=tUserService.getUserByLoginName(loginName);
        model.addAttribute("tUser", tUser);
        model.addAttribute("tMobileTask", tMobileTask);
        return "modules/sys/mytaskdetails";
    }
    
    @RequestMapping(value = "tomyhead")
    public String tomyhead(TUser tUser,Model model){
    	Principal principal=UserUtils.getPrincipal();
        String loginName=principal.getLoginName();
        //通过当前用户名获取登录状态
        tUser=tUserService.getUserByLoginName(loginName);
        //获取理财金的天数
        int day=tUserService.getLCdaysByLoginName(loginName);
        //获取今日收益
        String count=tUserService.gettodayMoney(tUser.getId());
        model.addAttribute("count", count);
        model.addAttribute("day", day);
        model.addAttribute("tUser", tUser);
        return "modules/sys/myhead";
    }
    
    @RequestMapping(value = "tomyfanxian")
    public String tomyfanxian(TUser tUser,Model model){
    	//查询自己当前的ABC级已赚赏金
    	Principal principal=UserUtils.getPrincipal();
        String loginName=principal.getLoginName();
        //通过当前用户名获取登录状态
        tUser=tUserService.getUserByLoginName(loginName);
    	//获取已赚取的赏金
        List<Map<Object,Object>> listA=tUserService.getAfanxianAll(tUser.getId());
    	//赏金在路上
        List<Map<Object,Object>> listB=tUserService.getBfanxianAll(tUser.getId());
    	//赏金溜走的
        List<Map<Object,Object>> listC=tUserService.getCfanxianAll(tUser.getId());    	
        model.addAttribute("tUser", tUser);
        model.addAttribute("listA", listA);
        model.addAttribute("listB", listB);
        model.addAttribute("listC", listC);
        return "modules/sys/myfanxian";
    }
    
    @RequestMapping(value = "tolianxime")
    public String tolianxime(){
        return "modules/sys/mylianxime";
    }
    
    @RequestMapping(value = "toguanyume")
    public String toguanyume(){
        return "modules/sys/myguanyume";
    }
    
    @RequestMapping(value = "tomyxiaoxi")
    public String tomyxiaoxi(Model model){
    	Principal principal=UserUtils.getPrincipal();
        String loginName=principal.getLoginName();
        //通过当前用户名获取关于自己的消息记录
        List<Map<Object,Object>> list=tUserService.getmessageList(loginName);
        model.addAttribute("xiaoxilist",list);
        return "modules/sys/myxiaoxi";
    } 
    
    
    @RequestMapping(value = "tohandApply")
    @ResponseBody
    public String tohandApply(TMobiletaskApply tMobiletaskApply){
    	String result="0";
    	Principal principal=UserUtils.getPrincipal();
        String loginName=principal.getLoginName();
        TUser tUser=tUserService.getUserByLoginName(loginName);
        tMobiletaskApply.setTmaUserid(tUser.getId());
        tMobiletaskApplyService.save(tMobiletaskApply);
        if("1".equals(tMobiletaskApply.getTetReserve1())){
        	//说明当前账号还未存储真实姓名信息
        	tUser.settName(tMobiletaskApply.getTmaName());
        	tUser.setReserve4(tMobiletaskApply.getTmaCardid());
        	tUserService.setnameandpid(tUser);
        }
        result="1";
    	return result;
    }
    
    /**
     * 跳转到我的资料
     * @param tUser
     * @param model
     * @return
     */
    @RequestMapping(value = "tomyziliao")
    public String tomyziliao(TUser tUser,Model model){
    	Principal principal=UserUtils.getPrincipal();
        String loginName=principal.getLoginName();
        tUser=tUserService.getUserByLoginName(loginName);
        model.addAttribute("tUser",tUser);
    	return "modules/sys/myziliao";
    }
    
    /**
     * 跳转到我的二维码列表
     * @param tUser
     * @param model
     * @return
     */
    @RequestMapping(value = "tomyerweima")
    public String tomyerweima(TUser tUser,Model model){
    	Principal principal=UserUtils.getPrincipal();
        String loginName=principal.getLoginName();
        tUser=tUserService.getUserByLoginName(loginName);
        model.addAttribute("tUser",tUser);
    	return "modules/sys/myerweima";
    }
    
    @RequestMapping(value = "tomyerweimaList")
    public String tomyerweima(String type,Model model){
    	return "modules/sys/myerweimaList"+type;
    }
    
    /**
     * 跳转到我的提现页面
     * @param tUser
     * @param model
     * @return
     */
    @RequestMapping(value = "tomytixian")
    public String tomytixian(TUser tUser,Model model){
    	Principal principal=UserUtils.getPrincipal();
        String loginName=principal.getLoginName();
        //通过当前用户名获取登录状态
        tUser=tUserService.getUserByLoginName(loginName);
        model.addAttribute("tUser", tUser);
    	return "modules/sys/mytixian";
    }
    
    /**
     * 
     * @param tUser
     * @param model
     * @return
     */
    @RequestMapping(value = "tomytixianList")
    public String tomytixianList(TUser tUser,Model model){
    	Principal principal=UserUtils.getPrincipal();
        String loginName=principal.getLoginName();
        //通过当前用户名获取登录状态
        tUser=tUserService.getUserByLoginName(loginName);
        List<Map<Object,Object>> list=tUserService.gettixianList(tUser);
        model.addAttribute("list", list);
        model.addAttribute("tUser", tUser);
    	return "modules/sys/mytixianList";
    }
    
    @RequestMapping(value = "tomytixiandtl")
    public String tomytixiandtl(TTixian tTixian,Model model){
    	tTixian=tTixianService.get(tTixian);
    	model.addAttribute("tTixian", tTixian);
    	return "modules/sys/mytixiandtl";
    }
    
}
   