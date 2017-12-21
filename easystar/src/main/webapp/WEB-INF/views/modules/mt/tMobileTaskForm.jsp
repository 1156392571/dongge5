<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>手机任务表管理</title>
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
	<script src="${ctxStatic}/modules/cms/front/themes/mt/upload/js/mobiletaskupload.js" type="text/javascript"></script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/mt/tMobileTask/">手机任务表列表</a></li>
		<li class="active"><a href="${ctx}/mt/tMobileTask/form?id=${tMobileTask.id}">手机任务表<shiro:hasPermission name="mt:tMobileTask:edit">${not empty tMobileTask.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="mt:tMobileTask:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="tMobileTask" action="${ctx}/mt/tMobileTask/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">任务名称：</label>
			<div class="controls">
				<form:input path="tmtName" htmlEscape="false" maxlength="255" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">任务价格：</label>
			<div class="controls">
				<form:input path="tmtPrice" htmlEscape="false" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">任务要求：</label>
			<div class="controls">
				<form:input path="tmtAsk" htmlEscape="false" maxlength="255" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">A级返佣：</label>
			<div class="controls">
				<form:input path="tmtRebatea" htmlEscape="false" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">B级返佣：</label>
			<div class="controls">
				<form:input path="tmtRebateb" htmlEscape="false" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">C级返佣：</label>
			<div class="controls">
				<form:input path="tmtRebatec" htmlEscape="false" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<!-- =======================这里是放二维码的地方========================= -->
		<form:hidden path="tmtPhotourl" />
		<form:hidden path="tmtPhotoinfo" />
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
			<label class="control-label">任务开始时间：</label>
			<div class="controls">
				<input name="tmtStartdate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate required"
					value="<fmt:formatDate value="${tMobileTask.tmtStartdate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">任务结束时间：</label>
			<div class="controls">
				<input name="tmtEnddate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate required"
					value="<fmt:formatDate value="${tMobileTask.tmtEnddate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">浏览次数：</label>
			<div class="controls">
				<form:input path="tmtViewtime" htmlEscape="false" maxlength="11" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">备注信息：</label>
			<div class="controls">
				<form:input path="tmtRemarks" htmlEscape="false" maxlength="255" class="input-xlarge "/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="mt:tMobileTask:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>