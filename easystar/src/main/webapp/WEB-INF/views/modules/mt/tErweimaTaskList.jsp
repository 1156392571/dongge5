<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>扫码任务管理</title>
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
		<li class="active"><a href="${ctx}/mt/tErweimaTask/">扫码任务列表</a></li>
		<shiro:hasPermission name="mt:tErweimaTask:edit"><li><a href="${ctx}/mt/tErweimaTask/form">扫码任务添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="tErweimaTask" action="${ctx}/mt/tErweimaTask/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>任务类型：</label>
				<form:input path="tetTasktype" htmlEscape="false" maxlength="1" class="input-medium"/>
			</li>
			<li><label>任务价格：</label>
				<form:input path="tetTaskprice" htmlEscape="false" class="input-medium"/>
			</li>
			<li><label>任务状态：</label>
				<form:input path="tetTaskstatus" htmlEscape="false" maxlength="1" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>编号</th>
				<th>手机号</th>
				<th>任务类型</th>
				<th>任务价格</th>
				<th>任务状态</th>
				<th>创建时间</th>
				<shiro:hasPermission name="mt:tErweimaTask:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="tErweimaTask">
			<tr>
				<td><a href="${ctx}/mt/tErweimaTask/form?id=${tErweimaTask.id}">
					${tErweimaTask.id}
				</a></td>
				<td>
					${tErweimaTask.tetUserid}
				</td>
				<td>
					${fns:getDictLabel(tErweimaTask.tetTasktype, 'tetTasktype', '')}
				</td>
				<td>
					${tErweimaTask.tetTaskprice}
				</td>
				<td>
					${fns:getDictLabel(tErweimaTask.tetTaskstatus, 'toCheckstatus', '')}
				</td>
				<td>
					<fmt:formatDate value="${tErweimaTask.createtime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<shiro:hasPermission name="mt:tErweimaTask:edit"><td>
    				<a href="${ctx}/mt/tErweimaTask/form?id=${tErweimaTask.id}">修改</a>
					<a href="${ctx}/mt/tErweimaTask/delete?id=${tErweimaTask.id}" onclick="return confirmx('确认要删除该扫码任务吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>