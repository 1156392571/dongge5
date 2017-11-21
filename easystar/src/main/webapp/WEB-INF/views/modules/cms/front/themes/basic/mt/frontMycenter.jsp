<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<%@include file="/WEB-INF/views/modules/cms/front/include/head.jsp" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
body {
	background: #f7f7f7;
	font-family: microsoft yahei !important;
}

a {
	color: #333;
	text-decoration: none;
}

a:HOVER{
	text-decoration: none;
}
.footer {
	width: 1200px;
	margin: 0 auto;
	padding: 20px 0;
	font-size: 12px;
	color: #fff;
	line-height: 35px;
	font-weight: 700;
	overflow: hidden;
}

.footer ul {
	width: 15%;
	float: left;
	font-size: 14px;
	list-style-type: none
}

.footer-bar {
	width: 100%;
	background: #444;
}

.footer_b {
	width: 100%;
	background: #1e1e1e;
	line-height: 40px;
	color: #fff;
	text-align: center;
	padding-bottom: 12px;
}

.footer li a {
	font-size: 12px;
	color: #fff;
	font-weight: normal;
}

.footer_b a {
	color: #fff;
}

ol, ul {
	list-style: none;
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


.lireq {
	height: 35px;
	line-height: 35px;
}

.head_ul {
	width: 100%;
	background-color: #fff;
	box-shadow: #e7e7e7 0 1px 3px;
	border-bottom: 1px solid rgb(231, 231, 231);
	margin-bottom: 10px;
}

.sub_nav_1 {
	padding-top:50px;
	width:80%;
	margin-left:10%;
	display: block;
}

.sub_nav_1 a {
	margin-bottom: -1px;
	padding: 0 25px;
	border-bottom: thin;
	line-height: 35px;
	font-size: 16px;
	display: inline-block;
}
.sub_nav_1 a:hover{
	border-bottom: 1px red solid;
}

.sub_nav_1 a.a1 {
	border: 1px solid #e9491a;
	color: #fff;
	background: #e9491a;
	font-weight: 700;
}

a.apply_btn_1 {
	width: 100px;
	padding: 0 10px 0 10px;
	float: right;
	border-radius: 3px;
	border: none;
	background: #e92a0b url(/static/append/common/icon_common.png) no-repeat
		180px -438px;
	color: #fff;
	text-align: center;
	font-size: 14px;
}

.leftinfo{
	border: 1px solid #e7e7e7;
	background-color:#fff;
	width:15%;
	height: 100%;
	float: left;
}

.service-bd{
	width: 100%;
	height:100%;
	margin: 0;
}

.service-bd li{
	font-size: 16px;
	text-align: center;
	width: 100%;
	height: 60px;;
	text-align: center;
	line-height: 60px;
}
.contentright{
	margin-left:1%;
	float: right;
	width: 83%;
	height: 100%;
	background-color:#fff;
	border: 1px solid #e7e7e7;
}
.service-bd li.a1 {
	color: red;
}
.cp{
cursor: pointer;
}
</style>
</head>
<body>
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
	<div class="head_ul">
		<div class="sub_nav_1">
			<a href="${ctx}/productList" >找产品</a> 
			<a href="${ctx}/taskList" >找任务</a>
			<a href="${ctx}/dbplatformList" >找担保</a>
			<a href="javascript:void(0)" >担保简介</a>
			<a href="javascript:void(0)" >关于我们</a>
			<a href="javascript:void(0)" class="a1">个人中心</a>
			<a href="" class="apply_btn_1">合作快速通道</a>
		</div>
	</div>
	<script type="text/javascript">
		$(function(){
			$('.sub_nav_1 a').click(function () { $(this).addClass('a1').siblings().removeClass('a1') })
			$('.service-bd li').click(function () { $(this).addClass('a1').siblings().removeClass('a1') })
		})
		function t0(){
			$("#iframe").attr("src","${ctx}/Mydatasource");
		}
		function t1(){
			$("#iframe").attr("src","${ctx}/MyproductList");
		}
		function t2(){
			$("#iframe").attr("src","${ctx}/MytaskList");
		}
		function t3(){
			$("#iframe").attr("src","${ctx}/MytaskBypostedList");
		}
		function t4(){
			$("#iframe").attr("src","${ctx}/MytaskorderList");
		}
	</script>
	
	
	
	<div class="container" style="width: 80%">
		<div class="content" style="width: 100%;height: 60%;">
<!-- 			<sitemesh:body/> -->
			<div class="leftinfo" data-spm-ab="main" data-spm-ab-max-idx="48">
				<ul class="service-bd" role="menubar">
					<li data-closeper="" aria-label="查看更多" role="menuitem"
						aria-haspopup="true" data-groupid="106" class="J_Cat a-all">
						<span class="cp">账号管理</span></li>
					<li data-closeper="" aria-label="查看更多" role="menuitem"
						aria-haspopup="true" data-groupid="101" class="J_Cat a-all">
						<span class="cp" onclick="t0()">个人资料</span></li>
					<li data-closeper="" aria-label="查看更多" role="menuitem"
						aria-haspopup="true" data-groupid="102" class="J_Cat a-all">
						<span class="cp" onclick="t1()">我发布的产品</span></li>
					<li data-closeper="" aria-label="查看更多" role="menuitem"
						aria-haspopup="true" data-groupid="103" class="J_Cat a-all">
						<span class="cp" onclick="t2()">我发布的任务</span></li>
					<li data-closeper="" aria-label="查看更多" role="menuitem"
						aria-haspopup="true" data-groupid="104" class="J_Cat a-all">
						<span class="cp" onclick="t3()">我的任务审核</span></li>
					<li data-closeper="" aria-label="查看更多" role="menuitem"
						aria-haspopup="true" data-groupid="105" class="J_Cat a-all">
						<span class="cp" onclick="t4()">我申请过的任务</span></li>
				</ul>
			</div>
			<div class="contentright" data-spm-ab="main" data-spm-ab-max-idx="48">
				<iframe id="iframe" style="width: 100%;height: 100%;overflow: hidden;border: 0;" >
				
				</iframe>
			</div>
		</div>
		<hr style="margin:20px 0 10px;">
		<footer>
			<!-- ====这是新新加的底部 -->
			<div class="footer-bar">
			<div class="footer">
				<ul>
					<li style="text-align: center;">找合作下载米兔APP更方便<br> 
					<img src="${ctxStatic}/zui/img/metoo.png" style="width: 110px;height: 110px;"></li>
				</ul>
				<ul>
					<li>用户帮助</li>
					<li class="lireq"><a href="/misc.php?mod=faq" target="_blank">常见问题</a></li>
					<li class="lireq"><a href="/portal.php?mod=topic&amp;topicid=1&amp;mode=7"
						target="_blank">联系我们</a></li>
					<li class="lireq"><a href="/yiyehezuo/" target="_blank">BD加油站</a></li>
				</ul>
				<ul>
					<li>商务合作</li>
					<li class="lireq"><a href="/portal.php?mod=topic&amp;topicid=1&amp;mode=4"
						target="_blank">市场合作</a></li>
					<li class="lireq"><a href="/portal.php?mod=topic&amp;topicid=1&amp;mode=5"
						target="_blank">合作伙伴</a></li>
					<li class="lireq"><a href="/portal.php?mod=topic&amp;topicid=1&amp;mode=3"
						target="_blank">广告投放</a></li>
				</ul>
				<ul>
					<li>关于我们</li>
					<li class="lireq"><a href="/topic-about.html" target="_blank">米兔介绍</a></li>
					<li class="lireq"><a href="/portal.php?mod=topic&amp;topicid=1&amp;mode=8"
						target="_blank">加入我们</a></li>
					<li class="lireq"><a href="/portal.php?mod=topic&amp;topicid=1&amp;mode=2"
						target="_blank">免责声明</a></li>
				</ul>
				<ul class="a1">
					<li style="text-align: center;">关注米兔微信公众号<br>
					<img src="${ctxStatic}/zui/img/metoo.png" style="width: 110px;height: 110px;"></li>
				</ul>
			</div>
			<div class="footer_b">
				<span style="float: left">Copyright © 2017, 版权所有 <a href="http://www.167mitu.com/">metoo.com</a>
				沪ICP备14053992号-2 </span>
				<span style="float: right;margin-right: 50px;">${fns:getDate('yyyy年MM月dd日 E')}</span>
				<br> <a key="5975a14b2548be7a81d18924"
					logo_size="83x30" logo_type="realname"
					href="https://v.pinpaibao.com.cn/authenticate/cert/?site=www.bdwork.com&amp;at=realname"
					target="_blank"><script
						src="//static.anquan.org/static/outer/js/aq_auth.js"
						type="text/javascript"></script><b id="aqLogoJHSOQ"
					style="display: none;"></b><img
					src="//static.anquan.org/static/outer/image/sm_83x30.png?id=www.bdwork.com?t=7"
					alt="安全联盟认证" width="83" height="30" style="border: none;"></a> <a
					id="___szfw_logo___"
					href="https://credit.szfw.org/CX20170816035602590333.html"
					target="_blank"><img src="http://icon.szfw.org/sf.png"
					border="0" style="height: 35px;"></a>
				<script type="text/javascript">(function(){document.getElementById('___szfw_logo___').oncontextmenu = function(){return false;}})();</script>
				<a id="___szfw_logo___"
					href="https://credit.szfw.org/CX20170816035602200918.html"
					target="_blank"><img src="http://icon.szfw.org/silver.jpg"
					border="0" style="height: 35px;"></a>
				<script type="textjavascript">(function(){document.getElementById('___szfw_logo___').oncontextmenu = function(){return false;}})();</script>
			</div>
		</div>
		
			<!-- 
			<div class="footer_nav"><a href="${ctx}/guestbook" target="_blank">公共留言</a> | <a href="${ctx}/search" target="_blank">全站搜索</a> | <a href="${ctx}/map-${site.id}${fns:getUrlSuffix()}" target="_blank">站点地图</a> | <a href="mailto:thinkgem@163.com">技术支持</a> | <a href="${pageContext.request.contextPath}${fns:getAdminPath()}" target="_blank">后台管理</a></div>
			<div class="pull-right">${fns:getDate('yyyy年MM月dd日 E')}</div><div class="copyright">${site.copyright}</div>
      		 -->
      	</footer>
    </div> <!-- /container -->
</body>
</html>