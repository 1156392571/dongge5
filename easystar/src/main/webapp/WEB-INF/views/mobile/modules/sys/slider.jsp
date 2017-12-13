<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
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
<title>米兔登陆</title>
<meta name="keywords" content="">
<meta name="description" content="">
<!-- 轮播图片 -->
<link rel="stylesheet" href="${ctxStatic}/reg-login/css/pageSwitch.min.css" />
<script src="${ctxStatic}/reg-login/js/pageSwitch.min.js" type="text/javascript"></script>
<script src="${ctxStatic}/reg-login/js/jquery-1.8.2.min.js" ></script>

<script>
	$(function() {
		$("#containerbanner").PageSwitch({
			direction:'horizontal',
			easing:'ease-in',
			duration:1000,
			autoPlay:true,
			interval: 7000 // 自动播放间隔
		});
		
		$("#pageBanner").PageSwitch({
			direction:'horizontal',
			easing:'ease-in',
			duration:1000,
			autoPlay:true,
			interval: 3000 // 自动播放间隔
		});
		
	});
	
	
</script>

</head>
<body>
	<div id="containerbanner" style="width: 100%;height: 500px;">
		<div class="sections" style="width: 100%;height: 100%;">
			<div class="section" style="width: 100%;height: 100%;">
				<img src="${ctxStatic}/reg-login/images/slider/1-1.jpg" alt="" style="height: 100%;width: 100%">
			</div>
			<div class="section">
				<img src="${ctxStatic}/reg-login/images/slider/2-1.jpg" alt="" style="height: 100%;width: 100%">
			</div>
			<div class="section">
				<img src="${ctxStatic}/reg-login/images/slider/3-1.jpg" alt="" style="height: 100%;width: 100%">
			</div>	
		</div>
	</div>

</body>
</html>