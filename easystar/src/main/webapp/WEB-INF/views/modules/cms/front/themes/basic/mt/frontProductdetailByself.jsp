<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/head.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>发布产品信息</title>
<link href="${ctxStatic}/modules/cms/front/themes/mt/upload/css/webuploader.css" type="text/css" rel="stylesheet" />
	<link href="${ctxStatic}/modules/cms/front/themes/mt/upload/css/style.css" type="text/css" rel="stylesheet" />
	<script src="${ctxStatic}/modules/cms/front/themes/mt/upload/js/webuploader.js" type="text/javascript"></script>
	<script src="${ctxStatic}/modules/cms/front/themes/mt/upload/js/frontproductupload.js" type="text/javascript"></script>
	<link href="${ctxStatic}/jquery-select2/3.4/select2.min.css" rel="stylesheet" />
	<script src="${ctxStatic}/jquery-select2/3.4/select2.min.js" type="text/javascript"></script>
	<script src="${ctxStatic}/common/mustache.min.js" type="text/javascript"></script>
	<script src="${ctxStatic}/common/jeesite.js" type="text/javascript"></script>

<style type="text/css">
#proRemarks {
	padding: 0;
	width: 418px;
}
</style>
</head>
<body>
<form:form id="inputForm" modelAttribute="tProduct" action="${ctx}/updateProduct" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label" style="width: 35%">产品名称：</label>
			<div class="controls">
				<form:input path="proName" htmlEscape="false" maxlength="255" class="input-xlarge required" style="height:30px;line-height:30px;"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" style="width: 35%">产品价格：</label>
			<div class="controls">
				<form:input path="proPrice" htmlEscape="false" maxlength="64" class="input-xlarge required" style="height:30px;line-height:30px;"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		
		<div class="control-group">
			<label class="control-label" style="width: 35%">产品类型：</label>
			<div class="controls">
				<form:select path="proType" class="input-xlarge ">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('proType')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" style="width: 35%">结算方式：</label>
			<div class="controls">
				<form:select path="proJstype" class="input-xlarge ">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('proJstype')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" style="width: 35%">认证方式：</label>
			<div class="controls">
				<form:select path="proRztype" class="input-xlarge ">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('proRztype')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</div>
		</div>
		
		<!-- ==================================================================== -->
		<form:hidden path="proUrl"/>
		<form:hidden path="proUrlInfo"/>
		<div class="control-group">
			<label class="control-label" style="width: 35%">产品图片：</label>
				<div class="controls">
					<div class="width_auto" style="width: 420px;">
					    <div class="upload_container" >
					        <!--头部，相册选择和格式选择-->
					        <div id="uploader" >
					            <div class="item_container">
					                <div id="" class="queueList" >
					                    <div id="dndArea" class="placeholder">
					                        <div id="filePicker"></div>
					                    </div>
					                </div>
					            </div>
					            <div class="statusBar">
					                <div class="info"></div>
					                <div class="btns">
					                    <div id="filePicker2_0" class="filePicker2 element-invisible"></div><div class="uploadBtn">开始上传</div>
					                </div>
					            </div>
					        </div>
					    </div>
					</div>
				</div>
		</div>
		
		<div class="control-group">
			<label class="control-label" style="width: 35%">备注信息：</label>
			<div class="controls">
				<form:textarea path="proRemarks" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge " />
			</div>
		</div>
		<div class="form-actions">
			<div style="margin-left: 30%">
				<input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;&nbsp;&nbsp;
				<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
			</div>
		</div>
	</form:form>
</body>
</html>