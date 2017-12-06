<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<%@include file="/WEB-INF/views/modules/cms/front/include/head.jsp" %>
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

ol, ul {
	list-style: none;
}

.item-site {
	line-height: 35px;
}

.nav-bar {
	height: 35px;
	background: #f5f5f5;
}

.nav-item, .main-body {
	width: 100%;
	margin: 0 auto;
}

.nav-item-1 {
	margin-left:10%;
	float: left;
}

.nav-item .item-site {
	float: left;
}

.nav-item-2 {
	margin-right:10%;
	float: right;
}

.site-nav-item {
    float: left;
    margin-right: 7px;
    margin-left: 12px;
    cursor: auto;
    padding: 0 10px;
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
	color: #999;
}

.multi_options .tsm td {
	border: none;
	line-height: 30px;
	display: table-cell;
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
	padding: 5px 0 5px 0;
}

.multi_options td.sort_type_l {
	width: 75px;
	padding: 5px 5px 5px 10px;
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
	border: 1px solid #e1e1e1;
	background: #fff;
/* 	height: 80%; */
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

.item0{
	width: 100%;
	height: 140px;
	transition: opacity 0.3s ease-in-out:;
}

.item0:HOVER{
	box-shadow: #f5813d 0 0 7px;
	border-radius: 3px;
}

.item1{
	float: left;
	width: 400px;
}
.item2{
	float: right;
	width: 200px;
}
.p1{
	font-size: 20px;
	color: #000;
	font-weight: 700;
	margin: 20px 0 20px 13px;
}
.p2{
	font-size: 14px;
	color: #666;
    padding-bottom: 16px;
    margin-left: 13px;
}
.div_1{
	margin:20px 20px 0 0;
	font-size: 12px;
    color: #A8A8A8;
    padding-bottom: 30px;
    text-align: right;
}
.div_2{
	margin:20px 20px 0 0;
	font-size: 20px;
	color: red;
}
#fontsearch{
	font-size: 14px;
}
.search{
	position: absolute;
    width: 584px;
    height: 42px;
    border: 2px solid #FF552E;
    top: 40px;
    right: 250px;
}

#searchkey {
    line-height: 30px;
    margin-left: 20px;
    margin-top: 5px;
}

#key input {
    width: 440px;
    border: 0 none;
    font-size: 14px;
    height: 41px;
    line-height: 40px;
    border-radius:0;
}

#key input:focus{
	outline:0;
}
.searchbtn{
    position: absolute;
    display: inline-block;
    height: 42px;
    width: 80px;
    right: 0;
    top: 0;
    text-align: center;
    line-height: 42px;
    background: rgba(255,85,46,.9);
    filter: alpha(opacity=90);
    color: #fff;
    font-size: 16px;
}
</style>
<script type="text/javascript">
	$(function(){
		$(".sub_nav_1 a").eq(2).addClass("a1");
	})
	
	//查看详情
	function parttimejobDtl(id){
		window.location.href="${ctx}/parttimejobDtl?id="+id;		
	}
</script>
<script src="${ctxStatic}/reg-login/parttimejob.js"></script>
</head>
<body>
	<input type="hidden" id="ptjWorkarea" value="${tPartTimeJob.ptjWorkarea}">
	<input type="hidden" id="ptjCompanytype" value="${tPartTimeJob.ptjCompanytype}">
	<input type="hidden" id="ptjJstype" value="${tPartTimeJob.ptjJstype}">	

	<div class="nav-bar">
		<div class="nav-item">
			<ul class="nav-item-1">
				<li class="item-site">找合作，就上168米兔！</li>
			</ul>
			<ul class="nav-item-2">
				<c:if test="${empty fns:getUser().name}">
					<li class="item-site"><a class="site-nav-item" href="${pageContext.request.contextPath}/a">登录</a></li>
					<li class="item-site"><a class="site-nav-item" href="${pageContext.request.contextPath}/f/toreg">注册</a></li>
				</c:if>
				<c:if test="${not empty fns:getUser().name}">
					<li class="item-site"><a class="site-nav-item" href="${ctx}/mycenter"><img src="${pageContext.request.contextPath}/uploads/1/product/20171102/1509600625629_1509074477404.png" style="width: 30px;height: 30px;border-radius:15px;">${fns:getUser().name}</a></li>
					<li class="item-site"><a class="site-nav-item" href="${pageContext.request.contextPath}/a/logout">退出</a></li>
				</c:if>
			</ul>
		</div>
	</div>


	<div class="container" style="width: 80%">
		<!-- 搜索框位置 -->
		<div class="search"  align="center">
			<div id="serachkey">
				<span id="key">
					<input type="text" id="keyword1" class="keyword">
				</span>
			</div>
			<a href="#" class="searchbtn">搜职位</a>
		</div>
		
		<div class="main-body" style="margin-top: 80px;">
			<div>
				<div class="sub_nav">
					<a href="" class="a1">兼职信息</a> 
						<a href="${ctx}/postTask" class="apply_btn">免费发布兼职</a>
				</div>
				<div class="multi_options">
					<table id="fontsearch" class="tsm">
						<tbody>
							<tr>
								<td class="sort_type_l">工作区域</td>
								<td>
									<ul id="gzqy" class="cl">
										<li><a href="javascript:workarea('0')">全武汉</a></li>
										<li><a href="javascript:workarea('1')">武昌</a></li>
										<li><a href="javascript:workarea('2')">洪山</a></li>
										<li><a href="javascript:workarea('3')">黄陂</a></li>
										<li><a href="javascript:workarea('4')">江岸</a></li>
										<li><a href="javascript:workarea('5')">东西湖</a></li>
										<li><a href="javascript:workarea('6')">江汉</a></li>
										<li><a href="javascript:workarea('7')">蔡甸</a></li>
										<li><a href="javascript:workarea('8')">沌口开发区</a></li>
										<li><a href="javascript:workarea('9')">汉阳</a></li>
										<li><a href="javascript:workarea('10')">硚口</a></li>
										<li><a href="javascript:workarea('11')">江夏</a></li>
										<li><a href="javascript:workarea('12')">青山</a></li>
										<li><a href="javascript:workarea('13')">新洲</a></li>
										<li><a href="javascript:workarea('14')">汉南</a></li>
										<li><a href="javascript:workarea('15')">武汉周边</a></li>
									</ul>
								</td>
							</tr>
							<tr>
								<td class="sort_type_l">公司类型</td>
								<td>
									<ul id="gslx" class="cl a1">
										<li><a
											href="javascript:companytype('0')">不限</a></li>
										<li><a
											href="javascript:companytype('1')">个人</a></li>
										<li><a
											href="javascript:companytype('2')">职介代招</a></li>
										<li><a
											href="javascript:companytype('3')">公司</a></li>
									</ul>
								</td>
							</tr>
							<tr>
								<td class="sort_type_l">结算方式</td>
								<td>
									<ul id="jsfh" class="cl">
										<li><a
											href="javascript:jstype('0')">不限</a></li>
										<li><a
											href="javascript:jstype('1')">日结</a></li>
										<li><a
											href="javascript:jstype('2')">周结</a></li>
										<li><a
											href="javascript:jstype('3')">月结</a></li>
										<li><a
											href="javascript:jstype('4')">完工结算</a></li>
									</ul>
								</td>
							</tr>
						</tbody>
					</table>
				</div>

				<div class="channel_partner" id="keyword">
				<c:forEach items="${page.list}" var="job">
					<div class="item0" onclick="parttimejobDtl('${job.id}')">
						<div class="item1">
							<p class="p1">${job.ptjName}</p>
							<p class="p2">工作区域：${fns:getDictLabel(job.ptjWorkarea, 'workArea', '')}</p>
							<p class="p2">公司名称：${job.ptjCompanyname}</p>
						</div>
						<div class="item2">
							<div class="div_1">米兔</div>
							<div class="div_2" align="right">
								<span>${job.ptjPrice}</span>
								<span>|</span>
								<span>${fns:getDictLabel(job.ptjJstype, 'proJstype', '')}</span>
							</div>
						</div>
					</div>
				</c:forEach>
				
				</div>
				<div class="pagination" style="text-align: center;display: block;">${page}</div>
				<script type="text/javascript">
					function page(n,s){
						location="${ctx}/taskList?pageNo="+n+"&pageSize="+s;
					}
				</script>
			</div>
		</div>
		</div>
</body>
</html>