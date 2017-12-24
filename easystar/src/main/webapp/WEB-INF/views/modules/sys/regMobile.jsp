<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>用户注册</title>
<meta charset="utf-8">
<meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<link rel="stylesheet" href="${ctxStatic}/reg-login/css/style1.css">
<link rel="stylesheet" href="${ctxStatic}/reg-login/css/primary.css">
<script src="${ctxStatic}/reg-login/js/jquery-1.8.2.min.js"></script>
</head>
<body>
<header class="disBox boxAlign-center">
	    <h1 class="boxFlex fs30 cl3 owt tact">用户注册</h1>
	    <div class="wd80 pdR28">&nbsp;</div>
	</header>
	<div class="container-pdT">
		<div style="height:6rem; background:#eee;">
			<img src="img/LoginBan.jpg"/>
		</div>
		<br>
		<div class="H90 disBox boxAlign-center bgF bdbte">
			<i class="loginUser mgLR2420"></i>
			<input class="boxFlex blo fs24 cl7 bdnO" type="text" name="loginname" placeholder="请输入用户名" />
			<i class="loginClose mgR42 dsnn"></i>
		</div>		
		<div class="H90 disBox boxAlign-center bgF bdbte">
			<i class="loginUser mgLR2420"></i>
			<input class="boxFlex blo fs24 cl7 bdnO" type="text" name="zhanghao" placeholder="请输入手机号" />
			<i class="loginClose mgR42 dsnn"></i>
		</div>
		<div class="H90 disBox boxAlign-center bgF bdbte">
			<i class="loginPass mgLR2420"></i>
			<input class="boxFlex blo fs24 cl7 bdnO" type="text" name="code" placeholder="请输入验证码" />
				<input class="logincode fs24 tact clCC mgR24" type="button" value="获取验证码" onclick="time(this);getcode()">
		</div>
		<div class="H90 disBox boxAlign-center bgF bdbte">
			<i class="loginPass mgLR2420"></i>
			<input class="boxFlex blo fs24 cl7 bdnO" type="password" name="password" placeholder="请输入密码" />
		</div>
		<div class="H90 disBox boxAlign-center bgF bdbte">
			<i class="loginPass mgLR2420"></i>
			<input class="boxFlex blo fs24 cl7 bdnO" type="password" name="repassword" placeholder="请输入确认密码" />
		</div>

		<input type="submit" class="btnA bgadA04 fs26 mgbtnC" value="确定" onclick="t1()">
				
		<div class="disBox" style="width: 14.45rem; margin:0 auto;">
			<a class="clCC fs24 boxFlex blo">&nbsp;</a>
			<a class="clCC fs24 blo" href="#">账号登陆</a>
		</div>
	</div>
<script type="text/javascript">
    function t1(){
    	var loginname=$("input[name='loginname']").val();
    	var zhanghao=$("input[name='zhanghao']").val();
    	var code=$("input[name='code']").val();
    	var password=$("input[name='password']").val();
    	var password1=$("input[name='repassword']").val();
    	if(zhanghao!=""&&code!=""&&password!=""&&password1!=""){
    		if(password==password1){
        		$.ajax({
        			url:'user/reg',
        			data:{zhanghao:zhanghao,code:code,password:password},
        			type:'post',
        			success:function(data){
        		if(data=="0"){
        			alert("注册成功！")
        			window.location.href="${ctx}/pay/savereg";
        		}else if(data=="1"){
        			alert("验证码错误！")
        		}else if(data=="2"){
        			alert("注册失败！")
        		}else{
        			alert("账户已存在！")
        		}
        	}})
        	}else{
        		alert("两次输入的密码不一致！")
        	}
    	}else{
    		alert("请填写完整！")
    	}
    }
    
    var wait=60;
    var phoneReg=/^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
    function getcode(){
    	var zhanghao=$("input[name='zhanghao']").val();
    	if(phoneReg.test(zhanghao)){
    		$.ajax({url:'user/getcode',data:{zhanghao:zhanghao},type:'post',success:function(data){
        		if(data=="0"){
        			alert("短信已发送！")
        		}else{
        			alert("短信发送失败！")
        		}
        	}})
    	}else{
    		alert("手机格式不正确！")
    	}
    }
    function time(o) {
    	var zhanghao=$("input[name='zhanghao']").val();
    	if(phoneReg.test(zhanghao)){
    		if (wait == 0) {
                o.removeAttribute("disabled");
                o.value="获取验证码";
                wait = 60;
            } else {
                o.setAttribute("disabled", true);
                o.value=" "+wait+"S";
                wait--;
                setTimeout(function() {
                    time(o)
                },
                1000)
            }	
    	}
    }
    </script>

</body>
</html>