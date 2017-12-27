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
<title>我的二维码</title>
<link rel="stylesheet" href="${ctxStatic}/reg-login/css/myziliao.css">
</head>
<body style="background-color: #f3f4f4">
		<div class="m-tuiguang">
			<a class="item" href="fenxiang.html">
				<div class="left">
					<img src="${ctxStatic}/reg-login/images/mycenter/ewm.png">
				</div>
				<div class="right">
					<div class="title">二维码推广</div>
					<div class="text">拒绝审美疲劳，每一次分享都是新的视觉体验！</div>
				</div>
			</a>
			<a class="item" href="">
				<div class="left">
					<img src="${ctxStatic}/reg-login/images/mycenter/tw.png">
				</div>
				<div class="right">
					<div class="title">图文推广</div>
					<div class="text">朋友圈营销推广文案库，</div>
					<div class="text">一键复制转发简单高效！</div>
				</div>
			</a>
			<a class="item" href="${ctx}/pay/tomyerweimaList?type=1">
				<div class="left">
					<img src="${ctxStatic}/reg-login/images/mycenter/dq.png">
				</div>
				<div class="right">
					<div class="title">注册页推广</div>
					<div class="text">全新H5宣传单页，让你的分享链接调性十足！</div>
				</div>
			</a>
		</div>
</html>