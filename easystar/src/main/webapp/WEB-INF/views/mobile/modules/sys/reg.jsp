<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>注册米兔</title>
<meta name="format-detection" content="telephone=no" />
<link href="${ctxStatic}/reg-login/css/reg.css" rel="stylesheet"
	type="text/css" />
<script src="${ctxStatic}/reg-login/js/jquery-1.8.2.min.js"></script>
<meta name="viewport"
	content="width=device-width,  initial-scale=1.0, user-scalable=0, minimum-scale=1.0,  maximum-scale=1.0" />
<meta name="format-detection" content="telephone=no" />
<!-- for apple -->
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="apple-mobile-web-app-status-bar-style" content="black" />
<meta content="black" name="apple-mobile-web-app-status-bar-style" />
<script type="text/javascript">
    function doGetSmsCode(){
    	var phone=$("#mobile").val();
    	if(phone==""){
    		alert("手机号不能为空");
    		$("#mobile").focus();
    		return false;
    	}
    	$.ajax({
    		url:'${ctx}/pay/getSmscode',
    		type:'post',
    		data : {phone:phone},
    		success:function(data){
    			var aa=JSON.parse(data);
    			if(aa.code=="200"){
					alert("验证码已发送");    				
    			}else{
    				alert("验证码发送失败");
    			}
    		}
    	})
    }
    
    function checksmscode(){
    	var phone=$("#mobile").val();
    	var code=$("#code").val();
    	var result=false;
    	$.ajax({
    		url:'${ctx}/pay/checksmscode',
    		type:'post',
    		async:false,
    		data:{phone:phone,code:code},
    		success:function(data){
    			if(data=="success"){
    				result=true;
    			}
    		}
    	})
    	return result;
    }
    
    //验证用户名是否已经有人注册过了！
    function checkusername(){
    	var userName=$("#userName").val();
    	$.ajax({
    		url:'${ctx}/pay/checkusername',
    		type:'post',
    		data:{userName:userName},
    		success:function(data){
    			if(data=="2"){
    				alert("此用户名已经被注册过了");
    				$("#userName").val("");
    				$("#userName").focus();
    			}
    		}
    	})
    }
    
  //验证手机号是否已经有人注册过了！
    function checkphone(){
    	var phone=$("#mobile").val();
    	$.ajax({
    		url:'${ctx}/pay/checkphone',
    		type:'post',
    		data:{phone:phone},
    		success:function(data){
    			if(data=="2"){
    				alert("此手机号已经被注册过了");
    				$("#mobile").val("");
    				$("#mobile").focus();
    			}
    		}
    	})
    }
  
  
    function zhuce(){
    	var userName=$("#userName").val();
    	var password=$("#pwd").val();
    	var mobile=$("#mobile").val();
    	if(userName==""){
    		$("#userName").focus();
    		return false;
    	}
    	if(password==""){
    		$("#pwd").focus();
    		return false;
    	}
    	if(mobile==""){
    		$("#mobile").focus();
    		return false;
    	}
    	if(!checksmscode()){
    		alert("验证码错误");
    		return false;
    	}
    	$("#touchForm").submit();
    }
    </script>
</head>
<body>
<form id="touchForm" action="${ctx}/pay/savereg" method="post">
	<input type="hidden" name="tInviter" value="${tUser.tInviter}">
	<div class="m-zhuce">
		<div class="inputbox" style="margin-top: 10px;">
			<label for="yonghu">用户名:</label>
			<input id="userName" onchange="checkusername()" name="tLoginname" type="text" placeholder="4-20个字符，汉字，字母，数字">
		</div>
		<div class="inputbox">
			<label for="mima">密&nbsp;&nbsp;码:</label>
			<input id="pwd" name="reserve1" type="password" placeholder="4-20个字符，汉字，字母，数字">
			<img src="${ctxStatic}/reg-login/images/mycenter/yanjing.png">
		</div>
		<div class="inputbox">
			<label for="phone">手机号:</label>
			<input id="mobile" name="tPhone" onchange="checkphone()" type="text" placeholder="11位大陆手机号">
		</div>
		<div class="inputbox">
			<label for="yanzheng">验证码:</label>
			<input id="code" name="code" type="text">
			<button class="yanzheng" id="btnSendCode">获取验证码</button>
		</div>
		<button type="submit" class="bt_zc" onclick="zhuce()">注册</button>
		<div class="m-nav" style="margin-top: 10px;">
			<div class="text"></div>
			<a class="right">已有账号，立即登录</a>
		</div>
		<div class="tishi">
			<div class="title">
				<strong>温馨提示:</strong>
			</div>
			<div class="text">1.请确认您接收的短信是否被手机安全软件拦截 (如：360安全卫士、腾讯手机管家等)。</div>
			<div class="text">2.若长时间仍未激活，请联系客服<a href="tel:027-52344488">027-52344488</a>。</div>
		</div>
		<div class="banquan" style="font-size: 9px">Copyright © 米兔平台All Rights Reserved(2017-2020)版权所有。</div>
	</div>
</form>
	<script type="text/javascript">
	 var click = true; 		
	 var content = document.querySelector(".yanzheng");  
		 content.addEventListener("touchstart", function(){  
		 	if(click){
		 		click = false;
		 		doGetSmsCode();
		 		sendMessage();
		 	}
		 }); 

		var InterValObj; //timer变量，控制时间 
		var count = 60; //间隔函数，1秒执行 
		var curCount;//当前剩余秒数 
		  
		function sendMessage() { 
			console.log(0);
		 　curCount = count; 
		　　//设置button效果，开始计时 
		   $("#btnSendCode").html(curCount); 
		   $("#btnSendCode").addClass("yanzheng_on");
		   InterValObj = window.setInterval(SetRemainTime, 1000); //启动计时器，1秒执行一次 
		　　  
		  
		} 
		  
		//timer处理函数 
		function SetRemainTime() { 
		      if (curCount == 0) {         
		        window.clearInterval(InterValObj);//停止计时器 
		        $("#btnSendCode").removeClass("yanzheng_on");
		        $("#btnSendCode").html("重新发送"); 
		        click = true;
		      } 
		      else { 
		        curCount--; 
		        $("#btnSendCode").html(curCount); 
		      } 
		    } 
	</script>
</body>
</html>