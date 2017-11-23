<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>账户明细表管理</title>
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
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/mt/tAcountDtl/">账户明细表列表</a></li>
		<shiro:hasPermission name="mt:tAcountDtl:edit"><li><a href="${ctx}/mt/tAcountDtl/form">账户明细表添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="tAcountDtl" action="${ctx}/mt/tAcountDtl/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>更新时间</th>
				<th>备注信息</th>
				<shiro:hasPermission name="mt:tAcountDtl:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="tAcountDtl">
			<tr>
				<td><a href="${ctx}/mt/tAcountDtl/form?id=${tAcountDtl.id}">
					<fmt:formatDate value="${tAcountDtl.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</a></td>
				<td>
					${tAcountDtl.remarks}
				</td>
				<shiro:hasPermission name="mt:tAcountDtl:edit"><td>
    				<a href="${ctx}/mt/tAcountDtl/form?id=${tAcountDtl.id}">修改</a>
					<a href="${ctx}/mt/tAcountDtl/delete?id=${tAcountDtl.id}" onclick="return confirmx('确认要删除该账户明细表吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>