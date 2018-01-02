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
<title>我的资料</title>
<link rel="stylesheet" href="${ctxStatic}/reg-login/css/myziliao.css">
<script src="${ctxStatic}/reg-login/js/jquery.js"></script>
<script type="text/javascript" src="${ctxStatic}/reg-login/js/avalon.js"></script>
<script type="text/javascript">
			avalon.define({
	                $id: 'test',
	                show: 1,
	            })
	            
	        $(function(){
	        	$(".tijiao").click(function(){
					tijiao();	        		
	        	})
	        })
	        //修改资料提交
	        function tijiao(){
				var tLoginName=$("#tLoginName").val();
				var name=$("#name").val();
				var cardid=$("#cardid").val();
				var alipay=$("#alipay").val();
				var email=$("#email").val();
				var pidreg=/(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
				if(name==""){
					alert("姓名不能为空");
					$("#name").focus();
					return;
				}
				if(cardid==""){
					alert("身份证号不能为空");
					$("#cardid").focus();
					return;
				}else{
					if(!pidreg.test(cardid)){
						alert("身份账号不合法");
						return;
					}
				}
				if(alipay==""){
					alert("提现账号不能为空");
					$("#alipay").focus();
					return;
				}
				$.ajax({
					url:'${ctx}/pay/tocompleteziliao',
					type:'post',
					data:{tLoginname:tLoginName,tUserid:tLoginName,tName:name,reserve4:cardid,reserve5:alipay,tEmail:email},
					success:function(data){
						if(data=="1"){
							alert("修改成功");
							window.location.href="${ctx}/pay/tomycenter";
						}else{
							alert("修改失败");
						}
					}
					
				})
			}
			
			//修改密码提交
			function xiugai(){
				var ypassword=$("#ypassword").val();
				var xpassword=$("#xpassword").val();
				var qrpassword=$("#qrpassword").val();
				if(ypassword==""){
					alert("请输入原密码");
					$("#ypassword").focus();
					return ;
				}else{
					var ifright=$("#ifright").val();
					if(ifright=="0"){
						alert("请输入原密码");
						$("#ypassword").val("");
						$("#ypassword").focus();
						return ;
					}else{
						
					}
				}
				if(xpassword==qrpassword){
					$.ajax({
						url:'${ctx}/pay/updatepassword',
						type:'post',
						data:{password1:qrpassword},
						success:function(data){
							if(data=="1"){
								alert("修改密码成功");
								window.location.href="${ctx}/pay/tomycenter";
							}
						}
					})
				}else{
					alert("两次输入的密码不一致");					
				}
			
			}
	        
			
			function checkpassword(){
				var tLoginName=$("#password").val();
				var ypassword=$("#ypassword").val();
				$.ajax({
					url:'${ctx}/pay/checkpassword',
					type:'post',
					data:{tLoginname:tLoginName,reserve1:ypassword},
					success:function(data){
						if(data=="1"){
							$("#ifright").val("1");
						}else{
							alert("原密码不正确");
							$("#ypassword").val("");
							$("#ypassword").focus();
							$("#ifright").val("0");
						}
					}
				})
			}
	</script>
	<style type="text/css">
		.fontsize{
			font-size: 14px;
		}
	
	</style>
</head>
<body style="background-color: #f1f2f3;">
	<input type="hidden" id="ifright" value="0">
	<input type="hidden" id="tLoginName" value="${fns:getUser().loginName}">
	<input type="hidden" id="password" value="${fns:getUser().password}">
	<div class="m-info" ms-controller="test" >
		<div class="nav">
			<div ms-on-tap="@show = 1">
				<img src="${ctxStatic}/reg-login/images/mycenter/ziliao.png">
				<span>基础资料填写</span>
			</div>
			<div ms-on-tap="@show = 2">
				<img src="${ctxStatic}/reg-login/images/mycenter/mima.png">
				<span>修改密码</span>
			</div>
			
		</div>
		
		<div class="pop" :visible="@show === 1">
			<div class="input">
				<label for="yonghu">姓名</label>
				<input class="fontsize" id="name" type="text" placeholder="请输入姓名" value="${tUser.tName}">
			</div>
			<div class="input">
				<label for="yonghu">身份证</label>
				<input class="fontsize" id="cardid" type="text" placeholder="请输入身份证号" value="${tUser.reserve4}">
			</div>
			<div class="input">
				<label for="yonghu">提现账号</label>
				<input class="fontsize" id="alipay" type="text" placeholder="请输入支付宝账号" value="${tUser.reserve5}">
			</div>
			<div class="input">
				<label for="yonghu">邮箱</label>
				<input class="fontsize" id="email" type="text" placeholder="请输入邮箱" value="${tUser.tEmail}">
			</div>
			<div class="tishi">
				温馨提示
				<div class="text">您的信息将被加密处理，请放心填写</div>
			</div>
			<button class="submit tijiao" :visible="@show === 1">提交</button>
		</div>

		<div class="pop" :visible="@show === 2">
			<div class="input">
				<label for="yonghu">原密码</label>
				<input class="fontsize" id="ypassword" type="text" placeholder="请输入原密码" onchange="checkpassword()">
			</div>
			<div class="input">
				<label for="yonghu">新密码</label>
				<input class="fontsize" id="xpassword" type="text" placeholder="请输入新密码">
			</div>
			<div class="input">
				<label for="yonghu">再次输入</label>
				<input class="fontsize" id="qrpassword" type="text" placeholder="请再次输入新密码">
			</div>
		</div>
		<button class="submit" :visible="@show === 2" onclick="xiugai();">修改</button>
		
	</div>
</body>
</html>