<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/head.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>米兔首页</title>
<style>
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


.multi_options {
	margin: 0 0 10px;
	padding: 8px 10px 5px 8px;
	padding-bottom: 10px\9;
	background: #fff;
	font-size: 14px;
	box-shadow: #e7e7e7 0 0 5px;
}

table {
	width: 100%;
	table-layout: fixed;
	border-collapse: separate;
}

.sort_type td.sort_type_l {
	width: 75px;
	padding: 5px 0 0 10px;
	color: #999;
}

.multi_options .tsm td {
	border: none;
	vertical-align: top;
	line-height: 30px;
	display: table-cell;
	padding: 5px 0;
}

.multi_options td ul.cl {
	height: 30px;
	overflow: hidden;
	zoom: 1;
}

.tsm li {
	float: left;
	white-space: nowrap;
	margin-right: 12px;
	padding: 0 3px;
}

.multi_options td.sort_type_l {
	width: 75px;
	padding: 5px 0 0 10px;
	color: #999;
}

.multi_options td li.a a {
	background: #e85220;
	padding: 3px 6px;
	font-weight: normal;
	color: #fff;
}

.multi_options td span i {
	line-height: 30px;
	padding-right: 10px;
	float: right;
	cursor: pointer;
	font-size: 12px;
	color: #999;
}

i {
	font-style: normal;
}

.sort_head {
	padding-right: 20px;
	border: 1px solid #e1e1e1;
	border-bottom: none;
	background: #f5f5f5;
	line-height: 35px;
}

.sort_head .tf a {
	float: left;
	padding: 0 30px 0 20px;
	border-right: 1px solid #e1e1e1;
}

.sort_head .tf a, .channel_partner li em {
	font-family: ZenIcon;
	font-size: 14px;
	font-style: normal;
	font-weight: 400;
	font-variant: normal;
	text-transform: none;
	speak: none;
	-webkit-font-smoothing: antialiased;
}

.sort_head .tf a:after {
	content: '\e6bd';
	padding-left: 3px;
}

.channel_partner {
	border-bottom: 1px solid #e1e1e1;
	background: #fff;
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

.sub_nav {
	display: block;
	border-bottom: 1px solid #e9491a;
}

.sub_nav a {
	margin-bottom: -1px;
	padding: 0 25px;
	border: 1px solid #f2b19c;
	background: #f9ede1;
	border-bottom: none;
	line-height: 35px;
	font-size: 16px;
	display: inline-block;
}

.sub_nav a.a1 {
	border: 1px solid #e9491a;
	color: #fff;
	background: #e9491a;
	font-weight: 700;
}

a.apply_btn {
	width: 180px;
	padding: 0 30px 0 20px;
	float: right;
	border-radius: 3px;
	border: none;
	background: #e92a0b url(/static/append/common/icon_common.png) no-repeat
		180px -438px;
	color: #fff;
	text-align: center;
	font-size: 14px;
}

.lireq{
	height: 35px;
	line-height: 35px;
}
.btn_tj{
	border: 1px #e9491a solid;
 	width: 50px;
	height: 30px;
	border-radius:5px;
	background-color:#e9491a;
	line-height: 30px;
	font-size:15px; 
}
/*
给li标签加上样式效果
*/
.ul_add li{
	transition: opacity 0.3s ease-in-out:;
}

.ul_add li:hover{
	box-shadow: #f5813d 0 0 7px;
	border-radius: 3px;
}
</style>
<script type="text/javascript">
$(function(){
	$(".sub_nav_1 a").eq(0).addClass("a1");
})
</script>
<script src="${ctxStatic}/reg-login/product.js"></script>
</head>
<body>
	<div>
		<div class="main-body">
			<div>
				<div class="channel_partner" id="keyword">
					<ul style="background-color: #f5f5f5">
						<li style="height: 30px;width: 100%;padding-bottom: 0px;">
							<p style="width: 10%;float: left;text-align: center;font-size: 16px;">图片</p>
							<p style="width: 10%;float: left;text-align: center;font-size: 16px;">产品名称</p>
							<p style="width: 10%;float: left;text-align: center;font-size: 16px;">产品类型</p>
							<p style="width: 10%;float: left;text-align: center;font-size: 16px;">产品价格</p>
							<p style="width: 10%;float: left;text-align: center;font-size: 16px;">结算方式</p>
							<p style="width: 10%;float: left;text-align: center;font-size: 16px;">认证方式</p>
							<p style="width: 20%;float: left;text-align: center;font-size: 16px;">联系方式</p>
							<p style="width: 10%;float: left;text-align: center;font-size: 16px;">发布时间</p>
							<p style="width: 10%;float: left;text-align: center;font-size: 16px;">操作</p>
						</li>
					</ul>
					<ul class="ul_add">
						<c:forEach items="${page.list}" var="productList"> 
							<li style="height: 30px;width: 100%">
									<p style="float:left; width: 10%;text-align: center">
										<img style="width: 30px;height: 30px" src="${pageContext.request.contextPath}/${productList.proUrl}">
									</p>
									<p style="float:left; width: 10%;text-align: center">${productList.proName}</p>
									<p style="float:left;width: 10%;text-align: center">${fns:getDictLabel(productList.proType, 'proType', '')}</p>  
									<p style="float:left;width: 10%;text-align: center">${productList.proPrice}</p>
									<p style="float:left;width: 10%;text-align: center">${fns:getDictLabel(productList.proJstype, 'proJstype', '')}</p>
									<p style="float:left;width: 10%;text-align: center">${fns:getDictLabel(productList.proRztype, 'proRztype', '')}</p>
									<p style="float:left;width: 20%;text-align: center">
										<img src="${ctxStatic}/zui/img/company.png" title="${productList.proReserve1}">
										<img src="${ctxStatic}/zui/img/www.png" title="${productList.proReserve2}">
										<img src="${ctxStatic}/zui/img/phone.png" title="${productList.proReserve4}">
										<img src="${ctxStatic}/zui/img/wx.png" title="${productList.proReserve3}">
									</p>
									<p style="float:left;width: 10%;text-align: center"><fmt:formatDate value="${productList.createtime}" pattern="yyyy-MM-dd HH:mm:ss"/></p>
									<p style="float:left;width: 10%;" align="center">
										<a class="btn_tj" href="${ctx}/getproductdetail?id=${productList.id}" style="color: #fff;">查看</a> 
									</p>
							</li>
						</c:forEach>
					</ul>
				</div>
				<div class="pagination" style="text-align: center;display: block;">${page}</div>
				<script type="text/javascript">
					function page(n,s){
						location="${ctx}/MyproductList?pageNo="+n+"&pageSize="+s;
					}
				</script>
			</div>
		</div>
	</div>
</body>
</html>