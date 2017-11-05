<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>用户登录</title>
<meta name="decorator" content="cms_default_${site.theme}" />
<meta name="description" content="${category.description}" />
<meta name="keywords" content="${category.keywords}" />
<link rel="stylesheet" href="${ctxStatic}/reg-login/css/reset.css">
<link rel="stylesheet" href="${ctxStatic}/reg-login/css/supersized.css">
<link rel="stylesheet" href="${ctxStatic}/reg-login/css/style.css">
<script src="${ctxStatic}/reg-login/js/jquery-1.8.2.min.js"></script>
<script src="${ctxStatic}/reg-login/js/supersized.3.2.7.min.js"></script>
<script src="${ctxStatic}/reg-login/js/supersized-init.js"></script>
<script src="${ctxStatic}/reg-login/js/scripts.js"></script>
<style type="text/css">
.code {
	background: url('${ctxStatic}/reg-login/images/img/bg_code.jpg');
	font-family: Arial;
	font-style: italic;
	color: blue;
	font-size: 30px;
	border: 0;
	padding: 2px 3px;
	letter-spacing: 3px;
	font-weight: bolder;
	float: left;
	cursor: pointer;
	width: 150px;
	height: 40px;
	line-height: 40px;
	text-align: center;
	vertical-align: middle;
}
 ._reg{
 	cursor: pointer;
 }

</style>
<script type="text/javascript">
	var code;
	function createCode() {
		code = "";
		var codeLength = 4; //验证码的长度
		var checkCode = document.getElementById("checkCode");
		var codeChars = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 'a', 'b', 'c',
				'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o',
				'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', 'A',
				'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M',
				'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'); //所有候选组成验证码的字符，当然也可以用中文的
		for (var i = 0; i < codeLength; i++) {
			var charNum = Math.floor(Math.random() * 52);
			code += codeChars[charNum];
		}
		if (checkCode) {
			checkCode.className = "code";
			checkCode.innerHTML = code;
		}
	}
	function validateCode() {
		var inputCode = document.getElementById("inputCode").value;
		if (inputCode.length <= 0) {
			alert("请输入验证码！");
			$("#inputCode").val("");
			return false;
		} else if (inputCode.toUpperCase() != code.toUpperCase()) {
			alert("验证码输入有误！");
			$("#inputCode").val("");
			createCode();
			return false;
		} else {
			return true;
		}
	}
	
	//跳转到登录页面
	function toreg(){
		window.location.href="${ctx}/toreg";
	}
	//跳转到忘记密码页面
	function toforget(){
		window.location.href="${ctx}/toforget";
	}
</script>
</head>
<body onload="createCode()">
	<div class="page-container">
		<h1>Login</h1>
		<form id="inputForm" action="${pageContext.request.contextPath}/a/login" method="post" class="form-horizontal">
			<input type="text" id="username" class="username" name="username" placeholder="用户名">
			<input type="password" id="password" class="username" name="password" placeholder="密码">
			<input type="hidden" name="type" value="1">
			<div class="connect">
				<span style="float: left;border-radius:6px;" class="code" id="checkCode"
					onclick="createCode()"></span> 
				<span style="float: left"><input type="text" id="inputCode" class="username" placeholder="验证码"
					style="width: 114px; margin-top: 0px;border-radius:6px;" onchange="validateCode()"></span>
			</div>
			<input type="submit" class="tijiao" value="Sign me in" />
			<div class="error">
				<span>+</span>
			</div>
		</form>
		<div class="connect">
			<span class="_reg" style="float: left" onclick="toforget()">忘记密码</span> <span class="_reg" style="float: right" onclick="toreg()">注册</span>
		</div>
	</div>
</body>
</html>