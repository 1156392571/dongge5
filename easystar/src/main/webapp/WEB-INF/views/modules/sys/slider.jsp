<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/head.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" >
<title>米兔登陆</title>
<!-- 轮播图片 -->
<link rel="stylesheet" href="${ctxStatic}/reg-login/css/pageSwitch.min.css" />
<script src="${ctxStatic}/reg-login/js/pageSwitch.min.js" type="text/javascript"></script>
<%-- <script src="${ctxStatic}/jquery/jquery-1.9.1.js" ></script> --%>
<script src="${ctxStatic}/reg-login/js/jquery.js" ></script>
<script>
	$(function() {
		$("#containerbanner").PageSwitch({
			direction:'horizontal',
			easing:'ease-in',
			duration:1000,
			autoPlay:true,
			interval: 7000 // 自动播放间隔
		});
	});
	
	
</script>

</head>
<body>
	<div id="containerbanner">
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