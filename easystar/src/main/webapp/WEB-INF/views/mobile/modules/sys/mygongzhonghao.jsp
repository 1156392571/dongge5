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
<script src="${ctxStatic}/reg-login/js/avalon.js" type="text/javascript"></script>
<title>我的中心</title>
<script type="text/javascript">
			var vm = avalon.define({
	                $id: 'test',
	                show: true,
	            })
	</script>
	<style type="text/css">
		body{
			margin: 0;
			padding: 0;
		}
		.swiper-slide {
			position: absolute;
		    width: 100%;
		    height: 100%;
		    background-image: url(${ctxStatic}/reg-login/images/img/erweima4.png);
 			background-size: 100% 100%; 
		}
		.img{
			position: absolute;
			bottom: 22%;
			left: 50%;
			margin-left: -50px;
			width: 100px;
			height: 100px;
		}
		.hongbao{
			position: absolute;
			z-index: 999;
			width: 100%;
			height: 100%;
			background-color: rgba(0,0,0,.5);
		}
		.hongbao img{
			position: absolute;
			bottom: 20%;
			width: 80%;
			margin-left: 10%;
		}
	</style>
</head>
<body ms-controller="test">
	<div class="hongbao" :visible="@show" id="hongbao">
		<img src="${ctxStatic}/reg-login/images/img/hongbao.png" ms-on-tap="@show = false">
	</div>
    <div class="swiper-slide">
    	<img class="img" src="${ctxStatic}/reg-login/images/img/erweima.jpg">
    </div>	
</body>
<script type="text/javascript">
	setTimeout("timedCount()",3000)
	function timedCount(){
		vm.show = false;
	}
</script>
</html>