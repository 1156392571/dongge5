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

body, input, button, select, textarea {
	font: 14px/1.5 Tahoma, Helvetica, 'SimSun', sans-serif;
	color: #444;
}

a {
	color: #333;
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
	width: 1200px;
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

#content {
	width: 1200px;
	margin: 20px auto 0;
}

#content {
	position: relative;
	width: 1200px;
}

.new .left {
	width: 834px;
	float: left;
}

.new .b {
	margin-bottom: 28px;
}

.new .conthead {
	background: #fff;
	padding-top: 30px;
	position: relative;
	background: #f5f5f5;
}

.new .conthead {
	margin-bottom: 28px;
}

.new .info {
	padding: 32px 30px;
	position: relative;
}

.clearfix:after {
	content: ".";
	display: block;
	height: 0;
	clear: both;
	visibility: hidden;
}

.new .price {
	padding-top: 8px;
	color: #eee;
}

.new .price span {
	font-size: 18px;
	color: #ff552e;
	margin-top: -4px;
	vertical-align: middle;
	display: inline-block;
}

.new .dataDis {
	padding-top: 10px;
	color: #aaa;
}

.new .conthead .line {
	margin: 21px 0;
	border-bottom: 1px solid #f6f6f6;
}

.new .zpinfo {
	color: #aaa;
	padding-bottom: 10px;
}

.new .zpinfo li {
	height: 27px;
}

.loc i {
	width: 56px;
}

.loc i, .loc span {
	float: left;
}

.new .zpinfo li span {
	color: #000;
	padding-left: 20px;
}

.loc span {
	width: 698px;
}

.new .applyBtn {
	width: 280px;
	height: 46px;
	line-height: 46px;
	background: #ff552e;
	color: #fff;
	display: inline-block;
	text-align: center;
	text-decoration: none;
	font-size: 18px;
	margin-top: 14px;
}

.new .right {
	width: 340px;
	float: right;
}

.new .companyinfo {
	margin-bottom: 28px;
}

.new .companyinfo {
	background: #f5f5f5;
}

.new .compitem {
	padding: 32px 0 18px 30px;
	border-bottom: 1px solid #f6f6f6;
}

.compitem h2 {
	padding-right: 25px;
}

.right .compitem h2 a {
	color: #333;
	font-size: 18px;
	padding-right: 10px;
}

.new a {
	text-decoration: none;
	color: #000;
}

.new .compitem ul {
	list-style: none;
	color: #aaa;
}

.compitem .type {
	padding: 18px 0 14px 0;
	width: 290px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

.qygl {
	width: 280px;
	padding-top: 24px;
	padding-bottom: 20px;
	border-top: 1px solid #EEE;
}

.qygl span {
	background: #FFF7F1;
	border-radius: 2px;
	color: #EA8225;
	font-size: 12px;
	padding: 6px;
}

.new .gsjs2 ul li.b {
	float: left;
	padding-top: 28px;
	text-align: center;
	width: 167px;
	font-size: 12px;
	color: #aaa;
}

.gsjs2 ul li.b .gsjs2-l1 {
	font-size: 16px;
	color: #333;
	padding-bottom: 10px;
}

.new .gsjs2 ul li.xian {
	float: left;
	height: 30px;
	margin-top: 35px;
	border-right: 1px solid #e4e4e4;
}

.bq {
	margin-top: 24px;
}

.clearfix {
	zoom: 1;
}

.new .bq a {
	float: left;
	width: 47%;
	height: 22px;
	margin-bottom: 12px;
	font-size: 12px;
	color: #000;
}

.new .bq a i {
	热门搜索 padding-left: 10px;
	position: relative;
	top: -3px;
	left: -4px;
}

em, i {
	font-style: normal;
}

.new .padd {
	padding: 22px 30px 30px 30px;
	background: #f5f5f5;
}

.new .b {
	margin-bottom: 28px;
}

.new .b-tit {
	font-size: 18px;
	padding-bottom: 26px;
}

.new .b-gray {
	color: #aaa;
	font-size: 16px;
	margin-bottom: 12px;
	display: block;
}

.padd p {
	font-size: 14px;
	line-height: 26px;
}

.padd .shijian {
	font-size: 14px;
	line-height: 26px;
	margin-bottom: 12px;
	display: block;
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
	width: 20%;
	float: left;
	font-size: 14px;
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
}

.footer li a {
	font-size: 12px;
	color: #fff;
	font-weight: normal;
}

.footer_b a {
	color: #fff;
}
</style>
</head>
	<body>
		<div>
			<div class="nav-bar">
				<div class="nav-item">
					<ul class="nav-item-1">
						<li class="item-site">
							找合作，就上168米兔！
						</li>
					</ul>
					<ul class="nav-item-2">
						<!-- 
						<li class="item-site">
							<a class="site-nav-item" href="">登录</a>
						</li>
						<li class="item-site">
							<a class="site-nav-item" href="">注册</a>
						</li>
						 -->
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
			
			<div id="content" class="new clearfix">
			<div class="left">
				<div class="conthead">
					<div class="info">
						<div class="zw clearfix">
							<h1>${tPartTimeJob.ptjName}</h1>
						</div>
						<div class="price">
							<span>${tPartTimeJob.ptjPrice}</span>&nbsp;|&nbsp; 
							<span>${fns:getDictLabel(tPartTimeJob.ptjJstype, 'proJstype', '')}</span>
						</div>
						<div class="dataDis">
							更新：<span class="timeD">
							<fmt:formatDate value="${tPartTimeJob.createtime}" pattern="yyyy-MM-dd"/>
							</span> 浏览：<span class="browseD" id="totalcount">1人</span> 申请：<span class="deliverD" id="deliveryCount">0人</span>
						</div>
						<div class="line"></div>
						<div class="zpinfo">
							<ul>
								<li>
									<div class="loc">
										<i>招聘人数</i> <span>${tPartTimeJob.ptjNumber}人  </span>
									</div>
								</li>
								<li>
									<div class="loc">
										<i>有效期限</i> <span> 长期招聘 </span>
									</div>
								</li>
								<li>
									<div class="loc">
										<i>工作区域</i> <span> <a href="" class="black">${fns:getDictLabel(tPartTimeJob.ptjWorkarea, 'workArea', '')}</a></span>
									</div>
								</li>
								<li>
									<div class="loc">
										 <i>工作地址</i> <span>${tPartTimeJob.ptjAddress}</span> 							</div>
								</li>
							</ul>
							<a href="javascript:void(0);" class="applyBtn">申请职位</a>
		
						</div>
					</div>
				</div>
				<div class="xq b padd">
					<h2 class="b-tit">职位详情</h2>
					<span class="b-gray">工作时间</span>
					<span class="shijian">${tPartTimeJob.ptjWorktime}</span>
					<!-- 工作要求 -->
					<span class="b-gray">工作要求</span>
					<span class="shijian">${tPartTimeJob.ptjJobask}</span>
					<span class="b-gray">工作内容</span>
					<pre>${tPartTimeJob.ptjJobask}</pre>
					<span class="b-gray">职位描述</span>
					<pre>${tPartTimeJob.ptjJobask}</pre>
				</div>
				<div class="gs b padd">
					<div class="hide_more">
						<h2 class="b-tit">公司介绍</h2>
						<span class="b-gray">公司简介</span>
						<p class="wenan">${tPartTimeJob.ptjCompanyinfo}</p>
						<!-- 联系方式 -->
						<span class="b-gray">联系方式</span>
						<p class="wenan">
							${tPartTimeJob.ptjPhone}<br>
							${tPartTimeJob.ptjQq}
						</p>
						<div class="companySlide" id="companySlide" style="display: none;">
							<p>公司图片：</p>
							<div class="contList"></div>
							<div style="display: none;" class="rightmask"></div>
							<span style="display: none;" class="rightarrow" onfocus="this.blur()"></span>
							<div style="display: none;" class="leftmask"></div>
							<span style="display: none;" class="leftarrow" onfocus="this.blur()"></span>
						</div>
						<p></p>
					</div>
				</div>
			</div>
			<div class="right">
				<div class="companyinfo">
					<div class="compitem">
						<h2>
							 <a href="http://qy.58.com/50085287100690/" target="_blank" onclick="clickLog()">${tPartTimeJob.ptjCompanyname}</a>
							 <span class="comIcon"></span>
						</h2>
						<ul>
							<li class="type">${fns:getDictLabel(tPartTimeJob.ptjJstype, 'proJstype', '')}</li>
							<li class="number">100-499人</li>
						</ul>
						<div class="qygl"><span>企业招聘(已认证企业)</span></div>
						
						<div class="bq">
							<div class="clearfix">
								<a href="javascript:void(0);"><span class="yyzz iconfont"></span><i>普通企业认证</i></a>
							</div>
						</div>
					</div>
					<div class="gsjs2">
						<ul class="clearfix">
							<li class="b"><div class="gsjs2-l1" id="ResumeRecoveryRate">28%</div>简历查看率</li>
							<li class="xian"></li>
							<li class="b"><div class="gsjs2-l1">84天 </div>加入米兔</li>
						</ul>
					</div>
				</div>
				<!-- 优选职位 -->
		
			</div>
		</div>
			
			<div class="footer-bar">
			    <div class="footer">
			        <ul>
			            <li style="text-align:center;">下载BD沃客APP 找合作更方便<br>
			            <img src="/static/append/common/code_downapp.jpg"></li>
			        </ul>
			        <ul>
			            <li>用户帮助</li>
			            <li><a href="/misc.php?mod=faq" target="_blank">常见问题</a></li>
			            <li><a href="/portal.php?mod=topic&amp;topicid=1&amp;mode=7" target="_blank">联系我们</a></li>
			            <li><a href="/yiyehezuo/" target="_blank">BD加油站</a></li>
			        </ul>
			        <ul>
			            <li>商务合作</li>
			            <li><a href="/portal.php?mod=topic&amp;topicid=1&amp;mode=4" target="_blank">市场合作</a></li>
			            <li><a href="/portal.php?mod=topic&amp;topicid=1&amp;mode=5" target="_blank">合作伙伴</a></li>
			            <li><a href="/portal.php?mod=topic&amp;topicid=1&amp;mode=3" target="_blank">广告投放</a></li>
			        </ul>
			        <ul>
			            <li>关于我们</li>
			            <li><a href="/topic-about.html" target="_blank">BD沃客介绍</a></li>
			            <li><a href="/portal.php?mod=topic&amp;topicid=1&amp;mode=8" target="_blank">加入我们</a></li>
			            <li><a href="/portal.php?mod=topic&amp;topicid=1&amp;mode=2" target="_blank">免责声明</a></li>
			        </ul>
			        <ul class="a1">
			            <li style="text-align:center;">关注BD沃客微信公众号<br>
			            <img src="/static/append/common/code_wechat.png"></li>
			        </ul>
			    </div>
			    <div class="footer_b">
			    	<div>
			    		<div class="copyright">
						<a href="http://www.miitbeian.gov.cn/">粤ICP备12009483号-8</a>
						深圳市奥思网络科技有限公司版权所有
						</div>
			    	</div>
				</div>
			</div>
				
		</div>
</body>
</html>