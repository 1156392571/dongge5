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
	<title></title>
	 <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport">
	<link rel="stylesheet" href="${ctxStatic}/reg-login/css/mytask.css">
	<link rel="stylesheet" href="${ctxStatic}/reg-login/css/photoSwipe.css">
	<script src="${ctxStatic}/reg-login/js/avalon.js" type="text/javascript"></script>
	<script src="${ctxStatic}/reg-login/js/jquery.js"></script>
	<script type='text/javascript'>
	</script>
<script type="text/javascript">
	avalon.define({
		$id : 'test',
		show : true,

	})

</script>
<style type="text/css">
.ms-controller {
	visibility: hidden
}
</style>
</head>
<body>
	<div class="m-list ms-controller" ms-controller="test">
		<div class="nav">
			<div :class="['items',@show?'color':'']" ms-on-tap="@show = false">图文</div>
			<div :class="['items',!@show?'color':'']" ms-on-tap="@show = true">列表</div>
		</div>
		<div class="box1" :visible="!@show">
			<c:forEach items="${list}" var="mobiletask">
			<a href="${ctx}/pay/totaskdetails?id=${mobiletask.id}" class="item">
				<div class="top">
					<div class="left">
						<div class="title">${mobiletask.tmtName}</div>
						<div class="text">
						${fns:abbr(mobiletask.tmtAsk,30)}
						</div>
					</div>
					<div class="right">
						<img src="${ctxStatic}/reg-login/images/img/icon_you.png">
					</div>
				</div>
				<div class="bottom">
					<div class="time"><fmt:formatDate value="${mobiletask.createtime}" pattern="yyyy/MM/dd"/></div>
					<div class="sum">
						<img src="${ctxStatic}/reg-login/images/img/icon_yanjing.png">
						<span>${mobiletask.tmtViewtime}</span>
					</div>
				</div>
			</a>
		</c:forEach>
		</div>
		
	</div>
</body>
</html>