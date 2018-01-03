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
<title>我的二维码</title>
<link rel="stylesheet" href="${ctxStatic}/reg-login/css/myziliao.css">
<style type="text/css">
.img1{
	position: absolute;
	left: 50%;
    top: 50%;
}
</style>

<style type="text/css">

div{ position: relative; width: 100%; height: 100%; }
img{ display: block; }
.pos{ position: absolute; top: 69.5%; left: 49.7%; margin-left: -50px; margin-top: -50px; }
</style>
</head>
<body>
<div>
<img src="${ctxStatic}/reg-login/images/mycenter/erweimacode${id}.png" style="width: 100%;height: 100%;">
<img class="pos" src="${pageContext.request.contextPath}${url}">
<div>


</html>