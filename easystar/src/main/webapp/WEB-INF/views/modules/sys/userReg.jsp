<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>用户注册</title>
<meta name="decorator" content="cms_default_${site.theme}" />
<meta name="description" content="${category.description}" />
<meta name="keywords" content="${category.keywords}" />
<link rel="stylesheet" href="${ctxStatic}/reg-login/css/reset.css">
<link rel="stylesheet" href="${ctxStatic}/reg-login/css/supersized.css">
<link rel="stylesheet" href="${ctxStatic}/reg-login/css/style.css">
<script src="${ctxStatic}/reg-login/js/jquery-1.8.2.min.js"></script>
<script src="${ctxStatic}/reg-login/js/supersized.3.2.7.min.js"></script>
<script src="${ctxStatic}/reg-login/js/supersized-init.js"></script>
<script src="${ctxStatic}/reg-login/js/scripts_reg.js"></script>
<style type="text/css">
</style>
</head>
<body>
	<div class="page-container" style="margin-top: 20px;">
		<h1>用户注册</h1>
		<div id="message" display="none">
			
		</div>
		<form:form id="inputForm" modelAttribute="user" action="" method="post" class="form-horizontal">
			<form:input path="loginName" htmlEscape="false" class="username" maxlength="255" placeholder="用户名(必填)"/>
			<form:password path="password" htmlEscape="false" class="password" minlength="6" placeholder="密码(必填)"/>
<%-- 			<form:input path="scSex" htmlEscape="false" class="scSex" maxlength="255" placeholder="性别"/> --%>
			<form:input path="phone" htmlEscape="false" class="scPhone" maxlength="255" placeholder="手机号(必填)"/>
			<form:input path="email" htmlEscape="false" class="scEmail" maxlength="255" placeholder="电子邮箱"/>
<%-- 			<form:input path="scQq" htmlEscape="false" class="scQq" maxlength="255" placeholder="QQ"/> --%>
<%-- 			<form:input path="scWx" htmlEscape="false" class="scWx" maxlength="255" placeholder="微信"/> --%>
			<input type="submit" class="tijiao" value="注册" />
			<div class="error">
				<span>+</span>
			</div>
			<div class="error_username">
				<span>用户名不能为空</span>
			</div>
		</form:form>
	</div>
</body>
</html>