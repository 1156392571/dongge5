<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>提现记录表管理</title>
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
		<li class="active"><a href="${ctx}/mt/tTixian/">提现记录表列表</a></li>
	</ul>
	<form:form id="searchForm" modelAttribute="tTixian" action="${ctx}/mt/tTixian/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>用户手机：</label>
				<form:input path="ttUserid" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>提现状态：</label>
				<form:select path="ttGetcashstatus" class="input-xlarge " >
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('cashtype')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
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
				<th>用户手机</th>
				<th>支付宝账号</th>
				<th>提现金额</th>
				<th>提现状态</th>
				<th>创建时间</th>
				<shiro:hasPermission name="mt:tTixian:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="tTixian">
			<tr>
				<td>
					${tTixian.ttUserid}
				</td>
				<td>
					${tTixian.ttAlipay}
				</td>
				<td>
					${tTixian.ttGetcashcount}
				</td>
				<td>
					${fns:getDictLabel(tTixian.ttGetcashstatus, 'cashtype', '')}
				</td>
				<td>
					<fmt:formatDate value="${tTixian.createtime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<c:if test="${tTixian.ttGetcashstatus=='1'}">
				<shiro:hasPermission name="mt:tTixian:edit"><td>
					<a href="${ctx}/mt/tTixian/update?id=${tTixian.id}" onclick="return confirmx('确认该提现已成功吗？', this.href)">提现成功</a>
				</td></shiro:hasPermission>
				</c:if>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>