<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
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
<style>
.m-background{
 
}
.m-background .color{
 	color: #4abfef;
}
.m-background .head{
 	padding: 0 10px;
}
.m-background .head .item{
 	display: flex;
 	align-items: center;
 	padding: 10px 0;
 	border-bottom: 1px solid #ddd;
 	font-size: 14px;
 	color: #333;
}
.m-background .head .item:last-child{
 	border-bottom: 0;

}
.m-background .head .item .text{
 	width: 50%;
 	text-align: center;
}
body{
	margin: 0;
	padding: 0;
}
img{
	margin: 0;
	padding: 0;
}
a{
	display: block;
	text-decoration: none;
}
input{
	outline:none;
}
    </style>
</head>
<body>
	<div class="m-background">
		<div class="head">
			<div class="item">
				<div class="text color">好友</div>
				<div class="text color">创建时间</div>
			</div>
			<c:forEach items="${extendList}" var="list">
			<div class="item">
				<div class="text">
				${fn:substring(list.tPhone, 0, 3)}****${fn:substring(list.tPhone, 7, 11)}
				</div>
				<div class="text"><fmt:formatDate value="${list.createtime}" pattern="yyyy-MM-dd HH:mm:ss"/></div>
			</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>