<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<%@include file="/WEB-INF/views/modules/cms/front/include/head.jsp" %>
<!DOCTYPE html>
<html>
<link href="${ctxStatic}/jquery-select2/3.4/select2.min.css" rel="stylesheet" />
	<script src="${ctxStatic}/jquery-select2/3.4/select2.min.js" type="text/javascript"></script>
	<script src="${ctxStatic}/common/mustache.min.js" type="text/javascript"></script>
	<script src="${ctxStatic}/common/jeesite.js" type="text/javascript"></script>
<head>
<style type="text/css">
body {
	font-family: microsoft yahei !important;
}

a {
	color: #333;
	text-decoration: none;
}

a:HOVER{
	text-decoration: none;
}

blockquote, body, button, dd, dl, dt, fieldset, form, h1, h2, h3, h4, h5,
	h6, hr, input, legend, li, ol, p, pre, td, textarea, th, ul {
	margin: 0;
	padding: 0;
}

.channel_partner li {
	width: 396px;
	height: 150px;
	padding: 15px 0 15px 0;
	font-size: 12px;
	color: #666;
	display: inline-block;
	line-height: 22px;
	overflow: hidden;
}

.channel_partner li a {
/* 	width: 100%; */
	text-decoration: none;
	display: block;
}

.channel_partner li b {
	width: 120px;
	height: 120px;
	display: table;
	margin-right: 15px;
	float: left;
	border: 1px solid #e2e2e2;
}

.channel_partner li span {
	font-size: 14px;
	color: #369;
}

.channel_partner li em:before {
	padding-right: 5px;
	content: '\e668';
	color: #999;
}

.channel_partner li b span {
	display: table-cell;
	vertical-align: middle;
	font-size: 14px;
	color: #369;
}

.btn_tj{
	border: 1px #e9491a solid;
 	width: 80px;
	height: 30px;
	border-radius:5px;
	background-color:#e9491a;
	line-height: 30px;
	font-size:15px; 
}

.div_acount{
	float: left;
	height: 100%;
}

.p1{
	margin-left:10px;
	padding-bottom: 10px;
}
.p2{
	font-size:16px;
	font-weight:700;
	margin-left:10px;
	padding-bottom: 10px;
}
.rzcss{
	display: block;
	width: 25%;
	float: left;
	margin-right: 5%;
	font-size: 12px;
}
.imgcss{
	width: 20px;
	height: 20px;
}
.input-xlarge{
	width: 120px;
}
</style>
</head>
<body>
		<div align="center">
			<form:form id="searchForm" modelAttribute="tAcountDtl" action="${ctx}/MyAcountDtl" method="post" class="breadcrumb form-search" style="background-color:#fff">
				<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
				<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
				<ul class="ul-form">
					<li><label>查询周期：</label>
						<form:select path="reserve1" class="input-xlarge " style="width:150px;">
							<form:option value="" label=""/>
							<form:options items="${fns:getDictList('cycleTime')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
						</form:select>
					</li>
					<li><label>金额类型：</label>
						<form:select path="tadType" class="input-xlarge " style="width:150px;">
							<form:option value="" label=""/>
							<form:options items="${fns:getDictList('tadType')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
						</form:select>
					</li>
					<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
					<li class="clearfix"></li>
				</ul>
			</form:form>
		</div>
		<div class="main-body">
			<div>
				<div class="channel_partner" id="keyword">
					<ul style="background-color: #f5f5f5">
						<li style="height: 35px;width: 100%;padding-bottom: 0px;">
							<p style="width: 20%;float: left;text-align: center;font-size: 16px;">金额类型</p>
							<p style="width: 20%;float: left;text-align: center;font-size: 16px;">来源方式</p>
							<p style="width: 20%;float: left;text-align: center;font-size: 16px;">支付时间</p>
							<p style="width: 20%;float: left;text-align: center;font-size: 16px;">金额数目</p>
							<p style="width: 20%;float: left;text-align: center;font-size: 16px;">操作</p>
						</li>
					</ul>
					<ul class="ul_add">
					<c:if test="${not empty page.list}">
						<c:forEach items="${page.list}" var="tAcountList"> 
							<li style="height: 30px;width: 100%">
									<p style="float:left;width: 20%;text-align: center">${fns:getDictLabel(tAcountList.tadType, 'tadType', '')}</p>
									<p style="float:left;width: 20%;text-align: center">${fns:getDictLabel(tAcountList.tadSourcetype, 'tadSourcetype', '')}</p>  
									<p style="float:left;width: 20%;text-align: center"><fmt:formatDate value="${tAcountList.createtime}" pattern="yyyy-MM-dd HH:mm:ss"/></p>
									<p style="float:left;width: 20%;text-align: center">${tAcountList.tadMoney}</p>
									<p style="float:left;width: 20%;" align="center">
										<a class="btn_tj" href="${ctx}/getproductdetail?id=${tAcountList.id}" style="color: #fff;">查看详情</a> 
									</p>
							</li>
						</c:forEach>
					</c:if>
					<c:if test="${empty page.list}">
						<li style="height: 30px;width: 100%;text-align: center;">亲，暂无数据哦！！！</li>
					</c:if>
					</ul>
				</div>
				<div class="pagination" style="text-align: center;display: block;">${page}</div>
				<script type="text/javascript">
					function page(n,s){
						location="${ctx}/MyproductList?pageNo="+n+"&pageSize="+s;
					}
					
					function showacountdtl(){
						$("#acountdtl").css("display","");						
					}
				</script>
			</div>
		</div>

</body>
</html>