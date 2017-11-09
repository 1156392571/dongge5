<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>发布任务管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
					loading('正在提交，请稍等...');
					form.submit();
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
					if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
						error.appendTo(element.parent().parent());
					} else {
						error.insertAfter(element);
					}
				}
			});
		});
	</script>
<style type="text/css">
#taskAsk {
	width: 272px;
}

#taskSkill {
	width: 272px;
}

#taskRemarks {
	width: 272px;
}

#s2id_taskType {
	width: 284px;
}

#s2id_taskRztype {
	width: 284px;
}
</style>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/mt/tTask/">发布任务列表</a></li>
		<li class="active"><a href="${ctx}/mt/tTask/form?id=${tTask.id}">发布任务<shiro:hasPermission name="mt:tTask:edit">${not empty tTask.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="mt:tTask:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="tTask" action="${ctx}/mt/tTask/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">任务名称：</label>
			<div class="controls">
				<form:input path="taskName" htmlEscape="false" maxlength="255" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">任务价格：</label>
			<div class="controls">
				<form:input path="taskPrice" htmlEscape="false" maxlength="64" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">发布任务数量：</label>
			<div class="controls">
				<form:input path="taskAmount" htmlEscape="false" maxlength="64" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">有效时间：</label>
			<div class="controls">
				<form:input path="taskYxsj" htmlEscape="false" maxlength="10" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">做单要求：</label>
			<div class="controls">
				<form:textarea path="taskAsk" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">做单技巧：</label>
			<div class="controls">
				<form:textarea path="taskSkill" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">任务联系电话：</label>
			<div class="controls">
				<form:input path="taskPhone" htmlEscape="false" maxlength="255" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">任务联系QQ：</label>
			<div class="controls">
				<form:input path="taskQq" htmlEscape="false" maxlength="255" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">任务类型：</label>
			<div class="controls">
				<form:select path="taskType" class="input-xlarge ">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('taskType')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">任务认证方式：</label>
			<div class="controls">
				<form:select path="taskRztype" class="input-xlarge ">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('taskRztype')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">备注信息：</label>
			<div class="controls">
				<form:textarea path="taskRemarks" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="mt:tTask:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>