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
<style type="text/css">
</style>

<script type="text/javascript">
$(function(){
	$(".sub_nav_1 a").eq(1).addClass("a1");
})
    function a(){
    setInterval(a,5000);
}

//参与任务
function join(id){
	window.location.href="${ctx}/saveTaskorder?toTaskid="+id;
}

//交单
function hand(id){
	var toName=$("#toName").val();
	var toPhone=$("#toPhone").val();
	var toCardid=$("#toCardid").val();
	window.location.href="${ctx}/handTaskorder?id="+id+"&toName="+toName
	+"&toPhone="+toPhone+"&toCardid="+toCardid;
}

//取消参与
function cancel(id){
	window.location.href="${ctx}/cancelTaskorder?id="+id;	
}
</script>
<style type="text/css">
	.btn_tj{
	border: 1px #e9491a solid;
	width: 80px;
	height: 35px;
	border-radius:5px;
	background-color:#e9491a;
	line-height: 35px;
	font-size:15px; 
	color: #fff;cursor:pointer;text-align: center;float:left;
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
.innertext{
	font-size: 18px;
	margin-bottom: 10px;
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
<!-- <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<!-- 	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script> -->
<!-- 	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->

</head>
<body>
<!-- =================遮罩部分============================ -->
<div class="modal fade" tabindex="-1" role="dialog" id="myModal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <div class="modal-title" style="text-align: center;font-size: 16px;color: #0064ff">任务提交</div>
      </div>
      <div class="modal-body" style="text-align: center;">
      	<span>例如：张三</span><br>
        <input class="input-xlarge" placeholder="做单真实姓名" id="toName" /><br><br>
        <span>例如：420115124572489634</span><br>
        <input class="input-xlarge" placeholder="做单身份证号" id="toCardid" /><br><br>
        <span>例如：15527124456</span><br>
        <input class="input-xlarge" placeholder="做单电话号码" id="toPhone" /><br><br>
        
      </div>
      <div class="modal-footer" style="text-align: center">
        <button type="button" class="btn btn-primary" onclick="hand('${taskorder.id}')">提交</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!-- ============================================= -->




	<div>
		<div style="text-align: center"><h3>任务详情</h3></div>
		<div style=" margin: 15px 50px 50px 50px;">
			<div class="skew-title">
				<span>基本信息</span>
			</div>
			<div class="innertext">
				发布者ID：${tTask.taskUserid}<br>
				任务名称：${tTask.taskName}<br>
				任务价格：${tTask.taskPrice}元<br>
				任务类型：${fns:getDictLabel(taskList.taskType, 'taskType', '')}<br>
				认证类型：${fns:getDictLabel(taskList.taskRztype, 'taskRztype', '')}<br>
				剩余数量：${tTask.taskAmount}<br>
				联系电话：${tTask.taskPhone}<br>
				联系 QQ：${tTask.taskQq}<br>
			</div>
			<div class="skew-title">
				<span>任务要求</span>
			</div>
			<div class="innertext">
				${tTask.taskAsk};
			</div>
			<div class="skew-title">
				<span>任务技巧</span>
			</div>
			<div class="innertext">
				${tTask.taskSkill}
			</div>
	</div>
	</div>
	<div>
		<c:choose>
			<c:when test="${not empty taskorder}">
				<c:if test="${taskorder.toType=='1'}">
					申请中（<span id="timer"></span>）
					<div style="margin-bottom: 20px;width: 80%;height:50px;margin-left: 50px;text-align:center">
						<div class="btn_tj" style="margin-left: 45%" onclick="cancel('${taskorder.id}')">取消参与</div>
						<div class="btn_tj" style="margin-left:20px" data-toggle="modal" data-target="#myModal">交单</div>
					</div>
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
	leftTimer("2017-11-11 23:21:12");
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
		document.getElementById("timer").innerHTML = days+"天" + hours+"小时" + minutes+"分"+seconds+"秒";
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