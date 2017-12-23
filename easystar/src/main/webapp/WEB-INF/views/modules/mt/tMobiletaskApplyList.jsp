<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>手机做任务管理</title>
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
		<li class="active"><a href="${ctx}/mt/tMobiletaskApply/">手机做任务列表</a></li>
	</ul>
	<form:form id="searchForm" modelAttribute="tMobiletaskApply" action="${ctx}/mt/tMobiletaskApply/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>姓名：</label>
				<form:input path="tmaName" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>身份证号：</label>
				<form:input path="tmaCardid" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>手机号码：</label>
				<form:input path="tmaPhone" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>任务状态：</label>
				<form:select path="tmaStatus" class="input-xlarge " style="width:180px;">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('toCheckstatus')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
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
				<th>用户手机号</th>
				<th>任务名称</th>
				<th>姓名</th>
				<th>身份证号</th>
				<th>手机号码</th>
				<th>任务状态</th>
				<th>创建时间</th>
				<shiro:hasPermission name="mt:tMobiletaskApply:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="tMobiletaskApply">
			<tr>
				<td>
					${tMobiletaskApply.tmaUserid}
				</td>
				<td>
					${tMobiletaskApply.tmaTaskid}
				</td>
				<td>
					${tMobiletaskApply.tmaName}
				</td>
				<td>
					${tMobiletaskApply.tmaCardid}
				</td>
				<td>
					${tMobiletaskApply.tmaPhone}
				</td>
				<td>
<%-- 					${tMobiletaskApply.tmaStatus} --%>
					${fns:getDictLabel(tMobiletaskApply.tmaStatus, 'toCheckstatus', '')}
				</td>
				<td>
					<fmt:formatDate value="${tMobiletaskApply.createtime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<shiro:hasPermission name="mt:tMobiletaskApply:edit"><td>
<%--     				<a href="${ctx}/mt/tMobiletaskApply/form?id=${tMobiletaskApply.id}">修改</a> --%>
					
					<c:if test="${tMobiletaskApply.tmaStatus=='1'}">
						<a href="${ctx}/mt/tMobiletaskApply/checkpass?id=${tMobiletaskApply.id}&tmaStatus=2">通过</a>
						<a href="${ctx}/mt/tMobiletaskApply/checkpass?id=${tMobiletaskApply.id}&tmaStatus=3">失败</a>
					</c:if>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>