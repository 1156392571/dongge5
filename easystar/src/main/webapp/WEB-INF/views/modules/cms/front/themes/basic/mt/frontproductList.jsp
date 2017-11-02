<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>产品中心</title>
	<meta name="decorator" content="cms_default_${site.theme}"/>
	<meta name="description" content="${category.description}" />
	<meta name="keywords" content="${category.keywords}" />
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

ol, ul {
	list-style: none;
}

.nav-bar {
	height: 35px;
	background: #f5f5f5;
	height: 35px;
}

.nav-item, .main-body {
	width: 100%;
	margin: 0 auto;
}

.nav-item-1 {
	float: left;
}

.nav-item .item-site {
	float: left;
}

.nav-item-2 {
	float: right;
}

.item-site {
	line-height: 35px;
}

.site-nav-item {
	float: left;
	margin-right: 7px;
	margin-left: 12px;
	cursor: auto;
	padding: 0 10px;
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
	border: 1px solid #e1e1e1;
	background: #fff;
}

.channel_partner li {
	width: 396px;
	height: 150px;
	padding: 15px;
	font-size: 12px;
	color: #666;
	display: inline-block;
	line-height: 22px;
	overflow: hidden;
}

.channel_partner li a {
	width: 100%;
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


.lireq{
	height: 35px;
	line-height: 35px;
}
</style>
</head>
<body>
	<div>
		<div class="main-body">
			<div>
				<div class="sub_nav">
					<a href="/forum-40-1.html" class="a1">合作信息</a> <a
						href="/member.php?mod=qudao_list">渠道商</a> <a
						href="/home.php?mod=spacecp&amp;ac=qudaoshang&amp;op=detail"
						class="apply_btn">申请渠道商入驻</a>
				</div>
				<div class="multi_options">
					<table id="fontsearch" class="tsm">
						<tbody>
							<tr>
								<td class="sort_type_l">产品类型</td>
								<td>
									<ul class="cl">
										<li class="a"><a
											href="/member.php?mod=qudao_list&amp;searchzylx=&amp;searchppss=&amp;searchtglx=&amp;searchcjhy=&amp;searchcjdq=&amp;searchjstj=&amp;searchzypp=&amp;searchkey=">不限</a></li>
										<li><a
											href="/member.php?mod=qudao_list&amp;searchzylx=1&amp;searchppss=&amp;searchtglx=&amp;searchcjhy=&amp;searchcjdq=&amp;searchjstj=&amp;searchzypp=&amp;searchkey=">软件</a></li>
										<li><a
											href="/member.php?mod=qudao_list&amp;searchzylx=2&amp;searchppss=&amp;searchtglx=&amp;searchcjhy=&amp;searchcjdq=&amp;searchjstj=&amp;searchzypp=&amp;searchkey=">游戏</a></li>
									</ul>
								</td>
							</tr>
							<tr>
								<td class="sort_type_l">排序规则</td>
								<td>
									<ul class="cl a1">
										<li class="a"><a
											href="/member.php?mod=qudao_list&amp;searchzylx=&amp;searchppss=&amp;searchtglx=&amp;searchcjhy=&amp;searchcjdq=&amp;searchjstj=&amp;searchzypp=&amp;searchkey=">不限</a></li>
										<li><a
											href="/member.php?mod=qudao_list&amp;searchzylx=&amp;searchppss=1&amp;searchtglx=&amp;searchcjhy=&amp;searchcjdq=&amp;searchjstj=&amp;searchzypp=&amp;searchkey=">由高到低</a></li>
										<li><a
											href="/member.php?mod=qudao_list&amp;searchzylx=&amp;searchppss=2&amp;searchtglx=&amp;searchcjhy=&amp;searchcjdq=&amp;searchjstj=&amp;searchzypp=&amp;searchkey=">由低到高</a></li>
										<li><a
											href="/member.php?mod=qudao_list&amp;searchzylx=&amp;searchppss=3&amp;searchtglx=&amp;searchcjhy=&amp;searchcjdq=&amp;searchjstj=&amp;searchzypp=&amp;searchkey=">发布时间</a></li>
									</ul>
								</td>
							</tr>
							<tr>
								<td class="sort_type_l">资料认证</td>
								<td>
									<ul class="cl">
										<li class="a"><a
											href="/member.php?mod=qudao_list&amp;searchzylx=&amp;searchppss=&amp;searchtglx=&amp;searchcjhy=&amp;searchcjdq=&amp;searchjstj=&amp;searchzypp=&amp;searchkey=">不限</a></li>
										<li><a
											href="/member.php?mod=qudao_list&amp;searchzylx=&amp;searchppss=&amp;searchtglx=1&amp;searchcjhy=&amp;searchcjdq=&amp;searchjstj=&amp;searchzypp=&amp;searchkey=">企业认证</a></li>
										<li><a
											href="/member.php?mod=qudao_list&amp;searchzylx=&amp;searchppss=&amp;searchtglx=2&amp;searchcjhy=&amp;searchcjdq=&amp;searchjstj=&amp;searchzypp=&amp;searchkey=">网站认证</a></li>
										<li><a
											href="/member.php?mod=qudao_list&amp;searchzylx=&amp;searchppss=&amp;searchtglx=3&amp;searchcjhy=&amp;searchcjdq=&amp;searchjstj=&amp;searchzypp=&amp;searchkey=">个人认证</a></li>
									</ul>
								</td>
							</tr>
							<tr>
								<td class="sort_type_l">结算条件</td>
								<td>
									<ul class="cl">
										<li class="a"><a
											href="/member.php?mod=qudao_list&amp;searchzylx=&amp;searchppss=&amp;searchtglx=&amp;searchcjhy=&amp;searchcjdq=&amp;searchjstj=&amp;searchzypp=&amp;searchkey=">不限</a></li>
										<li><a
											href="/member.php?mod=qudao_list&amp;searchzylx=&amp;searchppss=&amp;searchtglx=&amp;searchcjhy=&amp;searchcjdq=&amp;searchjstj=1&amp;searchzypp=&amp;searchkey=">日结</a></li>
										<li><a
											href="/member.php?mod=qudao_list&amp;searchzylx=&amp;searchppss=&amp;searchtglx=&amp;searchcjhy=&amp;searchcjdq=&amp;searchjstj=2&amp;searchzypp=&amp;searchkey=">周结</a></li>
											<li><a
											href="/member.php?mod=qudao_list&amp;searchzylx=&amp;searchppss=&amp;searchtglx=&amp;searchcjhy=&amp;searchcjdq=&amp;searchjstj=2&amp;searchzypp=&amp;searchkey=">月结</a></li>
									</ul>
								</td>
							</tr>
						</tbody>
					</table>
				</div>

				<div class="sort_head">
					<table cellspacing="0" cellpadding="0">
						<tbody>
							<tr>
								<td colspan="2">
									<div class="tf" style="float: left;">
										&nbsp;<a href="">默认排序</a>
										&nbsp;<a href="">入驻时间</a>
										&nbsp;<a href="" class="a1 ">好评率</a>
									</div>

								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="channel_partner" id="keyword">
					<ul>
						<c:forEach items="${page.list}" var="productList"> 
							<li style="height: 180px">
								<a href="#" > 
									<b><span>
									<img style="height: 160px;" src="${pageContext.request.contextPath}/${productList.proUrl}"></span></b>
								</a>
									<span>产品名称：${productList.proName}</span><br>
									<span>产品类型：${fns:getDictLabel(productList.proType, 'proType', '')}</span><br>  
									<span>产品价格：${productList.proPrice}</span><br>
									<span>结算方式：${fns:getDictLabel(productList.proJstype, 'proJstype', '')}</span><br>
									<span>认证方式：${fns:getDictLabel(productList.proRztype, 'proRztype', '')}</span><br>
									<span>发布时间：<fmt:formatDate value="${productList.createtime}" pattern="yyyy-MM-dd HH:mm:ss"/></span><br>
									<span>
										<img src="${ctxStatic}/zui/img/company.png" title="123">
										<img src="${ctxStatic}/zui/img/www.png">
										<img src="${ctxStatic}/zui/img/phone.png">
										<img src="${ctxStatic}/zui/img/wx.png">
									</span><br>
								
							</li>
						</c:forEach>
					</ul>
				</div>
				<div class="pagination" style="text-align: center;display: block;">${page}</div>
				<script type="text/javascript">
					function page(n,s){
						location="${ctx}/productList?pageNo="+n+"&pageSize="+s;
					}
				</script>
			</div>
		</div>
	</div>
</body>
</html>