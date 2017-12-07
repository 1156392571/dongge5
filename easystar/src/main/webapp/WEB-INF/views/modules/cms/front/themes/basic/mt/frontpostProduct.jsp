<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>发布信息</title>
	<meta name="decorator" content="cms_default_${site.theme}"/>
	<meta name="description" content="${category.description}" />
	<meta name="keywords" content="${category.keywords}" />
	<link href="${ctxStatic}/modules/cms/front/themes/mt/upload/css/webuploader.css" type="text/css" rel="stylesheet" />
	<link href="${ctxStatic}/modules/cms/front/themes/mt/upload/css/style.css" type="text/css" rel="stylesheet" />
	<script src="${ctxStatic}/modules/cms/front/themes/mt/upload/js/webuploader.js" type="text/javascript"></script>
	<script src="${ctxStatic}/modules/cms/front/themes/mt/upload/js/frontproductupload.js" type="text/javascript"></script>
	<link href="${ctxStatic}/jquery-select2/3.4/select2.min.css" rel="stylesheet" />
	<script src="${ctxStatic}/jquery-select2/3.4/select2.min.js" type="text/javascript"></script>
	<script src="${ctxStatic}/common/mustache.min.js" type="text/javascript"></script>
	<script src="${ctxStatic}/common/jeesite.js" type="text/javascript"></script>
	<style type="text/css">
		#s2id_proType{
			width: 284px;
		}
		#s2id_proJstype{
			width: 284px;
		}
		#s2id_proRztype{
			width: 284px;
		}
		#proRemarks{
			padding:0;
			width: 418px;
		}
		.control-label{
		font-size: 15px;
		}
	</style>
	<script src="${ctxStatic}/ping++/pingpp.js" type="text/javascript"></script>
	<script type="text/javascript">
		function fabu(){
			var amount="0.01";
			var subject="结算任务";
			var body="米兔网上结算";
			$.ajax({
				url:'${ctx}/pay/apppay',
				type:'post',
				data:{amount:amount,subject:subject,body:body},
				dataType:'json',
				success:function(data){
					pingpp.createPayment(data, function(result, error) {
						alert(result+"=="+error);
				})
				}
			})
			
		}
	
	</script>
</head>
<body>
<div style="text-align: center;">
<h3><a onclick="fabu()">发布信息</a></h3>
</div>
<div style="border: 1px rgb(231, 230, 230) solid;margin: 15px 50px 50px 50px ;border-radius:5px;box-shadow: #DFDCDB 0 0 5px;">
	<br>
	<form:form id="inputForm" modelAttribute="tProduct" action="${ctx}/saveproduct" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label" style="width: 35%">产品名称：</label>
			<div class="controls">
				<form:input path="proName" htmlEscape="false" maxlength="255" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" style="width: 35%">产品价格：</label>
			<div class="controls">
				<form:input path="proPrice" htmlEscape="false" maxlength="64" class="input-xlarge required"/>
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
</div>
</body>
</html>