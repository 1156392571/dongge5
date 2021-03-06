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
	background: #e92a0b url() no-repeat
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
	width: 80px;
	height: 30px;
	border-radius:5px;
	background-color:#e9491a;
	line-height: 30px;
	font-size:15px; 
	margin-left: 155px;
}
.control-label{
	font-size: 14px;
	font-family:microsoft yahei !important; 
}

input:read-only{
	background-color: #fff;
}

.tab th{
	width: 100px;
	padding-right: 10px;
	text-align: right;
	font-weight: 400;
	font-size: 14px;
	margin-bottom: 5px;
}
</style>
<script type="text/javascript">
	function getpassword(){
		var orgpassword=$("#orgpassword").val();
		$.ajax({
			url:'${ctx}/checkpassword',
			type:'post',
			data:{orgpassword:orgpassword},
			success:function(data){
				if(data=="1"){
					//alert("原密码错误！");
					$("#√").css("display","none");
					$("#×").css("display","");
					$("#orgpassword").val("");
					$("#orgpassword").focus();
				}else{
					$("#√").css("display","");
					$("#×").css("display","none");
				}
			}
		})
	}
	
	function sub(){
		var newpassword=$("#newpassword").val();
		var confirmpassword=$("#confirmpassword").val();
		if(newpassword==confirmpassword){
			$.ajax({
				url:'${ctx}/resetpassword1',
				type:'post',
				data:{password1:newpassword},
				success:function(data){
					if(data=="1"){
						window.location.href="${ctx}/resetpassword";
					}else{
						slert("修改密码失败");
					}
				}
			})
		}else{
			alert("两次输入的密码不一样");
		}
	}
	
	
</script>
</head>
<body>
	<div>
		<h3 style="font-size: 18px;margin-left: 50px;">修改密码</h3>
		<hr style="height: 1px;color: #e7e7e7;width: 90%">
		<!-- 
		<div>
			<span style="width: 100px;">原密码：</span><input type="text" id="orgpassword" style="height: 30px;line-height: 30px;" onchange="getpassword()">
			<img id="√" src="${ctxStatic}/zui/img/duihao.png" style="height:20px;width:20px;;display:none">
			<img id="×" src="${ctxStatic}/zui/img/cuohao.png" style="height:20px;width:20px;;display:none">
			<br>
			新密码：<input type="text" id="newpassword" style="height: 30px;"><br>
			确认密码：<input type="text" id="confirmpassword" style="height: 30px;"><br>
			<input type="button" onclick="sub()" value="提交">
		</div>
		 -->
		 
		<div>
			<table class="tab">
				<tr>
					<th><span class="help-inline"><font color="red">*</font> </span>原密码</th>
					<td><input type="text" id="orgpassword" style="height: 30px;line-height: 30px;" onchange="getpassword()">
						<img id="√" src="${ctxStatic}/zui/img/duihao.png" style="height:20px;width:20px;;display:none">
						<img id="×" src="${ctxStatic}/zui/img/cuohao.png" style="height:20px;width:20px;;display:none">
					</td>
				</tr>
				<tr>
					<th><span class="help-inline"><font color="red">*</font> </span>新密码</th>
					<td><input type="text" id="newpassword" style="height: 30px;line-height: 30px;" onchange="getpassword()"></td>
				</tr>
				<tr>
					<th><span class="help-inline"><font color="red">*</font> </span>确认密码</th>
					<td><input type="text" id="confirmpassword" style="height: 30px;line-height: 30px;" onchange="getpassword()"></td>
				</tr>
				<tr>
					<td colspan="2">
					<button class="btn_tj" onclick="sub()" style="color: #fff;">保存</button>
					</td>
				</tr>
			</table>		
		</div>
		
	</div>
</body>
</html>