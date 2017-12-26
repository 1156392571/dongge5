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
	background-color: #fff;
/* 	border: 1px solid #eee; */
	box-shadow: 0 2px 3px #eee;
}

.tHeader .in {
	position: relative;
	margin: 0 auto;
	padding: 10px;
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
	height: 55px;
	background-color: #2984d1;
	line-height: 55px;
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



.pricenum{
	font-size: 24px;
    font-weight: 700;
    line-height: 32px;
    color: #ff552e;
}
.pricedan{
    font-size: 12px;
    line-height: 20px;
    color: #ff552e;
}
.iconfont{
	font-size: 24px;
}
.cname {
    height:auto;
    margin-bottom:0;
   }
.chuanjiandate{
    color: #999;
    font-size: 12px;
    margin-left: 5px;
}
.datecreate{
	font-size: 13px;
	font-weight: 700;
}
.but-footbar {
    height: 55px;
    position: fixed;
    bottom: 0;
    right: 0;
    left: 0;
    z-index: 99;
    width: 100%;
    overflow: hidden;
}
.main-body{
	padding-bottom: 55px;
}
{
	height: 55px;
    line-height: 55px;
}
pre {white-space: pre-wrap;white-space: -moz-pre-wrap;white-space: -pre-wrap;white-space: -o-pre-wrap;word-wrap: break-word;}
</style>
</head>
<body>
<input type="hidden" id="id" value="${tMobileTask.id}">
<input type="hidden" id="truename" value="${tUser.tName}">
	<div class="tHeader tHjob">
			<div class="in">
				<div class="cn">
					<div>
						<span class="lname"><h1>${tMobileTask.tmtName}</h1>
							</span>
					</div>
					<p class="cname">
						<span class="pricenum">￥${tMobileTask.tmtPrice}</span>
						<span class="pricedan">元</span>
					</p>
					<p class="cname">
						<span class="chuanjiandate">创建时间：<fmt:formatDate value="${tMobileTask.createtime}" pattern="yyyy-MM-dd hh:mm:ss"/></span>
					</p>
				</div>
				<div class="clear"></div>
			</div>
		</div>

	<div class="main-body">
		<div class="channel_main">
			<div class="module_title">
				<h3>任务时间</h3>
			</div>
			<div class="channel_contact">
				<div>
					<p><span class="datecreate">开始日期：<fmt:formatDate value="${tMobileTask.tmtStartdate}" pattern="yyyy-MM-dd"/></span></p>
					<p><span class="datecreate">结束日期：<fmt:formatDate value="${tMobileTask.tmtEnddate}" pattern="yyyy-MM-dd"/></span></p>
				</div>
			</div>
		</div>
		<div class="channel_main">
			<div class="module_title">
				<h3>任务要求</h3>
			</div>
			<div class="channel_contact">
				<div class="innertext">
					<pre class="textsize">
					${tMobileTask.tmtAsk}
					</pre>
				</div>
			</div>
			<div align="center">
				<img src="${pageContext.request.contextPath}/${tMobileTask.tmtPhotourl}">
			</div>
		</div>
	</div>
	
	<div class="but-footbar">
		<p align="center"><a href="javascript:void(0)" class="tixian">任务交单</a></p>
	</div>

	<div class="cover-bg" aria-label="关闭弹层" style="display: none;"></div>
	<div class="mui-popup mui-popup-in paymethod" style="display: none;">
		<div class="mui-popup-inner">
			<div class="mui-popup-title" style="text-align: center;">任务交单</div>
			<div class="mui-popup-text" style="text-align: left;font-size: 14px;">
				<div class="form-text-login">
					<input type="text" id="tmaName" name="txzhifubao" class="form-text" placeholder="真实姓名" value="${tUser.tName}" style="padding: 0px;">
				</div>
			</div>
			<div class="mui-popup-text" style="text-align: left;font-size: 14px;">
				<div class="form-text-login">
					<input type="text" id="tmaCardid" name="pid" class="form-text" placeholder="身份证号" value="${tUser.reserve4}" style="padding: 0px;">
				</div>
			</div>
			<div class="mui-popup-text" style="text-align: left;font-size: 14px;">
				<div class="form-text-login">
					<input type="text" id="tmaPhone" name="txjine" class="form-text" placeholder="手机号码" value="${tUser.tPhone}" style="padding: 0px;">
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
		//首先判断当前账户是否已经申请过了
		var id=$("#id").val();
		$.ajax({
			url:'${ctx}/mt/tMobiletaskApply/checkifexist',
			type:'post',
			data:{tmaTaskid:id},
			success:function(data){
				if(data>0){
					//说明已经申请过了
					alert("已经申请过该任务");
				}else{
					$(".cover-bg").show();
					$(".paymethod").show();
				}
			}
		})
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
	var id=$("#id").val();
	var tmaName=$("#tmaName").val();
	var tmaCardid=$("#tmaCardid").val();
	var tmaPhone=$("#tmaPhone").val();
	var phonereg=/^(1[358][0-9]{9})$/;
	var pidreg=/(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
	if(tmaName==""){
		alert("真实姓名不能为空");
		$("#tmaName").val("");
		$("#tmaName").focus();
		return ;
	}
	if(tmaCardid==""){
		alert("身份证号不能为空");
		$("#tmaCardid").val("");
		$("#tmaCardid").focus();
		return ;
	}
	if(pidreg.test(tmaCardid)==false){
		alert("身份证号格式不正确");
		$("#tmaCardid").val("");
		$("#tmaCardid").focus();
		return ;
	}
	if(tmaPhone==""){
		alert("手机号码不能为空");
		$("#tmaPhone").val("");
		$("#tmaPhone").focus();
		return ;
	}
	if(phonereg.test(tmaPhone)==false){
		alert("手机号码格式不正确");
		$("#tmaPhone").val("");
		$("#tmaPhone").focus();
		return ;
	}
	var truename=$("#truename").val();
	var tetReserve1="";
	if(truename==""||truename==null){
		tetReserve1="1";
	}else{
		tetReserve1="2";
	}
	
	$.ajax({
		url:'${ctx}/pay/tohandApply',
		type:'post',
		data:{tmaTaskid:id,tmaName:tmaName,tmaCardid:tmaCardid,tmaPhone:tmaPhone,tetReserve1:tetReserve1,tmaStatus:'1'},
		success:function(data){
			if(data=="1"){
				alert("交单成功，请勿重复提交");
				tixiancancel();
			}else{
				alert("交单失败");
			}
		}
	})
}


</script>
</body>
</html>