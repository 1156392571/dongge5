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
.ul_add li{
	transition: opacity 0.3s ease-in-out:;
}

.ul_add li:hover{
	box-shadow: #f5813d 0 0 7px;
	border-radius: 3px;
}
.table th, .table td{
			text-align: center
		}
		
	.btn_tj{
	border: 1px #e9491a solid;
	width: 80px;
	height: 35px;
	border-radius:5px;
	background-color:#e9491a;
	line-height: 35px;
	font-size:15px; 
	color: #fff;cursor:pointer;text-align: center;
}
.input-xlarge{
	width: 200px;
	height: 30px;
	line-height: 30px;
	border-radius:5px;
	font-size: 16px;
	border: 1px #c7bebe solid
}
</style>
<script type="text/javascript">
$(function(){
	$(".sub_nav_1 a").eq(3).addClass("a1");
})

//提交申请
function handup(){
	var dbJfuserid=$("#dbJfuserid").val();
	var dbJfphone=$("#dbJfphone").val();
	var dbYfuserid=$("#dbYfuserid").val();
	var dbYfphone=$("#dbYfphone").val();
	var dbIfhasht=$('input[name="dbIfhasht"]:checked').val();
	var dbIfhasyh=$('input[name="dbIfhasyh"]:checked').val();
	var dbType=$("#dbType").val();
	window.location.href="${ctx}/dbsubmit?dbJfuserid="+dbJfuserid+"&dbJfphone="+dbJfphone
	+"&dbYfuserid="+dbYfuserid+"&dbYfphone="+dbYfphone+"&dbIfhasht="+dbIfhasht
	+"&dbIfhasyh="+dbIfhasyh+"&dbType="+dbType+"&dbStatus=1";
}
</script>
</head>
<body>
<!-- =================遮罩部分============================ -->
<div class="modal fade" tabindex="-1" role="dialog" id="myModal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <div class="modal-title" style="text-align: center;font-size: 16px;color: #0064ff">提交申请</div>
      </div>
      <div class="modal-body" style="text-align: center;">
        <input class="input-xlarge" placeholder="甲方昵称" id="dbJfuserid" /><br><br>
        <input class="input-xlarge" placeholder="甲方电话" id="dbJfphone" /><br><br>
        <input class="input-xlarge" placeholder="乙方昵称" id="dbYfuserid" /><br><br>
        <input class="input-xlarge" placeholder="乙方电话" id="dbYfphone" /><br><br>
        有无合同：<input type="radio" name="dbIfhasht" value="1" checked="checked"/>无<input type="radio" name="dbIfhasht" value="2"/>有<br><br>
        是否约好：<input type="radio" name="dbIfhasyh" value="1" checked="checked"/>否<input type="radio" name="dbIfhasyh" value="2"/>是<br><br>
		担保类型：<select id="dbType" style="width: 100px">
				  		<option value="1">11</option>
				  		<option value="2">22</option>
				  		<option value="3">33</option>
				  </select><br><br>
		<span style="color:#e9491a ">温馨提示：提交后请保持手机畅通，稍后我们工作人员会与您联系！</span>
      </div>
      <div class="modal-footer" style="text-align: center">
        <button type="button" class="btn btn-primary" onclick="handup()">提交</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!-- ============================================= -->
<div style="padding-top:20px;text-align: center;font-size: 18px">
	诚服担保
</div>
<div style="padding-top:20px;text-align: center;">
	<div style="font-size: 18px;float: left;margin-left: 44%">
		<span style="font-size: 50px">8000</span>
	</div>
	<div class="btn_tj" style="float: right;" data-toggle="modal" data-target="#myModal">申请</div>
</div>
<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>会员昵称（甲方）</th>
				<th>甲方联系方式</th>
				<th>会员昵称（乙方）</th>
				<th>乙方联系方式</th>
				<th>状态</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${list}" var="tDbPlatform">
			<tr>
				<td>
					${tDbPlatform.dbJfuserid}
				</td>
				<td>
					${fn:substring(tDbPlatform.dbJfphone, 0, 3)}****${fn:substring(tDbPlatform.dbJfphone, 7, 11)}
				</td>
				<td>
					${tDbPlatform.dbYfuserid}
				</td>
				<td>
					${fn:substring(tDbPlatform.dbYfphone, 0, 3)}****${fn:substring(tDbPlatform.dbYfphone, 7, 11)}
				</td>
				<td>
					${fns:getDictLabel(tDbPlatform.dbStatus, 'dbStatus', '')}
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</body>
</html>