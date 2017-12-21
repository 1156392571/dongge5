<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/head.jsp"%>
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
<title>我的推广</title>
<link rel="stylesheet" href="${ctxStatic}/reg-login/css/mstyle.css">
<link rel="stylesheet" href="${ctxStatic}/reg-login/footcss/style.css">
<link rel="stylesheet" href="${ctxStatic}/reg-login/css/primary.css">
<link href="${ctxStatic}/reg-login/css/iconfont1.css" rel="stylesheet" type="text/css" />

<style>
.tuiguang {
	font-size: 16px;
	text-align: center;
	padding: 10px;
}

.tuiguangnum {
	font-size: 36px;
}

.shiyong {
	padding: 10px 0;
	text-align: center;
}

.shiyong p span {
	font-size: 16px;
	width: 33%;
	display: inline-block;
}

.renyuanleft {
	width: 95%;
	float: left;
}

.renyuanleft p {
	line-height: 38px;
	float: left;
}

.renyuanright {
	width: 40%;
	float: right;
}

.renyuanright p {
	text-align: center;
	font-size: 14px;
	color: #ff6633;
}

.renyuanitem {
	height: 38px;
	padding: 8px 0;
	border-bottom: 1px solid #ddd;
}


.touxiang img {
	width: 140px;
	margin: 0 auto;
	display: block;
}

.btn5 {
	margin: 12px auto 0 !important;
	width: 50%;
	height: auto;
}
.left:after {
	font-family: "iconfont" !important;
	color: #333;
	content: "\e507";
	line-height: 38px;
	float: right;
	padding-right: 8px;
}
</style>
<script type="text/javascript">
	function todetail(type){
		window.location.href="${ctx}/pay/toextenddetail?type="+type;
	}

</script>
</head>
<body>
	<!-- 
	<nav class="nav3 p">
		<strong>我的推广</strong>
	</nav>
	 -->
	<section class="form-group" id="inputObj" style="background-image: url('${ctxStatic}/reg-login/images/img/backgrounds/tuiguangback.png');background-size: auto auto">
		<div class="tuiguang">
			<p>累计推广(人)</p>
			<p class="tuiguangnum">${extendAll}</p>
		</div>
		<div class="shiyong">
			<p><span>直接</span><span>间接</span><span>实名</span></p>
			<p><span>${extendA}</span><span>${extendB}</span><span>${extendC}</span></p>
		</div>
	</section>
	<section class="form-group" id="inputObj">
		<div>
			<ul>
				<li class="renyuanitem" onclick="todetail('A')">
					<div>
						<div class="renyuanleft left">
							<p><span><img style="width: 40px;height: 40px;" src="${ctxStatic}/reg-login/images/img/backgrounds/dog.png"></span>
							<span>推广员A</span></p>
						</div>
<!-- 						<div class="renyuanright"> -->
<!-- 							<p>直接 6 人</p> -->
<!-- 							<p>间接 6 人</p> -->
<!-- 						</div> -->
					</div>
				</li>
				<li class="renyuanitem" onclick="todetail('B')">
					<div>
						<div class="renyuanleft left">
							<p><span><img style="width: 40px;height: 40px;" src="${ctxStatic}/reg-login/images/img/backgrounds/monkey.png"></span>
							<span>推广员B</span></p>
						</div>
					</div>
				</li>
				<li class="renyuanitem" onclick="todetail('C')">
					<div>
						<div class="renyuanleft left">
							<p><span><img style="width: 40px;height: 40px;" src="${ctxStatic}/reg-login/images/img/backgrounds/mouse.png"></span>
							<span>推广员C</span></p>
						</div>
					</div>
				</li>
			</ul>
		</div>
	</section>
	<!-- 
	<div class="btn5" style="margin-top: 12px">
		<input type="button" id="submitBtn" value="返&nbsp;&nbsp;回" onclick="history.go(-1)">
	</div>
 	-->
 	
	<footer class="disBox">
		<a href="${ctx}/pay/tomyhead"><i class="f-icon01"></i>首页</a>
		<a href="${ctx}/pay/tomytask"><i class="f-icon02"></i>任务</a>
		<a href="${ctx}/pay/toextend"  class="cur"><i class="f-icon03"></i>推广</a>
		<a href="${ctx}/pay/tomycenter"><i class="f-icon04"></i>我的</a>
	</footer>

</body>
</html>