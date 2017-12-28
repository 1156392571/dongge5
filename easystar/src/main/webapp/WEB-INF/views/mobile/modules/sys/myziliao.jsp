<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-title" content="">
<meta name="format-detection" content="telephone=no">
<title>我的资料</title>
<link rel="stylesheet" href="${ctxStatic}/reg-login/css/myziliao.css">
<script type="text/javascript" src="${ctxStatic}/reg-login/js/avalon.js"></script>
<script type="text/javascript">
			avalon.define({
	                $id: 'test',
	                show: 1,
	            })
	</script>
</head>
<body style="background-color: #f1f2f3;">
	<div class="m-info" ms-controller="test" >
		<div class="nav">
			<div ms-on-tap="@show = 1">
				<img src="${ctxStatic}/reg-login/images/mycenter/ziliao.png">
				<span>基础资料填写</span>
			</div>
			<div ms-on-tap="@show = 2">
				<img src="${ctxStatic}/reg-login/images/mycenter/mima.png">
				<span>修改密码</span>
			</div>
			
		</div>
		<div class="pop" :visible="@show === 1">
			<div class="input">
				<label for="yonghu">用户</label>
				<input id="yonghu" type="text" placeholder="请输入姓名">
			</div>
			<div class="input">
				<label for="yonghu">身份证</label>
				<input id="yonghu" type="text" placeholder="请输入身份证号">
			</div>
			<div class="input">
				<label for="yonghu">提现账号</label>
				<input id="yonghu" type="text" placeholder="请输入支付宝账号">
			</div>
			<div class="input">
				<label for="yonghu">邮箱</label>
				<input id="yonghu" type="text" placeholder="请输入邮箱">
			</div>
			<div class="tishi">
				温馨提示
				<div class="text">1.您的信息将被加密处理，请放心填写</div>
			</div>
		</div>

		<div class="pop" :visible="@show === 2">
			<div class="input">
				<label for="yonghu">原密码</label>
				<input id="yonghu" type="text" placeholder="请输入原密码">
			</div>
			<div class="input">
				<label for="yonghu">新密码</label>
				<input id="yonghu" type="text" placeholder="请输入新密码">
			</div>
			<div class="input">
				<label for="yonghu">再次输入</label>
				<input id="yonghu" type="text" placeholder="请再次输入新密码">
			</div>
		</div>
		<button class="submit" :visible="@show === 1">提交</button>
		<button class="submit" :visible="@show === 2">修改</button>
	</div>
</body>
</html>