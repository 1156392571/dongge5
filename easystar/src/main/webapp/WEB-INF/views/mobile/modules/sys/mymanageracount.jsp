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
<script src="${ctxStatic}/reg-login/js/jquery.js"></script>
<title>我的赏金</title>
<style type="text/css">
.m-background{
 	background-color: #ff943d;
 	position: absolute;
 	height: 100%;
 	width: 100%;
}
.m-background .m-nav{
	display: flex;
	align-items: center;
	/*border-bottom: 1px solid #e6e6e6;*/
}
.m-background .m-nav .item{
	text-align: center;
	flex-grow: 1;
	padding: 5px 0;
	/*border-left: 1px solid #e6e6e6;*/
	position: relative;
}
.m-background .m-nav .on{
	color: white;
}
.m-background .m-nav .item:first-child{
	border: 0;
}
.m-background .m-nav .item .title{
	font-size: 14px
}
.m-background .color{
 	color: #ff372d;
}
.m-background .red{
 	color: #fc3f36;
}
.m-background .head{
 	padding: 0 10px;
}
.m-background .items{
 	display: flex;
 	align-items: center;
 	padding: 10px 0;
 	/*border-bottom: 1px solid #ddd;*/
 	font-size: 14px;

}
.m-background .items .text{
 	width: 30%;
 	text-align: center;
}
.m-background .head .item{
 	display: flex;
 	align-items: center;
 	padding: 10px 0;
 	/*border-bottom: 1px solid #ddd;*/
 	font-size: 12px;
 	color: white;
}
.m-background .head .item:last-child{
 	border-bottom: 0;

}
.m-background .head .item .text{
 	width: 30%;
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
<div class="m-background" >
		<div class="items">
				<div class="text">推荐人</div>
				<div class="text">理财金</div>
				<div class="text" style="width: 40%;">创建时间</div>
			</div>

		<div class="head" >
			<c:forEach items="${manageracountList}" var="list">
			<div class="item">
				<div class="text">${list.tma_dtlname}</div>
				<div class="text">${list.tma_jine}元</div>
				<div class="text" style="width: 40%;"><fmt:formatDate value="${list.createtime}" pattern="yyyy-MM-dd HH:mm:ss"/></div>
			</div>
			</c:forEach>
		</div>
	</div>




	<div class="m-money" ms-controller="test" >
		<div class="list">
			<c:forEach items="${manageracountList}" var="list">
			<div class="item">
				<div class="tiem">
					<fmt:formatDate value="${list.createtime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</div>
				<div class="info">
					<div class="left">
						恭喜您：${list.tma_dtlname}为你贡献了${list.tma_jine}的利益，请继续努力。
					</div>
					<div class="right" style="font-size: 16px;">
						<img src="${ctxStatic}/reg-login/images/mycenter/jb.png">
						<span>+${list.tma_jine}</span>
					</div>
				</div>
			</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>