<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>手机任务表管理</title>
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
		<li class="active"><a href="${ctx}/mt/tMobileTask/">手机任务表列表</a></li>
		<shiro:hasPermission name="mt:tMobileTask:edit"><li><a href="${ctx}/mt/tMobileTask/form">手机任务表添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="tMobileTask" action="${ctx}/mt/tMobileTask/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>任务名称：</label>
				<form:input path="tmtName" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
<!-- 				<th>编号</th> -->
<!-- 				<th>发布任务者id</th> -->
				<th>任务名称</th>
				<th>任务价格</th>
				<th>任务要求</th>
				<th>A级返佣</th>
				<th>B级返佣</th>
				<th>C级返佣</th>
<!-- 				<th>二维码图片url</th> -->
<!-- 				<th>二维码图片info</th> -->
				<th>任务开始时间</th>
				<th>任务结束时间</th>
				<th>创建时间</th>
				<th>备注信息</th>
				<shiro:hasPermission name="mt:tMobileTask:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="tMobileTask">
			<tr>
<%-- 				<td><a href="${ctx}/mt/tMobileTask/form?id=${tMobileTask.id}"> --%>
<%-- 					${tMobileTask.id} --%>
<!-- 				</a></td> -->
<!-- 				<td> -->
<%-- 					${tMobileTask.tmtUserid} --%>
<!-- 				</td> -->
				<td>
					${tMobileTask.tmtName}
				</td>
				<td>
					${tMobileTask.tmtPrice}
				</td>
				<td>
					${tMobileTask.tmtAsk}
				</td>
				<td>
					${tMobileTask.tmtRebatea}
				</td>
				<td>
					${tMobileTask.tmtRebateb}
				</td>
				<td>
					${tMobileTask.tmtRebatec}
				</td>
<!-- 				<td> -->
<%-- 					${tMobileTask.tmtPhotourl} --%>
<!-- 				</td> -->
<!-- 				<td> -->
<%-- 					${tMobileTask.tmtPhotoinfo} --%>
<!-- 				</td> -->
				<td>
					<fmt:formatDate value="${tMobileTask.tmtStartdate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					<fmt:formatDate value="${tMobileTask.tmtEnddate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					<fmt:formatDate value="${tMobileTask.createtime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${tMobileTask.remarks}
				</td>
				<shiro:hasPermission name="mt:tMobileTask:edit"><td>
    				<a href="${ctx}/mt/tMobileTask/form?id=${tMobileTask.id}">修改</a>
					<a href="${ctx}/mt/tMobileTask/delete?id=${tMobileTask.id}" onclick="return confirmx('确认要删除该手机任务表吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>