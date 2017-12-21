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
<title>首页</title>
<link rel="stylesheet" href="${ctxStatic}/reg-login/css/mstyle.css">
<link rel="stylesheet" href="${ctxStatic}/reg-login/css/primary.css">
<link rel="stylesheet" href="${ctxStatic}/reg-login/footcss/style.css">
<link rel="stylesheet" href="${ctxStatic}/reg-login/footcss/tasklist.css">
<script src="${ctxStatic}/reg-login/js/jquery.js"></script>
<script type="text/javascript" src="${ctxStatic}/reg-login/js/banner.js"></script>
<style type="text/css">
.nav {
	background: rgba(245, 245, 245, 0.8);
	padding: 0px 0 2px 0;
	width: 100%;
	position: fixed;
	left: 0;
	bottom: 0;
	z-index: 999
}

.nav .navbox {
	height: 0px;
}

.nav .navbox li {
	float: left;
	width: 33.3%;
	text-align: center;
	list-style-type: none;
	margin: 0px;
	padding: 0px;
}

.nav .navbox li span {
	display: block;
	font-size: 14px;
	font-family: "微软雅黑";
	line-height: 25px;
}

a {
	color: #000;
	text-decoration: none;
	width: 33.3%;
}

* {
	padding: 0;
	margin: 0;
	list-style: none;
	font-weight: normal;
}

.centerbox li {
	width: 100%;
	display: none;
}

.centerbox .li1 {
	display: block;
}

.licolor {
	background:;
	color: rgb(41, 132, 209)
}

.lib {
	color: #666
}

.icon-renwu_tubiao_yikaocha_moren:before {
	content: "\e640";
	font-size: 26px;
}

.icon-tuiguang:before {
	content: "\e79f";
	font-size: 26px;
}

.icon-yonghu1:before {
	content: "\e642";
	font-size: 26px;
}

.li1 {
	width: 100%;
	box-sizing: border-box;
}

.swiper-container {
	width: 100%;
	height: 60%;
}

.swiper-slide {
	text-align: center;
	font-size: 18px;
	background: #fff; /* Center slide text vertically */
	display: -webkit-box;
	display: -ms-flexbox;
	display: -webkit-flex;
	display: flex;
	-webkit-box-pack: center;
	-ms-flex-pack: center;
	-webkit-justify-content: center;
	justify-content: center;
	-webkit-box-align: center;
	-ms-flex-align: center;
	-webkit-align-items: center;
	align-items: center;
}

.swiper-slide img {
	height: 120px
}
/*顶部*/
.topbox {
	width: 100%;
	height: 100%;
	border-radius: 8px;
	text-align: center;
	background: -webkit-gradient(linear, 0 0, 0 bottom, from(rgba(254, 212, 50, 0.6)),
		to(rgba(251, 53, 51, 0.5)));
}

.topbox .yanjing {
	text-align: right;
	margin: 0% 6% 0% 0%;
}

.yanjing img {
	margin-top: 3%
}

.add-up {
	font-size: 12px;
	margin: 1% 0;
	color: #333
}

.topbox .jiaoyi {
	width: 19%;
	border: 1px solid #333;
	background: none;
	border-radius: 10px;
	margin-top: 0% 6% 0% 0%;
	color: #333
}

.topbox-bottom {
	width: 100%;
	border-top: 0.5px solid #ccc;
	margin-top: 0.5%;
}
/*中间内容*/
.concer {
	width: 100%;
	margin: 2% 0;
}

.concer p {
	text-align: center;
	margin: 1.5% 0;
}

.col-3 {
	width: 33.3%;
	float: left;
	text-align: center;
	margin: 1.5% 0;
}

.col-3 p {
	font-size: 13px
}
</style>

</head>
<body>
<div class="IndB" style="padding-bottom:1.25rem;">
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
	<ul class="centerbox">
		<li class="li1">
			<div class="concer">
				<p>精彩应用</p>
				<div class="col-3 t1">
					<img src="${ctxStatic}/reg-login/images/img/图标6.png" width=50%;height=50%>
					<p>账户</p>
				</div>
				<div class="col-3 t2">
					<img src="${ctxStatic}/reg-login/images/img/图标5.png" width=50%;height=50%>
					<p>消息</p>
				</div>
				<div class="col-3 t3">
					<img src="${ctxStatic}/reg-login/images/img/图标4.png" width=50%;height=50%>
					<p>活动</p>
				</div>

				<div class="col-3 t4">
					<img src="${ctxStatic}/reg-login/images/img/图标4 1.png" width=50%;height=50%>
					<p>签到</p>
				</div>
				<div class="col-3 t5">
					<img src="${ctxStatic}/reg-login/images/img/图标4 3.png" width=50%;height=50%>
					<p>理财金</p>
				</div>
				<div class="col-3 t6">
					<img src="${ctxStatic}/reg-login/images/img/图标4 4.png" width=50%;height=50%>
					<p>任务</p>
				</div>
			</div>
		</li>
	</ul>


	<footer class="disBox">
		<a href="${ctx}/pay/tomyhead" class="cur"><i class="f-icon01"></i>首页</a>
		<a href="${ctx}/pay/tomytask"><i class="f-icon02"></i>任务</a>
		<a href="${ctx}/pay/toextend"><i class="f-icon03"></i>推广</a>
		<a href="${ctx}/pay/tomycenter"><i class="f-icon04"></i>我的</a>
	</footer>
	<script type="text/javascript">
		$(function(){
			$(".t1").click(function(){
				window.location.href="${ctx}/pay/tomycenter";
			})
			$(".t2").click(function(){
				alert("功能正在建设中，敬请期待");
			})
			$(".t3").click(function(){
				alert("功能正在建设中，敬请期待");
			})
			$(".t4").click(function(){
				alert("功能正在建设中，敬请期待");
			})
			$(".t5").click(function(){
				alert("功能正在建设中，敬请期待");
			})
			$(".t6").click(function(){
				window.location.href="${ctx}/pay/tomytask";
			})
			
		})
	
	</script>
</body>
</html>