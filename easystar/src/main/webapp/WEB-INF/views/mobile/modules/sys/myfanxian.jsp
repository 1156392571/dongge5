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
<script src="${ctxStatic}/reg-login/js/jquery.js"></script>
<link rel="stylesheet" href="${ctxStatic}/reg-login/css/extendnews.css">
<script src="${ctxStatic}/reg-login/js/avalon.js" type="text/javascript"></script>
<title>我的返现</title>
<script type="text/javascript">
		let vm = avalon.define({
	            $id: 'test',
	            show: true,

	        })
</script>
<style type="text/css">
.money{
width: 40px;height: 40px;
}
</style>
</head>
<body>
	<div class="m-news" ms-controller="test">
		<div class="nav">
			<div :class="['item',@show?'color':'']" ms-on-tap="@show = true">赏金消息</div>
			<div :class="['item',!@show?'color':'']" ms-on-tap="@show = false">赏金在路上</div>
		</div>
		<div class="list" :visible="@show">
			<c:forEach items="${listA}" var="lista">
			<div class="item">
				<img class="money" src="${ctxStatic}/reg-login/images/mycenter/money3.png">
				<div class="info" style="width: 76%;">
					<div class="top">
						<div class="text">赏金返现</div>
						<div class="time"><fmt:formatDate value="${lista.createtime}" pattern="yyyy-MM-dd HH:mm:ss"/></div>
					</div>
					<div class="bottom">
						恭喜您：${lista.tma_dtlname}为你贡献了${lista.tma_jine}的利益，请继续努力。
					</div>
				</div>
			</div>
			</c:forEach>
			
			=================================
			<c:forEach items="${listB}" var="listb">
			<div class="item">
				<img class="money" src="${ctxStatic}/reg-login/images/mycenter/money3.png">
				<div class="info" style="width: 76%;">
					<div class="top">
						<div class="text">赏金返现</div>
						<div class="time"><fmt:formatDate value="${listb.createtime}" pattern="yyyy-MM-dd HH:mm:ss"/></div>
					</div>
					<div class="bottom">
						恭喜您：${listb.t_phone}做了${listb.tmt_name}的任务，即将为你贡献了${listb.moneyway}的利益，请继续努力。
					</div>
				</div>
			</div>
			</c:forEach>
			
		</div>
	</div>
</body>
</html>