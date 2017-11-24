<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>页面广告管理</title>
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
	<link href="${ctxStatic}/modules/cms/front/themes/mt/upload/css/webuploader.css" type="text/css" rel="stylesheet" />
	<link href="${ctxStatic}/modules/cms/front/themes/mt/upload/css/style.css" type="text/css" rel="stylesheet" />
	<script src="${ctxStatic}/modules/cms/front/themes/mt/upload/js/webuploader.js" type="text/javascript"></script>
	<script src="${ctxStatic}/modules/cms/front/themes/mt/upload/js/bannerupload.js" type="text/javascript"></script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/mt/tBannerPhoto/">页面广告列表</a></li>
		<li class="active"><a href="${ctx}/mt/tBannerPhoto/form?id=${tBannerPhoto.id}">页面广告<shiro:hasPermission name="mt:tBannerPhoto:edit">${not empty tBannerPhoto.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="mt:tBannerPhoto:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="tBannerPhoto" action="${ctx}/mt/tBannerPhoto/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">横幅标题名称：</label>
			<div class="controls">
				<form:input path="bpName" htmlEscape="false" maxlength="255" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		
		<!-- ==================================================================== -->
		<form:hidden path="bpUrl"/>
		<form:hidden path="bpUrlinfo"/>
		<div class="control-group">
			<label class="control-label">产品图片：</label>
				<div class="controls">
					<div class="width_auto" style="width: 580px;">
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
			<label class="control-label">产品类型：</label>
			<div class="controls">
				<form:select path="bpType" class="input-xlarge ">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('bpType')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</div>
		</div>
		
		<div class="control-group">
			<label class="control-label">图片状态：</label>
			<div class="controls">
				<form:select path="bpStatus" class="input-xlarge ">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('bpStatus')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">备注信息：</label>
			<div class="controls">
				<form:input path="bpRemarks" htmlEscape="false" maxlength="255" class="input-xlarge "/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="mt:tBannerPhoto:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>