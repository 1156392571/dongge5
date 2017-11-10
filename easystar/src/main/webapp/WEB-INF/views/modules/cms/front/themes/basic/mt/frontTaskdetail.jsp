<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>发布信息</title>
<meta name="decorator" content="cms_default_${site.theme}" />
<meta name="description" content="${category.description}" />
<meta name="keywords" content="${category.keywords}" />
<link href="${ctxStatic}/jquery-select2/3.4/select2.min.css"
	rel="stylesheet" />
<script src="${ctxStatic}/jquery-select2/3.4/select2.min.js"
	type="text/javascript"></script>
<script src="${ctxStatic}/common/mustache.min.js" type="text/javascript"></script>
<script src="${ctxStatic}/common/jeesite.js" type="text/javascript"></script>
<style type="text/css">
</style>

<script type="text/javascript">
    function a(){
        console.log(1);
}
    setInterval(a,5000);
</script>

</head>
<body>
	<div style="text-align: center;z-index: 4">
		<h3>任务详情</h3>
	</div>
	<div>
		<c:choose>
			<c:when test="${not empty taskorder}">
				<c:if test="${taskorder.toType=='1'}">
					申请中（显示倒计时）
				</c:if>
				<c:if test="${taskorder.toType=='2'}">
					申请成功（不能再进行申请）
				</c:if>
				<c:if test="${taskorder.toType=='3'}">
					申请失败（还可再次申请）
				</c:if>
			</c:when>
			<c:otherwise>
				未申请（可申请）
			</c:otherwise>
		</c:choose>
	
	</div>
</body>
</html>