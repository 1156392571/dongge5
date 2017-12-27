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
<title>我的提现记录</title>
<link rel="stylesheet" href="${ctxStatic}/reg-login/css/myziliao.css">
<script type="text/javascript" src="${ctxStatic}/reg-login/js/avalon.js"></script>
<script type="text/javascript">
			avalon.define({
	                $id: 'test',
	                show: 1,
	            })
	</script>
</head>
<body>
	<div class="m-take_out">
		<div class="tou">
			<div class="left">本月</div>
			<img class="right" src="${ctxStatic}/reg-login/images/mycenter/rl.png">
		</div>
		<div class="list">
			
			<c:forEach items="${list}" var="list"> 
			<c:if test="${list.tt_getcashstatus=='1'}">
			<div class="item" onclick="totixiandtl('${list.id}')">
				<div class="left">
						<img src="${ctxStatic}/reg-login/images/mycenter/jsq.png" style="width: 35px;height: 35px;">
						<div class="info">
							<div class="title" style="font-size: 14px">提现</div>
							<div class="time"><fmt:formatDate value="${list.createtime}" pattern="yyyy-MM-dd HH:mm:ss"/></div>
						</div>
				</div>
				<div class="right">
					<strong>-${list.tt_getcashcount}</strong>
				</div>
			</div>
			</c:if>
			<c:if test="${list.tt_getcashstatus=='2'}">
			<div class="item">
				<div class="left">
						<img src="${ctxStatic}/reg-login/images/mycenter/tixian.png" style="width: 35px;height: 35px;">
						<div class="info">
							<div class="title" style="font-size: 14px">提现</div>
							<div class="time"><fmt:formatDate value="${list.createtime}" pattern="yyyy-MM-dd HH:mm:ss"/></div>
						</div>
				</div>
				<div class="right">
					<strong style="color: red">-${list.tt_getcashcount}</strong>
				</div>
			</div>
			</c:if>
			
			</c:forEach>
			
		</div>
	</div>
	
	
	<script type="text/javascript">
		function totixiandtl(id){
			window.location.href="${ctx}/pay/tomytixiandtl?id="+id;			
		}
	
	</script>
	</body>
</html>