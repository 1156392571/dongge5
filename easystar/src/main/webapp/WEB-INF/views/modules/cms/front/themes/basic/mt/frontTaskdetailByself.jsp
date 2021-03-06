<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/head.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>发布信息</title>
<link href="${ctxStatic}/jquery-select2/3.4/select2.min.css" rel="stylesheet" />
<script src="${ctxStatic}/jquery-select2/3.4/select2.min.js" type="text/javascript"></script>
<script src="${ctxStatic}/common/mustache.min.js" type="text/javascript"></script>
<script src="${ctxStatic}/common/jeesite.js" type="text/javascript"></script>

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
	width: 272px;
}

#s2id_taskRztype {
	width: 272px;
}

.control-label {
	font-size: 15px;
}
</style>
</head>
<body>
<form:form id="inputForm" modelAttribute="tTask" action="${ctx}/updateTask" method="post" class="form-horizontal">
			<form:hidden path="id" />
			<sys:message content="${message}" />
			<div class="control-group">
				<label class="control-label" style="width: 40%">任务名称：</label>
				<div class="controls">
					<form:input path="taskName" htmlEscape="false" maxlength="255"
						class="input-xlarge required" style="width:270px;height:30px;line-height:30px;"/>
					<span class="help-inline"><font color="red">*</font> </span>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" style="width: 40%">任务价格：</label>
				<div class="controls">
					<form:input path="taskPrice" htmlEscape="false" maxlength="64"
						class="input-xlarge required" style="width:270px;height:30px;line-height:30px;"/>
					<span class="help-inline"><font color="red">*</font> </span>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" style="width: 40%">发布任务数量：</label>
				<div class="controls">
					<form:input path="taskAmount" htmlEscape="false" maxlength="64"
						class="input-xlarge required" style="width:270px;height:30px;line-height:30px;"/>
					<span class="help-inline"><font color="red">*</font> </span>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" style="width: 40%">有效时间：</label>
				<div class="controls">
					<form:input path="taskYxsj" htmlEscape="false" maxlength="10"
						class="input-xlarge required" style="width:270px;height:30px;line-height:30px;"/>
					<span class="help-inline"><font color="red">*</font> </span>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" style="width: 40%">做单要求：</label>
				<div class="controls">
					<form:textarea path="taskAsk" htmlEscape="false" rows="4"
						maxlength="255" class="input-xxlarge " />
					<span class="help-inline"><font color="red">*</font> </span>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" style="width: 40%">做单技巧：</label>
				<div class="controls">
					<form:textarea path="taskSkill" htmlEscape="false" rows="4"
						maxlength="255" class="input-xxlarge " />
					<span class="help-inline"><font color="red">*</font> </span>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" style="width: 40%">任务联系电话：</label>
				<div class="controls">
					<form:input path="taskPhone" htmlEscape="false" maxlength="255"
						class="input-xlarge required" style="width:270px;height:30px;line-height:30px;"/>
					<span class="help-inline"><font color="red">*</font> </span>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" style="width: 40%">任务联系QQ：</label>
				<div class="controls">
					<form:input path="taskQq" htmlEscape="false" maxlength="255"
						class="input-xlarge required" style="width:270px;height:30px;line-height:30px;"/>
					<span class="help-inline"><font color="red">*</font> </span>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" style="width: 40%">任务类型：</label>
				<div class="controls">
					<form:select path="taskType" class="input-xlarge ">
						<form:option value="" label="" />
						<form:options items="${fns:getDictList('taskType')}"
							itemLabel="label" itemValue="value" htmlEscape="false" />
					</form:select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" style="width: 40%">任务认证方式：</label>
				<div class="controls">
					<form:select path="taskRztype" class="input-xlarge ">
						<form:option value="" label="" />
						<form:options items="${fns:getDictList('taskRztype')}"
							itemLabel="label" itemValue="value" htmlEscape="false" />
					</form:select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" style="width: 40%">备注信息：</label>
				<div class="controls">
					<form:textarea path="taskRemarks" htmlEscape="false" rows="4"
						maxlength="255" class="input-xxlarge " />
				</div>
			</div>
			<div class="form-actions">
				<div style="margin-left: 35%">
					<input id="btnSubmit" class="btn btn-primary" type="submit"
						value="保 存" />&nbsp; <input id="btnCancel" class="btn"
						type="button" value="返 回" onclick="history.go(-1)" />
				</div>
			</div>
		</form:form>
</body>
</html>