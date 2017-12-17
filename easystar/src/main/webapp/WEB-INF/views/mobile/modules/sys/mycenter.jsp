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
<style>
    	.tuiguang{
		    font-size: 16px;
		    text-align: center;
		    padding: 10px;
		    padding-bottom: 10px;
    	}
    	.tuiguangnum{
    		font-size: 36px;
    		color: #DD4D3B;
    	}
    	.tuiguangnum:before{
    		content: '￥';
    	}
    	.shiyong{
    		padding: 10px 0;
    		text-align: center;
    	}
    	.shiyong p span{
    		font-size: 16px;
		    width: 33%;
    		display: inline-block;
    	}
    	.renyuanleft{
		    width: 60%;
    		float: left;
    	}
    	.renyuanleft p{
    		line-height: 38px;
    	}
    	.renyuanright{
		    width: 40%;
    		float: right;
    	}
    	.renyuanright p{
    		text-align: center;
    		font-size: 14px;
		    color: #ff6633;
    	}
    	.renyuanitem{
    		height: 38px;
		    padding: 8px 0;
    		border-bottom: 1px solid #ddd;
    	}
    	.xuanxiang a:first-child li{
    		border-top: 1px solid #ddd;
    	}
    	.left:after{
    		font-family: "iconfont" !important;
		    color: #333;
	        content: "\e507";
		    line-height: 38px;
		    float: right;
		    padding-right: 8px;
    	}
    	.down:after{
    		font-family: "iconfont" !important;
		    color: #333;
	        content: "\e501";
		    line-height: 38px;
		    float: right;
		    padding-right: 8px;
    	}
    	.touxiang{
    	}
    	.touxiang img{
    		width: 140px;
    		margin: 0 auto;
    		display: block;
    	}
    	.btn5{
            margin: 12px auto 0!important;
		    width: 80%;
		    height: auto;
    	}
    	.erweimatu img{
	    	display: block;
		    height: 0;
		    margin: auto;
	    }
	    .tixian{
	    	width: 50px;
	    	height: 30px;
	    	line-height:30px;
	    	border:1px red solid;
	    	border-radius:5px;
	    	display: block; 
	    }
    </style>
</head>
<body>
	<nav class="nav3 p">
		<strong>我的账号</strong>
	</nav>
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
	<section class="form-group" id="inputObj">
		<div>
			<ul class="xuanxiang">
				<a href="${ctx}/pay/toextend"><li class="renyuanitem left">
					<div>
						<div class="renyuanleft">
							<p>我的推广人</p>
						</div>
					</div>
				</li></a>
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
</body>
<script src="https://cdn.bootcss.com/jquery/1.11.0/jquery.js"></script>
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
	});
	
	function logout(){
		window.location.href="${pageContext.request.contextPath}/a/logout";		
	}
</script>
</html>