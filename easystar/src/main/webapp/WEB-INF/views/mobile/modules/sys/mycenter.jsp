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
<link rel="stylesheet" href="${ctxStatic}/reg-login/css/mstyle.css">
<link href="${ctxStatic}/reg-login/css/iconfont1.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="${ctxStatic}/reg-login/footcss/style.css">
<link rel="stylesheet" href="${ctxStatic}/reg-login/css/primary.css">
<style>
.tuiguang {
	font-size: 16px;
	text-align: center;
	padding: 10px;
	padding-bottom: 10px;
}

.tuiguangnum {
	font-size: 36px;
	color: #DD4D3B;
}

.tuiguangnum:before {
	content: '￥';
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
	width: 60%;
	float: left;
}

.renyuanleft p {
	line-height: 38px;
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

.xuanxiang a:first-child li {
	border-top: 1px solid #ddd;
}

.left:after {
	font-family: "iconfont" !important;
	color: #333;
	content: "\e507";
	line-height: 38px;
	float: right;
	padding-right: 8px;
}

.down:after {
	font-family: "iconfont" !important;
	color: #333;
	content: "\e501";
	line-height: 38px;
	float: right;
	padding-right: 8px;
}

.touxiang {
	
}

.touxiang img {
	width: 120px;
	height: 110px;
	margin: 0 auto;
	display: block;
}

.btn5 {
	margin: 12px auto 0 !important;
	width: 40%;
	height: auto;
}

.erweimatu img {
	display: block;
	height: 0;
	margin: auto;
}

.tixian {
	width: 50px;
	height: 30px;
	background-color: #2984d1;
	line-height: 30px;
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
	<input type="hidden" id="acountmoney" value="${tUser.tAcount}">
	<!-- 
	<nav class="nav3 p">
		<strong>我的账号</strong><i class="btn3"><a href="${pageContext.request.contextPath}/a/logout">退出</a></i>
	</nav>
	 -->
	<section class="form-group" id="inputObj">
		<div class="touxiang">
			<div><img src="${ctxStatic}/reg-login/images/unknow.png"></div>
			<!--<div class="denglu"><button>登录</button></div>-->
		</div>
		<div class="tuiguang">
			<p style="padding-bottom: 10px;"><font color="#6d5f5f">当前余额：</font><font color="red">￥${tUser.tAcount}</font></p>
<%-- 			<p class="tuiguangnum">${tUser.tAcount}</p> --%>
			<p align="center"><a href="javascript:void(0)" class="tixian">提现</a></p>
		</div>
	</section>
	
		<div class="cover-bg" aria-label="关闭弹层" style="display: none;"></div>
	<div class="mui-popup mui-popup-in paymethod" style="display: none;">
		<div class="mui-popup-inner">
			<div class="mui-popup-title" style="text-align: center;">提现金额</div>
			<div class="mui-popup-text" style="text-align: left;font-size: 14px;">
				<div class="form-text-login">
					<input type="text" id="txzhifubao" name="txzhifubao" class="form-text" placeholder="提现支付宝账号" value="" style="padding: 0px;">
				</div>
			</div>
			<div class="mui-popup-text" style="text-align: left;font-size: 14px;">
				<div class="form-text-login">
					<input type="text" id="txjine" name="txjine" class="form-text" placeholder="请输入提现金额" value="" style="padding: 0px;">
				</div>
			</div>
			<div class="mui-popup-text" style="text-align: left;"><laberl style="font-size: 12px;text-align: left;color: #bbb;">*当前可提现金额为${tUser.tAcount}元</laberl></div>
			
			
		</div>
		<div class="mui-popup-buttons poperbutton">
			<span class="mui-popup-button txcommit">确定</span>
			<span class="mui-popup-button txcancel">取消</span>
		</div>
	</div>
	
	<section class="form-group" id="inputObj">
		<div>
			<ul class="xuanxiang">
				<!-- 
				<a href="${ctx}/pay/toextend"><li class="renyuanitem left">
					<div>
						<div class="renyuanleft">
							<p>我的推广人</p>
						</div>
					</div>
				</li></a>
				 -->
				<a><li class="renyuanitem erweima left">
					<div>
						<div class="renyuanleft">
							<p>我的推广码</p>
						</div>
					</div>
				</li>
				</a>
				<li class="erweimatu">
					<div>
						<img src="${pageContext.request.contextPath}${url}" />
					</div>
				</li>
			</ul>
		</div>
	</section>
	<div class="btn5" style="margin-top: 12px">
		<input type="button" id="submitBtn" value="退&nbsp;&nbsp;出" onclick="logout()">
	</div>
	
	<footer class="disBox">
		<a href="${ctx}/pay/tomyhead"><i class="f-icon01"></i>首页</a>
		<a href="${ctx}/pay/tomytask"><i class="f-icon02"></i>任务</a>
		<a href="${ctx}/pay/toextend"><i class="f-icon03"></i>推广</a>
		<a href="${ctx}/pay/tomycenter" class="cur"><i class="f-icon04"></i>我的</a>
	</footer>
	
</body>
<script src="${ctxStatic}/reg-login/js/jquery.js"></script>
<script>
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
	
	function txcommit(){
		var txzhifubao=$("#txzhifubao").val();
		var txjine=$("#txjine").val();
		if(txzhifubao==""){
			alert("提现的支付宝账号不能为空");
			$("#txzhifubao").focus();
			return;
		}
		if(txjine==""){
			alert("提现金额不能为空");
			$("#txjine").focus();
			return ;
		}else{
			var reg=new RegExp("^[0-9]*$");
			if(reg.test(txjine)){
				var acountmoney=$("#acountmoney").val(); 
				if(txjine>acountmoney){
					alert("超出实际金额");
					$("#txjine").val("");
					$("#txjine").focus();
					return ;
				}
			}else{
				alert("金额必须是数字");
				$("#txjine").val("");
				$("#txjine").focus();
				return ;
			}
		}
		var data = {};
		data.ttGetcashcount=txjine;
		data.ttAlipay=txzhifubao;
		$.ajax({
			url:'${pageContext.request.contextPath}/a/mt/tTixian/tixiansubmit',
			type:'post',
			contentType : 'application/json;charset=utf-8',
			data : JSON.stringify(data),
			dateType : "json",
			success:function(data){
				alert(data.msg);
				if(data.code=="1"){
					window.location.reload();
				}
			}
		})
	}
	
	function logout(){
		window.location.href="${pageContext.request.contextPath}/a/logout";		
	}
</script>

</html>