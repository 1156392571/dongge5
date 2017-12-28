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
<link rel="stylesheet" href="${ctxStatic}/reg-login/css/myziliao.css">
<script src="${ctxStatic}/reg-login/js/avalon.js" type="text/javascript"></script>
<title>我的返现</title>
<script type="text/javascript">
			avalon.define({
	                $id: 'test',
	                show: 1,
	            })
	</script>
<style type="text/css">
.money{
width: 35px;height: 35px;
}
</style>
</head>
<body>

	<div class="m-money" ms-controller="test" >
		<div class="m-nav" >
			<div :class="['item',@show === 1?'on':'']" ms-on-tap="@show = 1">
				<div class="title">
					<strong>已获得赏金</strong> 
				</div>
				<div class="qian">
<!-- 					9.68元 -->
				</div>
				<div class="jianjian" :visible="@show === 1"></div>
			</div>
			<div :class="['item',@show === 2?'on':'']" class="item" ms-on-tap="@show = 2">
				<div class="title">
					<strong>赏金在路上</strong> 
				</div>
				<div class="qian">
<!-- 					9.68元 -->
				</div>
				<div class="jianjian" :visible="@show === 2"></div>
			</div>
			<div :class="['item',@show === 3?'on':'']" class="item" ms-on-tap="@show = 3">
				<div class="title">
					<strong>赏金流失了</strong> 
				</div>
				<div class="qian">
<!-- 					9.68元 -->
				</div>
				<div class="jianjian" :visible="@show === 3"></div>
			</div>
		</div>
		<div class="list" :visible="@show === 1">
			<c:forEach items="${listA}" var="lista">
			<div class="item">
				<div class="tiem">
					<fmt:formatDate value="${lista.createtime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</div>
				<div class="info">
					<div class="left">
						恭喜您：${lista.tma_dtlname}为你贡献了${lista.tma_jine}的利益，请继续努力。
					</div>
					<div class="right" style="font-size: 16px;">
						<img src="${ctxStatic}/reg-login/images/mycenter/jb.png">
						<span>+${lista.tma_jine}</span>
					</div>
				</div>
			</div>
			</c:forEach>
		</div>
		<div class="list" :visible="@show === 2">
			<c:forEach items="${listB}" var="listb">
			<div class="item">
				<div class="tiem">
					<fmt:formatDate value="${listb.createtime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</div>
				<div class="info">
					<div class="left">
						恭喜您：${listb.t_phone}做了${listb.tmt_name}的任务，即将为您贡献${listb.moneyway}的
						收益，请继续努力。
					</div>
					<div class="right" style="font-size: 16px;">
						<img src="${ctxStatic}/reg-login/images/mycenter/jb.png">
						<span>+${listb.moneyway}</span>
					</div>
				</div>
			</div>
			</c:forEach>
		</div>
		<div class="list" :visible="@show === 3">
			<c:forEach items="${listC}" var="listc">
			<div class="item">
				<div class="tiem">
					<fmt:formatDate value="${listc.createtime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</div>
				<div class="info">
					<div class="left">
						很遗憾：${listc.t_phone}做了${listc.tmt_name}的任务，审核失败，请继续努力。
					</div>
					<div class="right" style="font-size: 16px;">
<%-- 						<img src="${ctxStatic}/reg-login/images/mycenter/jb.png"> --%>
						<span>
<%-- 						+${listc.moneyway} --%>
						</span>
					</div>
				</div>
			</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>