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
<script src="https://cdn.jsdelivr.net/clipboard.js/1.5.12/clipboard.min.js"></script> 
<script src="${ctxStatic}/reg-login/js/jquery.js"></script>
<link rel="stylesheet" href="${ctxStatic}/reg-login/css/mycenter.css">
<title>我的中心</title>
</head>
<body style="background-color: #f1f3f8;">
	<div class="m-service">
		<div class="prompt">
			有关产品使用过程有任何问题，可按照以下方式联系我们。
		</div>
		<div class="lianxi">
			<button class="item" data-clipboard-action="copy" id="copy_btns">
				<div class="info">
					<img src="${ctxStatic}/reg-login/images/mycenter/wx.png">
				</div>
				<span>微信客服</span>
			</button>
			<a href="mqqwpa://im/chat?chat_type=wpa&uin=1810500030&version=1&src_type=web&web_src=www.chinesestack.com" target="_blank" class="item">
				<div class="info">
					<img src="${ctxStatic}/reg-login/images/mycenter/tx.png">
				</div>
				<span>QQ客服</span>
			</a>
			<a href="tel:027-52344488" class="item">
				<div class="info">
					<img src="${ctxStatic}/reg-login/images/mycenter/dh.png">
				</div>
				<span>客服热线</span>
			</a>
		</div>
		<div class="list">
			<button class="item" data-clipboard-action="copy" id="copy_btn">
				<div class="left">
					<img src="${ctxStatic}/reg-login/images/mycenter/wechat.png" style="width: 32px;height: 32px;">
				</div>
				<div class="right">
					<div class="title">微信公众号</div>
					<div class="text">点击进入微信公众号，进入微信粘贴添加</div>
				</div>
			</button>
			<a href="tel:15972006146" class="item">
				<div class="left">
					<img src="${ctxStatic}/reg-login/images/mycenter/tel.png" style="width: 32px;height: 32px;">
				</div>
				<div class="right">
					<div class="title">招商合作</div>
					<div class="text">点击进入微信公众号，进入微信粘贴添加</div>
				</div>
			</a>
		</div>
	</div>
</body>
<script language="javascript">
	 $(document).ready(function(){  
		 var clipboard = new Clipboard('#copy_btns', {
	    // 点击copy按钮，直接通过text直接返回复印的内容
	        text: function() {
	        	alert("成功复制微信号",1500); 
	            return '15972006146';
	        }
	    });     
	    var clipboards = new Clipboard('#copy_btn', {
	    // 点击copy按钮，直接通过text直接返回复印的内容
	        text: function() {
	        	alert("成功复制微信公众号",1500); 
	            return '米兔在线';
	        }
	    });           
    });  
</script>


</html>