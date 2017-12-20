<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
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
<title>任务中心</title>
<link rel="stylesheet" href="${ctxStatic}/reg-login/css/primary.css">
<link rel="stylesheet" href="${ctxStatic}/reg-login/footcss/style.css">
<script src="${ctxStatic}/reg-login/js/jquery.js"></script>
<script type="text/javascript" src="${ctxStatic}/reg-login/js/banner.js"></script>
</head>
<body>
	<div class="IndB" style="padding-bottom:2.25rem;">
		<div class="main_visual">
			<div class="flicking_con">
				<span></span>
				<span></span>
				<span></span>
				<span></span>
				<span></span>
			</div>
			<div class="main_image">
				<ul>
					<!--640*262-->
					<li><a href="#"><img src="${ctxStatic}/reg-login/images/img/BanInd03.png" /></a></li>
					<li><a href="#"><img src="${ctxStatic}/reg-login/images/img/BanInd02.png" /></a></li>
					<li><a href="#"><img src="${ctxStatic}/reg-login/images/img/BanInd01.png" /></a></li>
					<li><a href="#"><img src="${ctxStatic}/reg-login/images/img/BanInd04.png" /></a></li>
					<li><a href="#"><img src="${ctxStatic}/reg-login/images/img/BanInd05.jpg" /></a></li>
				</ul>
				<a href="javascript:;" id="btn_prev"></a>
				<a href="javascript:;" id="btn_next"></a>
			</div>
		</div>
	</div>

	<footer class="disBox">
<!-- 		<a href="#"><i class="f-icon01"></i>首页</a> -->
		<a href="${ctx}/pay/tomytask" class="cur"><i class="f-icon02"></i>任务</a>
		<a href="${ctx}/pay/toextend"><i class="f-icon03"></i>推广</a>
		<a href="${ctx}/pay/tomycenter"><i class="f-icon04"></i>我的</a>
	</footer>
</body>
</html>