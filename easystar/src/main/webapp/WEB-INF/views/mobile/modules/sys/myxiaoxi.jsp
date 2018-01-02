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
<link rel="stylesheet" href="${ctxStatic}/reg-login/css/extendnews.css">
<script src="${ctxStatic}/reg-login/js/avalon.js" type="text/javascript"></script>
<title>我的消息</title>
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
			<div :class="['item',!@show?'color':'']" ms-on-tap="@show = false">系统消息</div>
		</div>
		<div class="list" :visible="@show">
			<c:forEach items="${xiaoxilist}" var="list">
			<c:choose>
			<c:when test="${list.tma_reserve1=='2'}">
			<div class="item">
				<img class="money" src="${ctxStatic}/reg-login/images/mycenter/money3.png">
				<div class="info" style="width: 76%;">
					<div class="top">
						<div class="text">赏金返现</div>
						<div class="time"><fmt:formatDate value="${list.createtime}" pattern="yyyy-MM-dd HH:mm:ss"/></div>
					</div>
					<div class="bottom">
						恭喜您：${list.tma_dtlname}为你贡献了${list.tma_jine}的利益，请继续努力。
					</div>
				</div>
			</div>
			</c:when>
			<c:when test="${list.tma_reserve1=='1'}">
			<div class="item">
				<img class="money" src="${ctxStatic}/reg-login/images/mycenter/money2.png">
				<div class="info" style="width: 76%;">
					<div class="top">
						<div class="text">任务奖金</div>
						<div class="time"><fmt:formatDate value="${list.createtime}" pattern="yyyy-MM-dd HH:mm:ss"/></div>
					</div>
					<div class="bottom">
						恭喜您：您做${list.tma_dtlname}任务赚了${list.tma_jine}元，请继续努力。
					</div>
				</div>
			</div>
			</c:when>
			<c:when test="${list.tma_reserve1=='3'}">
			<div class="item">
				<img class="money" src="${ctxStatic}/reg-login/images/mycenter/money1.png">
				<div class="info" style="width: 76%;">
					<div class="top">
						<div class="text">签到奖励</div>
						<div class="time"><fmt:formatDate value="${list.createtime}" pattern="yyyy-MM-dd HH:mm:ss"/></div>
					</div>
					<div class="bottom">
						恭喜您：${list.tma_dtlname}${list.tma_jine}元，请继续努力。
					</div>
				</div>
			</div>
			</c:when>
			<c:otherwise>
			<div class="item">
				<img class="money" src="${ctxStatic}/reg-login/images/mycenter/money6.png">
				<div class="info" style="width: 76%;">
					<div class="top">
						<div class="text">理财金奖励</div>
						<div class="time"><fmt:formatDate value="${list.createtime}" pattern="yyyy-MM-dd HH:mm:ss"/></div>
					</div>
					<div class="bottom">
						恭喜您：${list.tma_dtlname}${list.tma_jine}元，请继续努力。
					</div>
				</div>
			</div>
			</c:otherwise>
			</c:choose>
			</c:forEach>
		</div>
		
		<!-- 这里是显示系统消息 -->
		<div  class="list" :visible="!@show">
		<c:forEach items="${taskApplylist}" var="taskApplylist">
			<div class="item">
				<c:if test="${taskApplylist.tma_status=='3'}">
					<img class="money" src="${ctxStatic}/reg-login/images/mycenter/money4.png">
				</c:if>
				<c:if test="${taskApplylist.tma_status=='1'}">
					<img class="money" src="${ctxStatic}/reg-login/images/mycenter/money5.png">
				</c:if>
				<div class="info" style="width: 76%;">
					<div class="top">
						<div class="text">任务通知</div>
						<div class="time"><fmt:formatDate value="${taskApplylist.createtime}" pattern="yyyy-MM-dd HH:mm:ss"/></div>
					</div>
					<div class="bottom">
						
						<c:if test="${taskApplylist.tma_status=='1'}">
							恭喜：
						</c:if>
						<c:if test="${taskApplylist.tma_status=='3'}">
							很遗憾：
						</c:if>
						您提交了${taskApplylist.tmt_name}任务，
						任务金额${taskApplylist.tmt_price}元，
						<c:if test="${taskApplylist.tma_status=='1'}">
							<span style="color: red">正在审核中，</span>
						</c:if>
						<c:if test="${taskApplylist.tma_status=='3'}">
							<span style="color: red">审核失败，</span>
						</c:if>
						，请继续努力。
					</div>
				</div>
			</div>
		</c:forEach>
		</div>
		
	</div>
</body>
</html>