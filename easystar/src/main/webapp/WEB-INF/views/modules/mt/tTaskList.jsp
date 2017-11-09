<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>发布任务管理</title>
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
		<li class="active"><a href="${ctx}/mt/tTask/">发布任务列表</a></li>
		<shiro:hasPermission name="mt:tTask:edit"><li><a href="${ctx}/mt/tTask/form">发布任务添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="tTask" action="${ctx}/mt/tTask/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>任务名称：</label>
				<form:input path="taskName" htmlEscape="false" maxlength="45" class="input-medium"/>
			</li>
			<li><label>任务类型：</label>
				<form:select path="taskType" class="input-xlarge " >
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('taskType')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>认证方式：</label>
				<form:select path="taskRztype" class="input-xlarge " >
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('taskRztype')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>任务名称</th>
				<th>任务价格</th>
				<th>发布任务数量</th>
				<th>有效时间</th>
				<th>任务联系电话</th>
				<th>任务联系QQ</th>
				<th>任务类型</th>
				<th>任务认证方式</th>
				<th>创建时间</th>
				<shiro:hasPermission name="mt:tTask:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="tTask">
			<tr>
				<td>
					${tTask.taskName}
				</td>
				<td>
					${tTask.taskPrice}
				</td>
				<td>
					${tTask.taskAmount}
				</td>
				<td>
					${tTask.taskYxsj}
				</td>
				<td>
					${tTask.taskPhone}
				</td>
				<td>
					${tTask.taskQq}
				</td>
				<td>
					${fns:getDictLabel(tTask.taskType, 'taskType', '')}
				</td>
				<td>
					${fns:getDictLabel(tTask.taskRztype, 'taskRztype', '')}
				</td>
				<td>
					<fmt:formatDate value="${tTask.createtime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<shiro:hasPermission name="mt:tTask:edit"><td>
    				<a href="${ctx}/mt/tTask/form?id=${tTask.id}">修改</a>
					<a href="${ctx}/mt/tTask/delete?id=${tTask.id}" onclick="return confirmx('确认要删除该发布任务吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>