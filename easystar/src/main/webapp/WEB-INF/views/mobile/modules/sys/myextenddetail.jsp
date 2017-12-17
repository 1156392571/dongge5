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
<link rel="stylesheet"
	href="${ctxStatic}/reg-login/css/mstyle.css">

<style>
    	.tuiguang{
		    font-size: 16px;
		    text-align: center;
		    padding: 10px;
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
		    width: 100%;
    		float: left;
    	}
    	.renyuanleft span{
    		display: inline-block;
		    line-height: 34px;
    		font-size: 10px;
    	}
    	.leftlabel{
		    float: left;
    		width: 40%;
    		text-align: left;
    	}
    	.centerlabel{
    		width:20%;
		    float: left;
    		text-align: center;
    	}
    	.rightlabel{
    		width: 40%;
		    float: left;
    		text-align: right;
    	}
    	.infoheard{
    		border-bottom: 1px solid #cccc;
    	}
    	.btn5 {
			margin: 12px auto 0 !important;
			width: 50%;
			height: auto;
		}
    </style>
</head>
<body>
	<nav class="nav3 p">
		<strong>我的账号</strong>
	</nav>
	<section class="form-group" id="inputObj">
		<div class="tuiguang">
			<p>我的邀请记录</p>
		</div>
	</section>
	<section class="form-group" id="inputObj">
		<div>
			<ul class="xuanxiang">
				<li class="renyuanitem">
					<div class="renyuanleft infoheard">
						<span class="leftlabel">好友</span>
						<span class="centerlabel">审核状态</span>
						<span class="rightlabel">奖励金</span>
					</div>
				</li>
				<c:if test="${not empty extendList}">
				<c:forEach items="${extendList}" var="list">
				<li class="renyuanitem">
					<div class="renyuanleft">
						<span class="leftlabel">
						${fn:substring(list.tPhone, 0, 3)}****${fn:substring(list.tPhone, 7, 11)}
						</span>
						<span class="centerlabel">${list.reserve2}</span>
						<span class="rightlabel">￥${list.tAcount}</span>
					</div>
				</li>
				</c:forEach>
				</c:if>
				
				<c:if test="${empty extendList}">
				<li class="renyuanitem">
					<div class="renyuanleft" style="text-align: center;">
						暂无记录
					</div>
				</li>
				</c:if>
			</ul>
		</div>
	</section>
	
	<div class="btn5" style="margin-top: 20px">
		<input type="button" id="submitBtn" value="返&nbsp;&nbsp;回" onclick="history.go(-1)">
	</div>
</body>
</html>