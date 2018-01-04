<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" >
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-title" content="">
<meta name="format-detection" content="telephone=no">
<script src="${ctxStatic}/reg-login/js/jquery.js"></script>
<script src="${ctxStatic}/reg-login/js/avalon.js" type="text/javascript"></script>
<title>米兔登陆</title>
<meta name="keywords" content="">
<meta name="description" content="">
<style type="text/css">
.ms-controller {
	visibility: hidden
}
.m-denglu .box{
 	width: 90%;
 	margin: 0 auto;
}
.m-denglu .pop{
	position: fixed;
    z-index: 999;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background: rgba(0,0,0,.6);
    display: flex;
    align-items: center;
    justify-content: center;
}
.m-denglu .pop .boxs .top{
	padding: 10px;
	border-bottom: 1px solid #ddd;
}
.m-denglu .pop .boxs .bot{
	padding: 10px;
	color: #5a9fd9;
	text-align: center;
}
.m-denglu .pop .boxs{
	width: 75%;
	border-radius: 5px;
	background-color: white;
}
.m-denglu .pop .boxs h1{
	font-size: 18px;
	color: #5a9fd9;
	text-align: center;
}
.m-denglu .pop .boxs strong{
	font-size: 16px;
	color: #5a9fd9;
	text-align: center;
}
.m-denglu .wanle{
 	color: #5a9fd9;
    font-size: 14px;
    margin-right: 10px;
}
.m-denglu .banner{
	width: 100%;
	height: 120px;
 	background: url(${ctxStatic}/reg-login/images/img/mitu.png) center center no-repeat;
    background-size: 70%;
}
.m-denglu .bt_zc{
	background-color: #5a9fd9;
	border-radius: 5px;
	border: 1px solid #317dbf;
	color: white;
	height: 40px;
	width: 90%;
	margin-left: 5%;
	margin-top: 10px;
}
.m-denglu .inputbox{
	width: 100%;
 	display: flex;
 	align-items: center;
 	border: 1px solid #ddd;
 	height: 40px;
 	margin-bottom: 10px;
 	border-radius: 5px;
}
.m-denglu .inputbox .yanzheng{
	height: 36px;
	background-color: #5a9fd9;
	border-radius: 5px;
	border: 1px solid #317dbf;
	color: white;
	line-height: 36px;
	margin-right: 1px;
	font-size: 12px;
	width: 80px;
}.m-denglu .inputbox .yanzheng_on{
	background-color: #bbb;
	border: 1px solid #adadad;
}
.m-denglu .inputbox img{
	margin-right: 10px;
	width: 20px;
}
.m-denglu .inputbox label{
 	font-size: 14px;
 	color: #333;
 	width: 60px;
 	text-align: center;
}
.m-denglu .inputbox input{
 	border: 0;
 	flex-grow: 1;
 	font-size: 12px;
 	width: 50%;
}
.m-denglu .m-nav{
 	display: flex;
 	align-items: center;
 	justify-content: space-between;
 	width: 100%;
 	border-bottom: 1px solid #ddd;
 	margin-bottom: 10px;
}
.m-denglu .m-nav .text{
    color: #333;
    font-size: 14px;
    text-align: center;
    width: 50%;
    height: 40px;
    line-height: 40px;
    border-bottom: 2px solid white;
}
.m-denglu .m-nav .color{
 	color: #5a9fd9;
 	border-bottom: 2px solid #5a9fd9;
}
body{
	margin: 0;
	padding: 0;
}
html{
	margin: 0;
	padding: 0;
}
img{
	margin: 0;
	padding: 0;
}
a{
	display: block;
	text-decoration: none;
}
input,button{
	outline:none;
}
</style>
<script type="text/javascript">
	avalon.define({
		$id : 'test',
		show : true,
		pop : false,

	})
</script>

<script type="text/javascript">
//获取验证码
function doGetSmsCode(){
    	var phone=$("#mobile").val();
    	if(phone==""){
    		alert("手机号不能为空");
    		$("#mobile").focus();
    		return;
    	}
    	$.ajax({
    		url:'${pageContext.request.contextPath}/f/pay/getSmscode',
    		type:'post',
    		data : {phone:phone},
    		success:function(data){
    			var aa=JSON.parse(data);
    			if(aa.code==200){
					alert("验证码已发送");    				
    			}else{
    				alert("验证码发送失败");
    			}
    		}
    	})
    }

//校验验证码
function checksmscode(){
    	var phone=$("#mobile").val();
    	var code=$("#code").val();
    	var result=false;
    	$.ajax({
    		url:'${pageContext.request.contextPath}/f/pay/checksmscode',
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

//短信登陆提交
function checksms(){
	var phone=$("#mobile").val();
	var code=$("#code").val();
	if(phone==""){
		alert("手机号不能为空");
		$("#mobile").focus();
		return false;
	}
	if(code==""){
		alert("验证码不能为空");
		$("#code").focus();
		return false;
	}
	if(!checksmscode()){
		alert("验证码输入错误");
		$("#code").val("");
		$("#code").focus();
		return false;
	}
	$.ajax({
		url:'${pageContext.request.contextPath}/f/pay/smscodelogin',
		type:'post',
		data:{tPhone:phone},
		success:function(data){
			if(data.msg=="1"){
				$("#loginName").val(data.username);
				$("#password").val(data.password);
				$("#formsubmit").submit();
			}else{
				alert("此手机号还未注册过！");
			}
		}
	})
}


function userlogin(){
	var username=$("#loginName").val();
	var password=$("#password").val();
	if(username==""){
		alert("用户名不能为空");
		$("#loginName").focus();
		return false;
	}
	if(password==""){
		alert("用户名不能为空");
		$("#password").focus();
		return false;
	}
	if(username!=""&&password!=""){
		$("#formsubmit").submit();
	}
}
</script>

</head>
<body>
<div class="m-denglu ms-controller" ms-controller="test">
		<div class="banner">
			
		</div>
		<div class="m-nav">
			<div :class="['text',@show?'color':'']" ms-on-tap="@show = true">账号密码登录</div>
			<div :class="['text',!@show?'color':'']" ms-on-tap="@show = false">手机验证登录</div>
		</div>
		<!-- 这里是普通的账户密码登录 -->
		<form id="formsubmit" action="${pageContext.request.contextPath}/a/login" method="post">
		<div class="box" :visible="@show">
			<div class="inputbox">
				<label for="yonghu">用户名:</label>
				<input id="loginName" name="username" type="text" placeholder="请输入用户名">
			</div>
			<div class="inputbox">
				<label for="mima">密 码:</label>
				<input id="password" type="password" name="password" placeholder="请输入密码">
				<span class="wanle" ms-on-tap="@pop = true">忘记密码</span>
			</div>
			<button class="bt_zc" onclick="userlogin()">
				登录
			</button>
		</div>
		</form>
		<div class="box" :visible="!@show">
			<div class="inputbox">
				<label for="phone">手机号:</label>
				<input id="mobile" name="tPhone" type="text" placeholder="请输入手机号">
			</div>
			<div class="inputbox">
				<label for="yanzheng">验证码:</label>
				<input id="code" type="text">
				<button class="yanzheng" id="btnSendCode">获取验证码</button>
			</div>
			<button class="bt_zc" onclick="checksms()">
				登录
			</button>
		</div>
		
		
		<div class="pop" :visible="@pop">
			<div class="boxs">
				<div class="top">
					<h1>忘记密码</h1>
					<p>
						<strong>手机号</strong>用户可使用[手机号+验证码]登录
					</p>
					<p>
						<strong>普通账号</strong>用户可在电脑上登录米兔网站找回密码
					</p>
				</div>
				<div class="bot" ms-on-tap="@pop = false">
					我知道了
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	 var click = true; 		
	 var content = document.querySelector(".yanzheng");  
		 content.addEventListener("touchstart", function(){  
		 	if(click){
		 		click = false;
		 		sendMessage();
		 		doGetSmsCode();
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