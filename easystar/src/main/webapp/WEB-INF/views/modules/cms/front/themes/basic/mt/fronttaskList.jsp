<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>米兔首页</title>
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
/*
给li标签加上样式效果
*/
/* .ul_add li{ */
/* 	transition: opacity 0.3s ease-in-out:; */
/* } */

/* .ul_add li:hover{ */
/* 	box-shadow: #f5813d 0 0 7px; */
/* 	border-radius: 3px; */
/* } */

.btn_tj{
	float:left;
	border: 1px #e9491a solid;
	width: 50px;
	height: 30px;
	border-radius:5px;
	background-color:#e9491a;
	line-height: 30px;
	font-size:15px; 
}

</style>
<script type="text/javascript">
	$(function(){
		$(".sub_nav_1 a").eq(1).addClass("a1");
	})
</script>
<script src="${ctxStatic}/reg-login/task.js"></script>
</head>
<body>
	<div>
		<input type="hidden" id="tasktype" value="${tTask.taskType}">
		<input type="hidden" id="pxrule" value="${tTask.taskReserve1}">
		<input type="hidden" id="rztype" value="${tTask.taskRztype}">
		<div class="main-body">
			<div>
				<div class="sub_nav">
					<a href="" class="a1">任务信息</a> <a
						href="">渠道商</a> <a
						href="${ctx}/postTask" class="apply_btn">免费发布任务</a>
				</div>
				<div class="multi_options">
					<table id="fontsearch" class="tsm">
						<tbody>
							<tr>
								<td class="sort_type_l">任务类型</td>
								<td>
									<ul id="cplx" class="cl">
										<li><a href="javascript:tasktype('0')">不限</a></li>
										<li><a href="javascript:tasktype('1')">CPA</a></li>
										<li><a href="javascript:tasktype('2')">CPS</a></li>
										<li><a href="javascript:tasktype('3')">地推</a></li>
									</ul>
								</td>
							</tr>
							<tr>
								<td class="sort_type_l">排序规则</td>
								<td>
									<ul id="pxgz" class="cl a1">
										<li><a
											href="javascript:pxrule('0')">不限</a></li>
										<li><a
											href="javascript:pxrule('1')">有效时间</a></li>
										<li><a
											href="javascript:pxrule('2')">由高到低</a></li>
										<li><a
											href="javascript:pxrule('3')">由低到高</a></li>
										<li><a
											href="javascript:pxrule('4')">发布时间</a></li>
									</ul>
								</td>
							</tr>
							<tr>
								<td class="sort_type_l">资料认证</td>
								<td>
									<ul id="zlrz" class="cl">
										<li><a
											href="javascript:rztype('0')">不限</a></li>
										<li><a
											href="javascript:rztype('1')">企业认证</a></li>
										<li><a
											href="javascript:rztype('2')">网站认证</a></li>
										<li><a
											href="javascript:rztype('3')">个人认证</a></li>
									</ul>
								</td>
							</tr>
						</tbody>
					</table>
				</div>

				<div class="channel_partner" id="keyword">
					<ul style="background-color: #f5f5f5">
						<li style="height: 30px;width: 100%;padding-bottom: 0px;">
							<p style="width: 8%;float: left;text-align: center;font-size: 16px;">会员昵称</p>
							<p style="width: 10%;float: left;text-align: center;font-size: 16px;">任务名称</p>
							<p style="width: 7%;float: left;text-align: center;font-size: 16px;">任务单价</p>
							<p style="width: 10%;float: left;text-align: center;font-size: 16px;">任务类型</p>
							<p style="width: 5%;float: left;text-align: center;font-size: 16px;">认证方式</p>
							<p style="width: 10%;float: left;text-align: center;font-size: 16px;">任务数量</p>
							<p style="width: 10%;float: left;text-align: center;font-size: 16px;">做单要求</p>
							<p style="width: 10%;float: left;text-align: center;font-size: 16px;">做单技巧</p>
							<p style="width: 10%;float: left;text-align: center;font-size: 16px;">联系方式</p>
							<p style="width: 10%;float: left;text-align: center;font-size: 16px;">发布时间</p>
							<p style="width: 10%;float: left;text-align: center;font-size: 16px;">操作</p>
						</li>
					</ul>
					<ul class="ul_add">
						<c:forEach items="${page.list}" var="taskList"> 
							<li style="height: 30px;width: 100%">
									<p style="float:left; width: 8%;text-align: center">${taskList.taskUserid}</p>
									<p style="float:left; width: 10%;text-align: center">${taskList.taskName}</p>
									<p style="float:left;width: 7%;text-align: center">${taskList.taskPrice}</p>  
									<p style="float:left;width: 10%;text-align: center">${fns:getDictLabel(taskList.taskType, 'taskType', '')}</p>
									<p style="float:left;width: 5%;text-align: center">${fns:getDictLabel(taskList.taskRztype, 'taskRztype', '')}</p>
									<p style="float:left;width: 10%;text-align: center">${taskList.taskAmount}</p>
									<p style="float:left;width: 10%;text-align: center;" title="${taskList.taskAsk}">${fns:abbr(taskList.taskAsk,20)}</p>
									<p style="float:left;width: 10%;text-align: center">${taskList.taskSkill}</p>
									<p style="float:left;width: 10%;text-align: center">
										<img src="${ctxStatic}/zui/img/phone.png" title="${taskList.taskPhone}">
										<img style="width:22px ;height:22px;" src="${ctxStatic}/zui/img/qq.png" title="${taskList.taskQq}">
									</p>
									<p style="float:left;width: 10%;text-align: center"><fmt:formatDate value="${taskList.createtime}" pattern="yyyy-MM-dd HH:mm:ss"/></p>
									<p style="float:left;width: 10%;text-align: center">
										<a class="btn_tj" href="" style="margin-left: 20px;color: #fff">申请</a> 
										<a class="btn_tj" href="" style="margin-left: 10px;color: #fff">交单</a> 
									</p>
							</li>
						</c:forEach>
					</ul>
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