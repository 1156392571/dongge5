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
.timedesc{
	text-align: center;
	font-size: 40px;
}
</style>
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
		<div style="text-align: center"><h3>担保平台</h3></div>
	</div>
</body>
</html>