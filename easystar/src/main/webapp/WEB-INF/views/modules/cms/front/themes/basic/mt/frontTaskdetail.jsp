<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>发布信息</title>
<meta name="decorator" content="cms_default_${site.theme}" />
<meta name="description" content="${category.description}" />
<meta name="keywords" content="${category.keywords}" />
<link href="${ctxStatic}/jquery-select2/3.4/select2.min.css" rel="stylesheet" />
<script src="${ctxStatic}/jquery-select2/3.4/select2.min.js" type="text/javascript"></script>
<script src="${ctxStatic}/common/mustache.min.js" type="text/javascript"></script>
<script src="${ctxStatic}/common/jeesite.js" type="text/javascript"></script>
<link href="${ctxStatic}/zui/css/iconfont.css" rel="stylesheet" />
<style type="text/css">
</style>

<script type="text/javascript">
$(function(){
	$(".sub_nav_1 a").eq(1).addClass("a1");
})

//参与任务
function join(id){
	window.location.href="${ctx}/saveTaskorder?toTaskid="+id;
}

//交单
function hand(id){
	var toName=$("#toName").val();
	var toPhone=$("#toPhone").val();
	var toCardid=$("#toCardid").val();
	var toPhotourl=$("#toPhotourl").val();
	var toPhotoinfo=$("#toPhotoinfo").val();
	window.location.href="${ctx}/handTaskorder?id="+id+"&toName="+toName
	+"&toPhone="+toPhone+"&toCardid="+toCardid+"&toPhotourl="+toPhotourl+"&toPhotoinfo="+toPhotoinfo;
}

//取消参与
function cancel(id){
	window.location.href="${ctx}/cancelTaskorder?id="+id;	
}
</script>
<style type="text/css">
.btn_tj {
	border: 1px #e9491a solid;
	width: 80px;
	height: 35px;
	border-radius: 5px;
	background-color: #e9491a;
	line-height: 35px;
	font-size: 15px;
	color: #fff;
	cursor: pointer;
	text-align: center;
	float: left;
}

.skew-title {
	width: 128px;
	height: 48px;
	text-align: center;
	line-height: 48px;
	background: #1FC16E;
	transform: skew(-30deg);
}

.skew-title span {
	font-size: 16px;
	color: #FFF;
	width: 128px;
	height: 48px;
}

.innertext {
	font-size: 18px;
	margin-bottom: 10px;
	line-height: 30px;
}

.input-xlarge {
	width: 200px;
	height: 30px;
	line-height: 30px;
	border-radius: 5px;
	font-size: 16px;
	border: 1px #c7bebe solid
}

.timedesc {
	text-align: center;
	font-size: 40px;
}

.textsize {
	background-color: #fff;
	border: 0;
	font-size: 18px;
	line-height: 30px;
	color: #555;
	font-family: microsoft yahei !important;
}


blockquote, body, button, dd, dl, dt, fieldset, form, h1, h2, h3, h4, h5,
	h6, hr, input, legend, li, ol, p, pre, td, textarea, th, ul {
	margin: 0;
	padding: 0;
}

ol, ul {
	list-style: none;
}


.tHeader {
	width: 100%;
	margin: 10px auto;
	margin-bottom: 30px;
	background-color: #fff;
	border: 1px solid #eee;
	box-shadow: 0 2px 3px #eee;
}

.tHeader .in {
	position: relative;
	margin: 0 auto;
	padding: 15px;
}

.tHeader h1 {
	display: inline-block;
	/*float: left;*/
	max-width: 340px;
	height: 30px;
	line-height: 30px;
	font-size: 22px;
	font-weight: bold;
	color: #333;
	margin: 0 10px 8px 0;
}

.tHeader .lheadright {
	float: right;
	font-size: 18px;
	font-weight: 700;
}

.cname {
	height: 20px;
	line-height: 20px;
	width: 545px;
	margin-bottom: 8px;
}

.tHjob .lname {
	max-width: 110px;
	height: 30px;
	line-height: 34px;
	margin-bottom: 8px;
}

.channel_main {
	margin: 10px auto;
	font-size: 14px;
	line-height: 30px;
}

.channel_main .module_title {
	width: 100%;
	border-bottom: 1px solid #d9d9d9;
	line-height: 40px;
}

.channel_main .module_title h3 {
	margin-bottom: -1px;
	padding: 0 10px;
	font-size: 16px;
	border-bottom: 3px solid #e85220;
	display: inline-block;
	line-height: 40px;
}

.channel_contact {
	padding: 15px 10px;
	border-top: none;
	line-height: 25px;
}

.channel_intro {
	padding: 10px;
}

.channel_main .module_title a {
	margin-top: 5px;
	float: right;
	color: #06c;
	line-height: 30px;
}

.innertext {
	line-height: 30px;
	color: #333;
	word-wrap: break-word;
}
</style>
	<link href="${ctxStatic}/modules/cms/front/themes/mt/upload/css/webuploader.css" type="text/css" rel="stylesheet" />
	<link href="${ctxStatic}/modules/cms/front/themes/mt/upload/css/style.css" type="text/css" rel="stylesheet" />
	<script src="${ctxStatic}/modules/cms/front/themes/mt/upload/js/webuploader.js" type="text/javascript"></script>
	<script src="${ctxStatic}/modules/cms/front/themes/mt/upload/js/fronttaskpostupload.js" type="text/javascript"></script>
<script type="text/javascript">
	function sub(id) {
		if (id == "1") {
			$("#person").css("display", "");
			$("#partner").css("display", "none");
			$("#per_par").val("1");
		} else {
			$("#partner").css("display", "");
			$("#person").css("display", "none");
			$("#per_par").val("2");
		}

	}
</script>

</head>
<body>
<input type="hidden" id="createtime" value="<fmt:formatDate value="${taskorder.createtime}" pattern="yyyy-MM-dd HH:mm:ss"/>">
<input type="hidden" id="taskYxsj" value="${tTask.taskYxsj}">
<input type="hidden" id="taskid" value="${tTask.id}">
<!-- =================遮罩部分============================ -->
<div class="modal fade" tabindex="-1" role="dialog" id="myModal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header" style="border-bottom: 0">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <div class="modal-title" style="text-align: center;font-size: 16px;color: #0064ff">任务提交</div>
      </div>
      <!-- 此处是选择哪种身份的 -->
      <input type="hidden" id="per_par" value="1">
      <div class="tabbable" id="tabs-444498">
				<ul class="nav nav-tabs">
					<li  class="active" onclick="sub('1')">
						 <a href="javascript:void(0)" data-toggle="tab">个人</a>
					</li>
					<li onclick="sub('2')">
						 <a href="javascript:void(0)" data-toggle="tab">合作商</a>
					</li>
				</ul>
	 </div>
      <div class="modal-body" id="person" style="text-align: center;">
<!--       	<span>例如：张三</span><br> -->
        <input class="input-xlarge" placeholder="做单真实姓名" id="toName" /><br><br>
<!--         <span>例如：420115124572489634</span><br> -->
        <input class="input-xlarge" placeholder="做单身份证号" id="toCardid" /><br><br>
<!--         <span>例如：15527124456</span><br> -->
        <input class="input-xlarge" placeholder="做单电话号码" id="toPhone" /><br><br>
      </div>
      <div class="modal-body" id="partner" style="text-align: center;display: none">
      	<span>例如：李四</span><br>
        <input class="input-xlarge" placeholder="做单真实姓名" id="toName" /><br><br>
        <span>例如：420115124572489634</span><br>
        <input class="input-xlarge" placeholder="做单身份证号" id="toCardid" /><br><br>
        <span>例如：15527124456</span><br>
        <input class="input-xlarge" placeholder="做单电话号码" id="toPhone" /><br><br>
      </div>
      
      
       <!-- ==================================================================== -->
<%-- 		<form:hidden path="proUrl"/> --%>
<%-- 		<form:hidden path="proUrlInfo"/> --%>
		<input type="hidden" id="toPhotourl">
		<input type="hidden" id="toPhotoinfo">
		<div class="control-group">
<!-- 			<label class="control-label" style="width: 35%">产品图片：</label> -->
				<div class="controls">
					<div class="width_auto" style="width: 420px;">
					    <div class="upload_container" >
					        <!--头部，相册选择和格式选择-->
					        <div id="uploader" >
					            <div class="item_container">
					                <div id="" class="queueList" >
					                    <div id="dndArea" class="placeholder">
					                        <div id="filePicker"></div>
					                    </div>
					                </div>
					            </div>
					            <div class="statusBar">
					                <div class="info"></div>
					                <div class="btns">
					                    <div id="filePicker2_0" class="filePicker2 element-invisible"></div><div class="uploadBtn">开始上传</div>
					                </div>
					            </div>
					        </div>
					    </div>
					</div>
				</div>
		</div>
      
      
      
      <div class="modal-footer" style="text-align: center">
        <button type="button" class="btn btn-primary" onclick="hand('${taskorder.id}')">提交</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!-- ============================================= -->




	<!-- ================================================ -->
		<div class="tHeader tHjob">
			<div class="in">
				<div class="cn">
					<div>

						<span class="lname"><h1>${tTask.taskName}</h1>
							<!-- <span>广州-天河区</span> -->
							<span class="lheadright">任务价格：${tTask.taskPrice}元</span></span>
					</div>
					<p class="cname">
						<a href="javascript:void(0)" target="_blank"
							title="广东自然宜家电子商务有限公司">发布者ID：${tTask.taskUserid}<em
							class="icon_b i_link"></em></a>
					</p>
					<p class="cname">
						<i class="icon iconfont icon-yuan"></i>&nbsp;${fns:getDictLabel(tTask.taskRztype, 'taskRztype', '')}&nbsp;&nbsp;|&nbsp;&nbsp;
						${fns:getDictLabel(tTask.taskType, 'taskType', '')}
					</p>
					<p class="cname">
						<i class="icon iconfont icon-chuangjianshijian"></i>
						<fmt:formatDate value="${tTask.createtime}" pattern="yyyy-MM-dd HH:mm:ss"/>
						&nbsp;&nbsp;|&nbsp;&nbsp;有效时间：${tTask.taskYxsj}分钟&nbsp;&nbsp;|&nbsp;&nbsp;剩余数量：${tTask.taskAmount}
					</p>
				</div>
				<div class="clear"></div>
			</div>
		</div>
		
		<div class="main-body">
				<div class="channel_main">
					<div class="module_title"><h3>任务要求</h3></div>
					<div class="channel_contact">
						<div class="innertext">
							<pre class="textsize">${tTask.taskAsk}</pre>
						</div>
					</div>
					<div class="module_title"><h3>做单技巧</h3></div>
					<div class="channel_contact">
						<div class="innertext">
							<pre class="textsize">${tTask.taskSkill}</pre>
						</div>
					</div>
				    <div class="module_title"><h3>联系方式</h3></div>
				    <div class="channel_contact">
					<!--<center><a href="/member.php?mod=logging&amp;action=login&amp;referer=">登录后可见联系方式</a></center>-->
					<div class="innertext">
							联系电话：15527124409<br>
							联系 QQ：1284622263<br>
						</div>
				    </div>
					    
				</div>
			</div>
		

		<!-- ================================================ -->
	
	<div>
	<input type="hidden" id="tasktoType" value="${taskorder.toType}">
	
		<c:choose>
			<c:when test="${not empty taskorder}">
				<c:if test="${taskorder.toType=='1'}">
					<div style="margin-bottom: 20px;width: 80%;height:50px;margin-left: 50px;text-align:center">
						<div class="btn_tj" style="margin-left: 45%" onclick="cancel('${taskorder.id}')">取消参与</div>
						<div class="btn_tj" style="margin-left:30px" data-toggle="modal" data-target="#myModal">交单</div>
					</div>
					<div id="timer" class="timedesc"></div>
				</c:if>
				<c:if test="${taskorder.toType=='2'}">
					<!-- 申请成功（不能再进行申请） -->
					<div style="margin-bottom: 20px;width: 80%;height:50px;margin-left: 50px;text-align:center">
						<div class="btn_tj" style="margin-left: 50%" >已申请过</div>
					</div>
				</c:if>
				<c:if test="${taskorder.toType=='3'}">
					<!-- 申请失败（还可再次申请） -->
					<div style="margin-bottom: 20px;width: 80%;height:50px;margin-left: 50px;text-align:center">
						<div class="btn_tj" style="margin-left: 50%" onclick="join('${tTask.id}')">参与</div>
					</div>
				</c:if>
			</c:when>
			<c:otherwise>
				<!-- 未申请（可申请） -->
				<c:if test="${tTask.taskAmount>0}">
					<div style="margin-bottom: 20px;width: 80%;height:50px;margin-left: 50px;text-align:center">
						<div class="btn_tj" style="margin-left: 50%" onclick="join('${tTask.id}')">参与</div>
					</div>
				</c:if>
				<c:if test="${tTask.taskAmount<=0}">
					<div style="margin-bottom: 20px;width: 80%;height:50px;margin-left: 50px;text-align:center">
						<div class="btn_tj" style="margin-left: 50%;">名额已满</div>
					</div>
				</c:if>
			</c:otherwise>
		</c:choose>
<script type="text/javascript">
$(function(){
	var createtime=$("#createtime").val();
	var taskYxsj=$("#taskYxsj").val();
	var date=new Date(createtime);
	var min=date.getMinutes();
	date.setMinutes(min+parseInt(taskYxsj));
	var y = date.getFullYear();  
    var m = date.getMonth() + 1;  
    m = m < 10 ? ('0' + m) : m;  
    var d = date.getDate();  
    d = d < 10 ? ('0' + d) : d;  
    var h = date.getHours();  
    h=h < 10 ? ('0' + h) : h;  
    var minute = date.getMinutes();  
    minute = minute < 10 ? ('0' + minute) : minute;  
    var second=date.getSeconds();  
    second=second < 10 ? ('0' + second) : second;  
    var  formatDateTime=y + '-' + m + '-' + d+' '+h+':'+minute+':'+second; 
	leftTimer(formatDateTime)
})
function leftTimer(stringTime){
	setInterval(function(){
		var leftTime = (new Date(stringTime)) - (new Date()); //计算剩余的毫秒数 
		var days = parseInt(leftTime / 1000 / 60 / 60 / 24 , 10); //计算剩余的天数 
		var hours = parseInt(leftTime / 1000 / 60 / 60 % 24 , 10); //计算剩余的小时 
		var minutes = parseInt(leftTime / 1000 / 60 % 60, 10);//计算剩余的分钟 
		var seconds = parseInt(leftTime / 1000 % 60, 10);//计算剩余的秒数 
		days = checkTime(days); 
		hours = checkTime(hours); 
		minutes = checkTime(minutes); 
		seconds = checkTime(seconds);
		if(leftTime>0){
			document.getElementById("timer").innerHTML = days+"天" + hours+"小时" + minutes+"分"+seconds+"秒";
		}else if(leftTime<0){
			
		}else if(leftTime==0){
			alert("=0");
			var id=$("#taskid").val();
			window.location.href="${ctx}/taskdetail?id="+id;
		}
	},1000);
	 
} 
function checkTime(i){ //将0-9的数字前面加上0，例1变为01 
	if(i<10){ 
		i = "0" + i; 
	} 
	return i; 
}
</script>
	</div>
</body>
</html>