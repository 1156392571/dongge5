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

.photo{
	width: 540px;
	height: 860px;
	border-radius:5px;
/* 	background-color: rgba(206, 198, 129, 0.52); */
	background-color:#f1efef;
}

.dl_1{
	width:500px;
	height:150px;
	margin-top: 10px;
	margin-left:20px;
	margin-right:20px;
	box-shadow: #94927d 0 0 7px;
	background-color: #f7f6ed;
/* 	border: 1px #94927d solid; */
	border-radius:10px;
}

.dl_4{
	width:500px;
	height:300px;
	margin-top: 20px;
	margin-left:20px;
	margin-right:20px;
	box-shadow: #94927d 0 0 7px;
	background-color: #f7f6ed;
/* 	border: 1px #94927d solid; */
	border-radius:10px;
}

.dl_2{
	width:500px;
	height:100px;
	margin-top: 10px;
	margin-left:20px;
	margin-right:20px;
	box-shadow: #94927d 0 0 7px;
	background-color: #f7f6ed;
	border-radius:10px;
}

.dl_3{
	width:500px;
	height:130px;
	margin-top: 30px;
	margin-left:20px;
	margin-right:20px;
	box-shadow: #94927d 0 0 7px;
	background-color: #f7f6ed;
	border-radius:10px;
}
</style>
<script src="${ctxStatic}/reg-login/product.js"></script>
</head>
<body>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
	<div class="photo">
		<div class="dl_0" style="height: 200px;">
			<img  src="${ctxStatic}/zui/img/1.jpg" style="width: 100%;height: 100%">
		</div>
		<div class="dl_1">
		大盘概述：<br>&nbsp;&nbsp;&nbsp;&nbsp;今日两市股指常规开盘，之后沪指在两桶油的带动下不断走高，而小盘股一定调整；午后股指以横盘整理为主，两点后创业板崛起，至收盘呈单边上扬走势。盘面热点：石油、保险、钢铁、银行、券商、运输设备可燃冰、页岩气、聚氨酯等板块表现良好。截止收盘上证收报3413.57点，涨25.4点，涨幅0.75%，深成指收11467.97点，涨94.23点，涨幅0.83%，创业板收1859.07点，涨8.77点，涨幅0.47%。两市合计成交5257.62亿元。较前一日明显放大
		</div>
		<div class="dl_4">
		市场点评：<br>&nbsp;&nbsp;&nbsp;&nbsp;
全天看，大盘高开高走，延续昨日以来的良好表现。盘面上，金融股领衔下的蓝筹股表现抢眼，带领指数震荡上行，而资源股连日表现，短期有重新复苏迹象。倒是题材股表现分化，题材出市场的跷跷板效应；消息上，中兴通讯参与建造欧洲首个5G网络，海外市场加速突破。基本面良好，未来业绩贡献明显，市面上一些大蓝筹持续性值得期待；技术面，指数突破多条均线压制，指标也呈现好转，成交小幅释放，但做多力量并不强势，短期不能继续释放成交量下或有反复。总体上，上周连续调整之际，市场看空声音叠出，而连续上攻之后，市场又呈现出强势格局。实际上，在大环境向好下，指数总体上行趋势并未发生较大改变，大市值的大蓝筹仍是绝对核心，对大盘的支撑较为稳固，只不过短期有分化迹象，而部分二线蓝筹股的崛起，也和三季报显示出的机构持仓机构小幅变动有直接的关系。所以，在经济、流动性保持稳定的当下，继续看好指数向好趋势，但短期还需谨防3400点区域的反复，在持仓上需要做适当调仓，减持部分累计涨幅较大的标的，低吸二线蓝筹以及新的成长标的。
		
		</div>
		<!-- 
		<div class="dl_2">
			<table style="width: 100%;height: 100%;border: 0px;text-align: center;">
				<tr style="width: 100%;height: 40%;">
					<td style="border-right: 1px #ff5722 solid;">建议仓位</td>
					<td >机构看点</td>
				</tr>
				<tr style="width: 100%;height: 60%;">
					<td style="border-right: 1px #ff5722 solid;border-top: 1px #ff5722 solid">
						60%
					</td>
					<td style="border-top: 1px #ff5722 solid">
						打算打算<br>等等撒的
					</td>
				</tr>
			</table>
		</div>
		 -->
		<div class="dl_3">
			操作策略：<br>&nbsp;&nbsp;&nbsp;&nbsp;
   三大股指今日均站上五天均线，操作机会大增，除配超级品牌个股外，炒记忆今天又得到深挖，建议继续沿着此思路寻找较好标的。仓位可放大些，控制在七成以内。
		<br>
		<span style="color: red">
			今日带客户建仓【002725 跃岭股份】明日早盘将强势拉升出货（非正式客户切勿追高验证实力即可）
		</span>
		</div>	
	
	</div>

</body>
</html>