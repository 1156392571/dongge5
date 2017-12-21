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
<link rel="stylesheet" href="${ctxStatic}/reg-login/css/mstyle.css">
<link rel="stylesheet" href="${ctxStatic}/reg-login/footcss/style.css">
<title>任务详情</title>
<style type="text/css">
.tHeader {
	width: 100%;
	margin: 10px auto;
	margin-bottom: 30px;
	background-color: #fff;
/* 	border: 1px solid #eee; */
	box-shadow: 0 2px 3px #eee;
}

.tHeader .in {
	position: relative;
	margin: 0 auto;
	padding: 15px;
}

.tHeader h1 {
	display: inline-block;
	/*float: left;*/
	max-width: 340px;
	height: 30px;
	line-height: 30px;
	font-size: 22px;
	font-weight: bold;
	color: #333;
	margin: 0 10px 8px 0;
}

.tHeader .lheadright {
	float: right;
	font-size: 14px;
/* 	font-weight: 700; */
}

.cname {
	height: 20px;
	line-height: 20px;
/* 	width: 545px; */
	margin-bottom: 8px;
}

.tHjob .lname {
	max-width: 110px;
	height: 30px;
	line-height: 34px;
	margin-bottom: 8px;
}
	.channel_main {
	margin: 10px auto;
	font-size: 14px;
	line-height: 30px;
}

.channel_main .module_title {
	width: 100%;
	border-bottom: 1px solid #d9d9d9;
	line-height: 40px;
}

.channel_main .module_title h3 {
	margin-bottom: -1px;
	padding: 0 10px;
	font-size: 16px;
	border-bottom: 3px solid #e85220;
	display: inline-block;
	line-height: 40px;
}

.channel_contact {
	padding: 15px 10px;
	border-top: none;
	line-height: 25px;
}

.channel_intro {
	padding: 10px;
}

.channel_main .module_title a {
	margin-top: 5px;
	float: right;
	color: #06c;
	line-height: 30px;
}

.tixian {
	width: 100px;
	height: 40px;
	background-color: #2984d1;
	line-height: 40px;
	border-radius: 4px;
	display: block;
	color: #fff;
}
.mui-popup.mui-popup-in {
	display: block;
	-webkit-transition-duration: 400ms;
	transition-duration: 400ms;
	-webkit-transform: translate3d(-50%, -50%, 0) scale(1);
	transform: translate3d(-50%, -50%, 0) scale(1);
	opacity: 1;
}

.mui-popup {
	position: fixed;
	z-index: 10000;
	top: 50%;
	left: 50%;
	display: none;
	overflow: hidden;
	width: 270px;
	-webkit-transition-property: -webkit-transform, opacity;
	transition-property: transform, opacity;
	-webkit-transform: translate3d(-50%, -50%, 0) scale(1.185);
	transform: translate3d(-50%, -50%, 0) scale(1.185);
	text-align: center;
	opacity: 0;
	color: #000;
	border-radius: 13px;
}

.mui-popup-inner {
	position: relative;
	padding: 15px;
	border-radius: 13px 13px 0 0;
	background: rgba(255, 255, 255, .95);
}

.mui-popup-title {
	font-size: 18px;
	font-weight: 500;
	text-align: center;
}

.mui-popup-title+.mui-popup-text {
	font-family: inherit;
	font-size: 14px;
	margin: 5px 0 0;
}

.mui-popup-buttons {
	position: relative;
	display: -webkit-box;
	display: -webkit-flex;
	display: flex;
	height: 44px;
	-webkit-box-pack: center;
	-webkit-justify-content: center;
	justify-content: center;
	border-top: 1px solid #ccc;
}

.mui-popup-button:first-child {
	border-radius: 0 0 0 13px;
	border-right: 1px solid #ccc;
}

.mui-popup-button {
	font-size: 17px;
	line-height: 44px;
	position: relative;
	display: block;
	overflow: hidden;
	box-sizing: border-box;
	width: 100%;
	height: 44px;
	padding: 0 5px;
	cursor: pointer;
	text-align: center;
	white-space: nowrap;
	text-overflow: ellipsis;
	color: #007aff;
	background: rgba(255, 255, 255, .95);
	-webkit-box-flex: 1;
}

.cover-bg {
	position: absolute;
	left: 0;
	right: 0;
	bottom: 0;
	top: 0;
	background-color: rgba(0, 0, 0, 0.2);
}

.cover-bg {
	position: absolute;
	left: 0;
	right: 0;
	bottom: 0;
	top: 0;
	background-color: rgba(0, 0, 0, 0.2);
}

.form-text-login {
	padding: 0 4px 0 6px !important;
}

.home {
	font-size: 20px
}

.icon-gouwuche-copy {
	font-size: 18px;
}

.icon-yonghu {
	font-size: 22px
}
</style>
</head>
<body>
	<nav class="nav3 p">
		<strong>我的账号</strong><i class="btn3" style="float: left;"><a href="javascript:history.back(-1)">返回</a></i>
	</nav>
	<div class="tHeader tHjob">
			<div class="in">
				<div class="cn">
					<div>
						<span class="lname"><h1>${tMobileTask.tmtName}</h1>
							<span class="lheadright">任务价格：￥${tMobileTask.tmtPrice}</span></span>
					</div>
					<p class="cname">
						<a href="javascript:void(0)"><em
							class="icon_b i_link"></em></a>
					</p>
					<p class="cname">
						<i class="icon iconfont icon-chuangjianshijian"></i>
						开始时间:<fmt:formatDate value="${tMobileTask.tmtStartdate}" pattern="yyyy-MM-dd"/><br>
						结束时间:<fmt:formatDate value="${tMobileTask.tmtEnddate}" pattern="yyyy-MM-dd"/>
					</p>
				</div>
				<div class="clear"></div>
			</div>
		</div>

	<div class="main-body">
		<div class="channel_main">
			<div class="module_title">
				<h3>任务要求</h3>
			</div>
			<div class="channel_contact">
				<div class="innertext">
					<pre class="textsize">${tMobileTask.tmtAsk}</pre>
				</div>
			</div>
		</div>
	</div>
	
	<div>
		<p align="center"><a href="javascript:void(0)" class="tixian">任务交单</a></p>
	</div>

	<div class="cover-bg" aria-label="关闭弹层" style="display: none;"></div>
	<div class="mui-popup mui-popup-in paymethod" style="display: none;">
		<div class="mui-popup-inner">
			<div class="mui-popup-title" style="text-align: center;">任务交单</div>
			<div class="mui-popup-text" style="text-align: left;font-size: 14px;">
				<div class="form-text-login">
					<input type="text" id="txzhifubao" name="txzhifubao" class="form-text" placeholder="真实姓名" value="" style="padding: 0px;">
				</div>
			</div>
			<div class="mui-popup-text" style="text-align: left;font-size: 14px;">
				<div class="form-text-login">
					<input type="text" id="txjine" name="txjine" class="form-text" placeholder="手机号码" value="" style="padding: 0px;">
				</div>
			</div>
			
		</div>
		<div class="mui-popup-buttons poperbutton">
			<span class="mui-popup-button txcommit">确定</span>
			<span class="mui-popup-button txcancel">取消</span>
		</div>
	</div>

<script src="${ctxStatic}/reg-login/js/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$(".erweima").click(function(){
		if($(this).hasClass("left")){
			$(this).removeClass("left").addClass("down");
			$(".erweimatu img").animate({height: '100px'},"slow");
		}else{
			$(this).removeClass("down").addClass("left");
			$(".erweimatu img").animate({height: '0px'},"slow");
		}
	});
	$(".tixian").click(function(){
		$(".cover-bg").show();
		$(".paymethod").show();
	});
	$(".cover-bg").click(function(){
		tixiancancel();
	});
	$(".txcancel").click(function(){
		tixiancancel();
	});
	$(".txcommit").click(function(){
		txcommit();
	});
});
function tixiancancel(){
	$("input[name='txzhifubao']").val("");
	$("input[name='txjine']").val("");
	$(".cover-bg").hide();
	$(".paymethod").hide();
}

</script>
</body>
</html>