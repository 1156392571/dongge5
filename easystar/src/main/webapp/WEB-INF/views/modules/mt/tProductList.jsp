<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>产品表管理</title>
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
		<li class="active"><a href="${ctx}/mt/tProduct/">产品表列表</a></li>
		<shiro:hasPermission name="mt:tProduct:edit"><li><a href="${ctx}/mt/tProduct/form">产品表添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="tProduct" action="${ctx}/mt/tProduct/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>产品名称：</label>
				<form:input path="proName" htmlEscape="false" maxlength="45" class="input-medium"/>
			</li>
			<li><label>产品类型：</label>
				<form:select path="proType" class="input-xlarge " >
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('proType')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>结算方式：</label>
				<form:select path="proJstype" class="input-xlarge " >
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('proJstype')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>认证方式：</label>
				<form:select path="proRztype" class="input-xlarge " >
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('proRztype')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
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
				<th>产品名称</th>
				<th>产品价格</th>
				<th>产品类型</th>
				<th>结算方式</th>
				<th>认证方式</th>
				<th>发布时间</th>
				<th>备注信息</th>
				<shiro:hasPermission name="mt:tProduct:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="tProduct">
			<tr>
				<td>
					${tProduct.proName}
				</td>
				<td>
					${tProduct.proPrice}
				</td>
				<td>
					${fns:getDictLabel(tProduct.proType, 'proType', '')}
				</td>
				<td>
					${fns:getDictLabel(tProduct.proJstype, 'proJstype', '')}
				</td>
				<td>
					${fns:getDictLabel(tProduct.proRztype, 'proRztype', '')}
				</td>
				<td>
					<fmt:formatDate value="${tProduct.createtime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${tProduct.remarks}
				</td>
				<shiro:hasPermission name="mt:tProduct:edit"><td>
    				<a href="${ctx}/mt/tProduct/form?id=${tProduct.id}">修改</a>
					<a href="${ctx}/mt/tProduct/delete?id=${tProduct.id}" onclick="return confirmx('确认要删除该产品表吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination" >${page}</div>
</body>
</html>