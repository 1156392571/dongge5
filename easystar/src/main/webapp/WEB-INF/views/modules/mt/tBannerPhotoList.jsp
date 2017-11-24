<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>页面广告管理</title>
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
		<li class="active"><a href="${ctx}/mt/tBannerPhoto/">页面广告列表</a></li>
		<shiro:hasPermission name="mt:tBannerPhoto:edit"><li><a href="${ctx}/mt/tBannerPhoto/form">页面广告添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="tBannerPhoto" action="${ctx}/mt/tBannerPhoto/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>广告名称：</label>
				<form:input path="bpName" htmlEscape="false" maxlength="45" class="input-medium"/>
			</li>
			<li><label>广告类型：</label>
				<form:select path="bpType" class="input-xlarge " >
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('bpType')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>广告状态：</label>
				<form:select path="bpStatus" class="input-xlarge " >
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('bpStatus')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
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
				<th>广告名称</th>
				<th>广告类型</th>
				<th>广告状态</th>
				<th>广告图片</th>
				<th>创建时间</th>
				<th>备注信息</th>
				<shiro:hasPermission name="mt:tBannerPhoto:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="tBannerPhoto">
			<tr>
				<td>
					${tBannerPhoto.bpName}
				</td>
				<td>
					${fns:getDictLabel(tBannerPhoto.bpType, 'bpType', '')}
				</td>
				<td>
					${fns:getDictLabel(tBannerPhoto.bpStatus, 'bpStatus', '')}
				</td>
				<td>
					${tBannerPhoto.bpUrl}
				</td>
				<td>
					<fmt:formatDate value="${tBannerPhoto.createtime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${tBannerPhoto.bpRemarks}
				</td>
				<shiro:hasPermission name="mt:tBannerPhoto:edit"><td>
    				<a href="${ctx}/mt/tBannerPhoto/form?id=${tBannerPhoto.id}">修改</a>
					<a href="${ctx}/mt/tBannerPhoto/delete?id=${tBannerPhoto.id}" onclick="return confirmx('确认要删除该页面广告吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>