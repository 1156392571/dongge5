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
<title>我的提现</title>
<link rel="stylesheet" href="${ctxStatic}/reg-login/css/myziliao.css">
<script src="${ctxStatic}/reg-login/js/jquery.js"></script>
</head>
<body style="background-color: #f3f4f4">
<input type="hidden" id="tixiancount" value="${tUser.tAcount+tUser.reserve3*0.5}">
		<div class="m-tixian">
			<div class="box">
				<div class="yonghu" style="color: #333; ">
					用户名： <span>${tUser.tLoginname}</span>	
				</div>
				<div class="kahao" style="padding-top: 15px;">
					<div class="text" style="font-size: 16px;">支付宝账号</div>
					<div class="xinxi">
						<input type="text" id="txzhifubao" placeholder="输入支付宝账号" style="font-size: 16px;">
						<span>支付宝</span>
					</div>
					<div class="ts" style="font-size: 14px;">请核对账号信息</div>
				</div>
			</div>
			<div class="box">
				<div class="jine" style="padding-top: 15px;">
					<div class="text" style="font-size: 16px;">提现金额</div>
					<div class="input">
						￥
						<input type="text" id="txjine" placeholder="请输入提现金额" style="font-size: 16px;">
					</div>
				</div>
				<div class="ketixian" style="font-size: 14px;">
					<span>本次可提现${tUser.tAcount+tUser.reserve3*0.5}元</span>
					<button style="font-size: 14px;" onclick="alltixian()">全部提现</button>
				</div>
				
			</div>
			<div class="zhushi" style="font-size: 12px;">
				<span>每笔交易手续费2.00元，金额满100.00元才可提现</span>
				<p>提现时间: 09: 00-20: 00，周末不结算，请在工作日内结算</p>
			</div>
			<button class="btn-tixian" style="background-color: #008bd7;width: 70%;height: 40px;font-size: 16px;margin-left: 15%;margin-top: 15px;">确认提现，24小时内到账</button>
		</div>
		
		<script type="text/javascript">
			$(function(){
				$(".btn-tixian").click(function(){
						tixian();				
				})
				
			})
			
			//全部提现
			function alltixian(){
				var acountmoney=Math.round($("#tixiancount").val());
				$("#txjine").val(acountmoney);
			}
			
			
			function tixian(){
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
						var acountmoney=$("#tixiancount").val(); 
						if(txjine>acountmoney){
							alert("超出实际金额");
							$("#txjine").val("");
							$("#txjine").focus();
							return ;
						}
					}else{
						alert("提现金额必须是整数");
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
		</script>
		
	</body>
</html>