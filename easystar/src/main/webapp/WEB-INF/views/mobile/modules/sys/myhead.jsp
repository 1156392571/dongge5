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
<style type="text/css">
   .content{
        height:30%;width:100%;
        background-color:rgb(79, 72, 210);
		margin-bottom: 0px;
    }
    .content > div{padding:0px;}
    .md1{
        width: 100%;
        height: 15%;
        text-align:right;
    }
    .eye{
        height: 90%;
        background-size:100% 100%;
    padding-right: 10px;
    padding-top: 5px;
    }
    .md2{
        text-align:center;
        color:white;
        height: 55%;
    }
    .md2 >p {
        margin:0px;
        margin-bottom:0px;

    }
    .md3{
        height: 30%;
        border-top: 1px solid #689cc5;
        width: 90%;
        margin:0 auto;
    }
    .md3 >div {
        display:inline-block;
        color:white;
        width:20%;
        height:100%;
        padding-left: 3.5%;
    }
    img{
        height: 35%;
        background-size:100% 100%;
        padding-right: 5px;
    }
    .pm{
    margin: 0px;
    text-align: center;
    font-size:14px;
    }
    
    /*tixian*/
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
<input type="hidden" id="eyevalue" value="1">
<input type="hidden" id="totalcount" value="${tUser.tAcount+tUser.reserve3*0.5+100+day*0.5}">
<input type="hidden" id="tixiancount" value="${tUser.tAcount+tUser.reserve3*0.5+0.5}">
<div class = "content">
<div class = "md1">
    <img class= "eye" src="${ctxStatic}/reg-login/images/mycenter/eye.png" alt="wutu" onclick="showeye()"/>
</div>
<div class = "md2">
        <p style = "font-size:14px">总资产</p>
        <p style = "font-size:30px" id="allmoney">${tUser.tAcount+tUser.reserve3*0.5+day*0.5+0.5}</p>
        <p style = "font-size:14px">今日最新收益 ${count}</p>
</div>
<div class = "md3">
    <div><img src="${ctxStatic}/reg-login/images/mycenter/1.png" alt="" /><span style= "font-size: 15px;
    line-height: 25px;">理财</span>
    <p class ="pm">￥100.00</p></div>
    <div><img src="${ctxStatic}/reg-login/images/mycenter/2.png" alt="" /><span style= "font-size: 15px;
    line-height: 25px">签到</span><p class ="pm">￥${tUser.reserve3*0.5}</p></div>
    <div><img src="${ctxStatic}/reg-login/images/mycenter/3.png" alt="" /><span style= "font-size: 15px;
    line-height: 25px">赏金</span><p class ="pm">￥${tUser.tAcount}</p></div>
    <div class="tixian"><img src="${ctxStatic}/reg-login/images/mycenter/3.png" alt="" /><span style= "font-size: 15px;
    line-height: 25px">提现</span><p class ="pm">￥${tUser.tAcount+tUser.reserve3*0.5+0.5}</p></div>
</div>

</div>

<div style="height: 30%;">
	<ul class="centerbox">
		<li class="li1">
			<div class="concer">
				<div class="col-3 t1">
					<img src="${ctxStatic}/reg-login/images/img/zhanghu.png" width=40%;height=40%>
					<p>提现</p>
				</div>
				<div class="col-3 t2">
					<img src="${ctxStatic}/reg-login/images/img/xiaoxi.png" width=40%;height=40%>
					<p>消息</p>
				</div>
				<div class="col-3 t3">
					<img src="${ctxStatic}/reg-login/images/img/huodong.png" width=40%;height=40%>
					<p>赏金</p>
				</div>

				<div class="col-3 t4">
					<img src="${ctxStatic}/reg-login/images/img/qiandao.png" width=40%;height=40%>
					<p>签到</p>
				</div>
				<div class="col-3 t5" >
					<img src="${ctxStatic}/reg-login/images/img/licai.png" width=40%;height=40%>
					<p>理财金</p>
				</div>
				<div class="col-3 t6">
					<img src="${ctxStatic}/reg-login/images/img/renwu.png" width=40%;height=40%>
					<p>任务</p>
				</div>
			</div>
		</li>
	</ul>
</div>
<div class="IndB" style="height: 30%;">
		<div class="main_visual">
			<div class="flicking_con">
				<span></span>
				<span></span>
				<span></span>
				<span></span>
<!-- 				<span></span> -->
			</div>
			<div class="main_image">
				<ul>
					<li><a href="${ctx}/pay/tosliderdtl?id=1"><img src="${ctxStatic}/reg-login/images/slider/mobilecicle1.png" /></a></li>
					<li><a href="${ctx}/pay/tosliderdtl?id=3"><img src="${ctxStatic}/reg-login/images/slider/mobilecicle2.png" /></a></li>
					<li><a href="${ctx}/pay/tosliderdtl?id=2"><img src="${ctxStatic}/reg-login/images/slider/mobilecicle3.png" /></a></li>
					<li><a href="${ctx}/pay/tosliderdtl?id=4"><img src="${ctxStatic}/reg-login/images/slider/mobilecicle5.png" /></a></li>
				</ul>
				<a href="javascript:;" id="btn_prev"></a>
				<a href="javascript:;" id="btn_next"></a>
			</div>
		</div>
</div>

	<footer class="disBox">
		<a href="${ctx}/pay/tomyhead" class="cur"><i class="f-icon01"></i>首页</a>
		<a href="${ctx}/pay/tomytask"><i class="f-icon02"></i>任务</a>
		<a href="${ctx}/pay/toextend"><i class="f-icon03"></i>推广</a>
		<a href="${ctx}/pay/tomycenter"><i class="f-icon04"></i>我的</a>
	</footer>
	<script type="text/javascript">
		$(function(){
			$(".t1").click(function(){
				window.location.href="${ctx}/pay/tomytixianList";
			})
			$(".t2").click(function(){
				window.location.href="${ctx}/pay/tomyxiaoxi";
			})
			$(".t3").click(function(){
				window.location.href="${ctx}/pay/tomyfanxian";
			})
			$(".t4").click(function(){
				$.ajax({
					url:'${ctx}/pay/register',
					type:'post',
					success:function(data){
						if(data=="1"){
							alert("签到成功！");
							window.location.href="${ctx}/pay/tomyhead";
						}else{
							alert("已经签过到了！");
						}
					}
				})
			})
			$(".t5").click(function(){
				alert("功能正在建设中，敬请期待");
			})
			$(".t6").click(function(){
				window.location.href="${ctx}/pay/tomytask";
			})
			$(".tixian").click(function(){
				var tixiancount=$("#tixiancount").val();
				if(tixiancount<100){
					alert("可提现金额小于100，暂不可提现，请继续努力");
				}else{
					window.location.href="${ctx}/pay/tomytixian";
				}
			})
			$(".cover-bg").click(function(){
				tixiancancel();
			});
			$(".txcancel").click(function(){
				tixiancancel();
			});
			$(".txcommit").click(function(){
				txcommit();
			});
		})
	
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
			async:false,
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
	
	//显示或者隐藏金额
	function showeye(){
		var eyevalue=$("#eyevalue").val();
		var totalcount=$("#totalcount").val();
		if(eyevalue=="1"){
			$("#allmoney").text(totalcount);
			$("#eyevalue").val("2");
		}else{
			$("#allmoney").text("****");
			$("#eyevalue").val("1");
		}
	}
	
	
	</script>
</body>
</html>