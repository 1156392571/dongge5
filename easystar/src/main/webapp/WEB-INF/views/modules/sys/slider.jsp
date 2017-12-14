<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/head.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>首页</title>
<meta name="viewport" content="width=device-width,  initial-scale=1.0, user-scalable=no, minimum-scale=1.0,  maximum-scale=1.0"/>
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<!-- 轮播图片 -->
<link rel="stylesheet" href="${ctxStatic}/reg-login/css/pageSwitch.min.css" />
<script src="${ctxStatic}/reg-login/js/pageSwitch.min.js" type="text/javascript"></script>
<script>
	$(function() {
		$("#containerbanner").PageSwitch({
			direction:'horizontal',
			easing:'ease-in',
			duration:1000,
			loop:false,
			autoPlay:false,
			interval: 1000 // 自动播放间隔
		});
		
	});
	
	
</script>
<style type="text/css">
/* 图片轮播 */
#containerbanner {
	width: 100%;
	height: 350px;
	overflow: hidden;
}

#containerbanner, .sections {
	position: relative;
}


.sections, .section {
	height: 100%;
}

.section {
	background-color: #000;
	background-size: cover;
	background-position: 50% 50%;
	text-align: center;
	color: white;
}
</style>

</head>
<body>
	<div id="containerbanner" >
		<div class="sections">
			<div class="section">
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