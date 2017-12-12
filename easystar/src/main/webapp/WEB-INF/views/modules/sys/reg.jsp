<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>注册米兔</title>
    <meta name="format-detection" content="telephone=no"/>
    <link href="${ctxStatic}/reg-login/css/mstyle.css" rel="stylesheet" type="text/css" />
    <meta name="viewport"
          content="width=device-width,  initial-scale=1.0, user-scalable=0, minimum-scale=1.0,  maximum-scale=1.0"/>
    <meta name="format-detection" content="telephone=no"/>
    <!-- for apple -->
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <meta name="apple-mobile-web-app-status-bar-style" content="black"/>
    <meta content="black" name="apple-mobile-web-app-status-bar-style"/>
    <script type="text/javascript">
    function doGetSmsCode1(){
    	var phone=$("#mobile").val();
    	alert(phone);
    	var data={};
    	data.phone=phone;
    	$.ajax({
    		url:'${ctx}/pay/getSmscode',
    		type:'post',
    		contentType : 'application/json;charset=utf-8',
    		data : JSON.stringify(data),
    		dateType : "json",
    		success:function(data){
    			alert(data);
    		}
    	})
    }
    
    </script>
</head>
<body>
<nav class="nav3 p">
<!--     <i class="btn2"><a href="javascript:history.go(-1)">返回</a></i> -->
    <strong>注册</strong>
    <i class="btn3"><a href="${ctx}/pay/tologin">登录</a></i>
</nav>
<section class="form-group" id="inputObj">
    <form id="touchForm" action="${ctx}/pay/savereg" method="post">
    	<input type="hidden" name="tInviter" value="${tUser.tInviter}">
        <p class="flastHint" id="infoHint"></p>
        <div class="form-text-login" id="userName_1">
            <label>用户名：</label>
            <input type="text" id="userName" name="tLoginname" class="form-text" placeholder="4-20个字符，汉字、字母、数字" value="">
            <a href="javascript:void(0);" class="form-text-clear" id="txtPhoneA"><i class="icon icon-clear" id="delA"></i></a>
        </div>
        <div class="form-text-login" id="pwd_1">
            <label>密&nbsp;&nbsp;码：</label>
            <input type="password" id="pwd" name="reserve1" class="form-text" placeholder="6-25个字符，数字、字母、符号" value="">
            <a href="javascript:void(0);" class="form-text-clear"><i class="r passbg" id="togglePassword"></i></a>
        </div>
        <div class="form-text-login" id="mobile_1">
            <label>手机号：</label>
            <input type="text" id="mobile" name="tPhone" class="form-text" placeholder="11位大陆手机号" value="">
            <a href="javascript:void(0);" class="form-text-clear" id="txtPhoneB"><i class="icon icon-clear" id="delB"></i></a>
        </div>
        <div class="form-text-login form-text-yzm" id="code_1">
            <label>验证码：</label>
            <input type="text" id="code" name="code" class="form-text" placeholder="" value="">
            <div class="l wi2">
                <input type="button" value="获取验证码" onclick="doGetSmsCode1()"/>
                <em id="isHideStyle" style="display:"></em>
                <em></em>
            </div>
        </div>
        <input type="hidden" name="referUrl" value="http%3A%2F%2Fm.xgo.com.cn%2F%3Ffrom%3Duc">
        <div class="btn5" style="margin-top:12px">
            <input type="submit" id="submitBtn" value="注&nbsp;&nbsp;册">
        </div>
    </form>
</section>
<div class="userTip">
    <div class="warmPrompt">
    <strong>温馨提示：</strong>
    <p>1、请确认您接收的短信是否被手机安全软件拦截 （如：360安全卫士、腾讯手机管家等）；</p>
    <p>2、若长时间仍未激活，请联系客服<em><a href="tel:400-080-0688">400-080-0688</a></em></p>
    </div>
</div>
<center><div style="font-size:10px">Copyright&copy;<a href="" target="_blank">
米兔平台</a> All Rights Reserved (2017-2020) 版权所有</center>
</body>
</html>