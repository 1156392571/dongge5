<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>用户信息附加表管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
	</script>
	<style type="text/css">
		.input-xlarge {
		width: 177px;
		}
		.table th, .table td{
			text-align: center
		}
	</style>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/mt/tUser/">用户信息附加表列表</a></li>
	</ul>
	<form:form id="searchForm" modelAttribute="tUser" action="${ctx}/mt/tUser/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>登录名：</label>
				<form:input path="tLoginname" htmlEscape="false" maxlength="45" class="input-medium"/>
			</li>
			<li><label>真实姓名：</label>
				<form:input path="tName" htmlEscape="false" maxlength="45" class="input-medium"/>
			</li>
			<li><label>手机：</label>
				<form:input path="tPhone" htmlEscape="false" maxlength="45" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>用户名</th>
				<th>真实姓名</th>
				<th>电话</th>
				<th>邮箱</th>
				<th>QQ</th>
				<th>WX</th>
				<th>公司名称</th>
				<th>公司网址</th>
<%-- 				<shiro:hasPermission name="mt:tUser:edit"><th>操作</th></shiro:hasPermission> --%>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="tUser">
			<tr>
				<td>
					${tUser.tLoginname}
				</td>
				<td>
					${tUser.tName}
				</td>
				<td>
					${tUser.tEmail}
				</td>
				<td>
					${tUser.tPhone}
				</td>
				<td>
					${tUser.qq}
				</td>
				<td>
					${tUser.wx}
				</td>
				<td>
					${tUser.tCompany}
				</td>
				<td>
					${tUser.tCompanyurl}
				</td>
				<!-- 
				<shiro:hasPermission name="mt:tUser:edit"><td>
    				<a href="${ctx}/mt/tUser/form?id=${tUser.id}">修改</a>
					<a href="${ctx}/mt/tUser/delete?id=${tUser.id}" onclick="return confirmx('确认要删除该用户信息附加表吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
				 -->
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>