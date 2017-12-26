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
<title>我的中心</title>
<link rel="stylesheet" href="${ctxStatic}/reg-login/css/mycenter.css">
<link rel="stylesheet" href="${ctxStatic}/reg-login/footcss/style.css">
<link rel="stylesheet" href="${ctxStatic}/reg-login/css/primary.css">
</head>
<body style="background-color: #f1f3f8;">
	<div class="m-my" style="padding-bottom: 2.95rem;">
		<div class="info">
			<div class="left" style="background-color: #8594e6">
				<img src="${ctxStatic}/reg-login/images/mycenter/touxiang.png" style="width:100%;height:100%;border-radius:50%;">
			</div>
			<div class="right">
				<p>用户名：${tUser.tLoginname}</p>
				<p>账&nbsp;&nbsp;&nbsp;号：${tUser.tPhone}</p>
			</div>
		</div>
		<div class="list">
			<a class="item">
				<div class="left">
					<img src="${ctxStatic}/reg-login/images/mycenter/one1.png">
					<span>推荐人</span>
				</div>
				<div class="right">
					<span>${phonenumber}</span>
					<i class="icon_you1"></i>
				</div>
			</a>
			<a class="item">
				<div class="left">
					<img src="${ctxStatic}/reg-login/images/mycenter/tuiguangicon.png">
					<span>推广码</span>
				</div>
				<div class="right">
					<i class="icon_you1"></i>
				</div>
			</a>
			<a class="item">
				<div class="left">
					<img src="${ctxStatic}/reg-login/images/mycenter/two1.png">
					<span>我的资料</span>
				</div>
				<div class="right">
					<i class="icon_you1"></i>
				</div>
			</a>
			<a href="${ctx}/pay/tolianxime" class="item">
				<div class="left">
					<img src="${ctxStatic}/reg-login/images/mycenter/four2.png">
					<span>联系我们</span>
				</div>
				<div class="right">
					<i class="icon_you1"></i>
				</div>
			</a>
			<a href="${ctx}/pay/toguanyume" class="item">
				<div class="left">
					<img src="${ctxStatic}/reg-login/images/mycenter/five2.png">
					<span>关于我们</span>
				</div>
				<div class="right">
					<i class="icon_you1"></i>
				</div>
			</a>
			<a class="item" href="${pageContext.request.contextPath}/a/logout">
				<div class="left">
					<img src="${ctxStatic}/reg-login/images/mycenter/six1.png">
					<span>退出</span>
				</div>
				<div class="right">
					<i class="icon_you1"></i>
				</div>
			</a>
		</div>
	</div>
	
	<footer class="disBox">
		<a href="${ctx}/pay/tomyhead"><i class="f-icon01"></i>首页</a>
		<a href="${ctx}/pay/tomytask"><i class="f-icon02"></i>任务</a>
		<a href="${ctx}/pay/toextend"><i class="f-icon03"></i>推广</a>
		<a href="${ctx}/pay/tomycenter" class="cur"><i class="f-icon04"></i>我的</a>
	</footer>
	
	
</body>
</html>