<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-title" content="">
<meta name="format-detection" content="telephone=no">
	<title></title>
	 <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport">
	<link rel="stylesheet" href="${ctxStatic}/reg-login/css/mytask.css">
	<link rel="stylesheet" href="${ctxStatic}/reg-login/css/photoSwipe.css">
	<script src="${ctxStatic}/reg-login/js/avalon.js" type="text/javascript"></script>
	<script src="${ctxStatic}/reg-login/js/jquery.js"></script>
	<script type='text/javascript'>
	</script>
<script type="text/javascript">
	document.ontouchstart=function(){
		return false;
	}
	
	avalon.define({
		$id : 'test',
		show : true,

	})

	var vm = avalon.define({
		$id : 'item',
		show : false,
		add : 0,
		item:(function(){
            var arr=[];
            $.ajax({
                 type : "post",
                 async : false, //同步执行
                 url : "${ctx}/pay/gettaskList",
                 data : {},
                 dataType : "json", //返回数据形式为json
                 success :function(result) {
                   if (result) {
                        for(var i=0;i<result.length;i++){
                        	result[i].back="background_"+i;
                        	arr.push(result[i]);
                     }    
                   }
                                        
                },
                    error : function(errorMsg) {
                        alert("不好意思，图表请求数据失败啦!");
                         myChart.hideLoading();
                       }
               })
                 return arr;
              })() ,
              fn:function (el) {
                  window.location.href="${ctx}/pay/totaskdetails?id="+el;
              },
	})
</script>
<style type="text/css">
.ms-controller {
	visibility: hidden
}
</style>
</head>
<body>
	<div class="m-list ms-controller" ms-controller="test">
		<div class="nav">
			<div :class="['items',@show?'color':'']" ms-on-tap="@show = true">图文</div>
			<div :class="['items',!@show?'color':'']" ms-on-tap="@show = false">列表</div>
		</div>
		<div class="box2" :visible="@show" >
			<div id="photo_box" ms-important='item'>
				<div>
					<div>
						<div :class="['item-'+(@item.length - index),el.back,'item']"  :for="(index,el) in @item" ms-on-tap="@fn(el.id)">
							<div class="title">{{el.title}}</div>
							<div class="text">{{el.text}}</div>
							<div class="qian">
								<span class="rmb">￥{{el.money}}</span>
								<span class="see">已有{{el.see}}人领取该任务</span>
							</div>
							<div class="time">
								<span>---</span>任务倒计时{{el.time}}天<span>---</span>
							</div>
							<div class="page" style="width: 100%">
								{{el.page}}/{{@item.length}}
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="box1" :visible="!@show">
			<c:forEach items="${list}" var="mobiletask">
			<a href="${ctx}/pay/totaskdetails?id=${mobiletask.id}" class="item">
				<div class="top">
					<div class="left">
						<div class="title">${mobiletask.tmtName}</div>
						<div class="text">
						${fns:abbr(mobiletask.tmtAsk,30)}
						</div>
					</div>
					<div class="right">
						<img src="${ctxStatic}/reg-login/images/img/icon_you.png">
					</div>
				</div>
				<div class="bottom">
					<div class="time"><fmt:formatDate value="${mobiletask.createtime}" pattern="yyyy/MM/dd"/></div>
					<div class="sum">
						<img src="${ctxStatic}/reg-login/images/img/icon_yanjing.png">
						<span>${mobiletask.tmtViewtime}</span>
					</div>
				</div>
			</a>
		</c:forEach>
		</div>
		
	</div>
	<script type="text/javascript" src="${ctxStatic}/reg-login/js/jquery-3.1.1.min.js"></script>
	<script type="text/javascript" src="${ctxStatic}/reg-login/js/photoSwipe.js"></script>
</body>
</html>