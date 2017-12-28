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
<title>我的提现详情</title>
<link rel="stylesheet" href="${ctxStatic}/reg-login/css/myziliao.css">
<script src="${ctxStatic}/reg-login/js/jquery.js"></script>
</head>
<body style="background-color: #f3f4f4">
		<div class="m-wrap">
			<!--提现金额-->
			<div class="msg-money">
				<h4>提现金额</h4>
				<h1>￥<span class="num">${tTixian.ttGetcashcount}</span></h1>
				<p style="font-size: 14px;">
					<span class="bank">支付宝账号</span>
					<span class="card-num">${tTixian.ttAlipay}</span>
				</p>
			</div>
			<!--申请进程-->
			<div class="process clear">
				<!--左侧进程线-->
				<ul class="process-line">
					<li class="done">
						<b></b>
						<span></span>
					</li>
					<li class="wait">
						<b></b>
						<span></span>
					</li>
					<li class="wait">
						<b></b>
					</li>
				</ul>
				<!--右侧内容-->
				<ul class="process-msg">
					<li class="done">
						<ul>
							<li>发起申请</li>
							<li class="time">12-26 12:02</li>
							<li>已发起提现申请</li>
						</ul>
					</li>
					<li class="wait">
						<ul>
							<li class="color">等待支付宝处理</li>
							<li class="color">晚间 21:00 到次日 6:00 及节假日期间，支付宝处理延迟，请耐心等待</li>
						</ul>
					</li>
					<li class="wait">
						<ul>
							<li class="color">预计 12 月217 12:02 日前到账</li>
							<li class="color">如果支付宝异常或信息填写错误，资金将退回您的账户余额，您可再次发起提现。</li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
	</body>
</html>