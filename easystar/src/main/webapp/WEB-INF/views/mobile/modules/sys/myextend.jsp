<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/head.jsp"%>
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
<title>我的推广</title>
<link rel="stylesheet" href="${ctxStatic}/reg-login/css/extendnews.css">
<link rel="stylesheet" href="${ctxStatic}/reg-login/footcss/style.css">
<link rel="stylesheet" href="${ctxStatic}/reg-login/css/primary.css">
<link href="https://cdn.bootcss.com/c3/0.4.18/c3.min.css" rel="stylesheet">
<script src="http://c3js.org/js/d3-3.5.6.min-77adef17.js" type="text/javascript"></script>
<script src="https://cdn.bootcss.com/c3/0.4.18/c3.min.js"></script>

<body style="background-color: #f1f3f8">
	<input type="hidden" id="aa" value="${extendAll}">
	<div class="m-chart">
		<div class="head">
			<div class="tishi">您的推广员越多，收益就越高。</div>
			<img src="${ctxStatic}/reg-login/images/mycenter/zhizhen2.png">
			<div class="chart" id="chart"></div>
			<div id="sum" class="sum">0</div>
			<div class="absolute one">0</div>
			<div class="absolute two">25</div>
			<div class="absolute three">50</div>
			<div class="absolute four">75</div>
			<div class="absolute five">100</div>
			<div class="time">截止到${nowtime}</div>
			<div class="add" style="font-size: 15px;">今日累计新增 0 个用户</div>
		</div>
		<div class="listbox">
			<div class="tou">
				<span>客户明细</span>
			</div>
			<div class="item" onclick="todetail('A')">
				<img src="${ctxStatic}/reg-login/images/mycenter/gold01.png">
				<div class="info">
					<div class="left" style="font-size: 15px;">
						推广员A
					</div>
					<div class="right">
						<i class="icon_you1"></i>
					</div>
				</div>
			</div>
			<div class="item" onclick="todetail('B')">
				<img src="${ctxStatic}/reg-login/images/mycenter/gold02.png">
				<div class="info">
					<div class="left" style="font-size: 15px;">
						推广员B
					</div>
					<div class="right">
						<i class="icon_you1"></i>
					</div>
				</div>
			</div>
			<div class="item" onclick="todetail('C')">
				<img src="${ctxStatic}/reg-login/images/mycenter/gold03.png">
				<div class="info">
					<div class="left" style="font-size: 15px;">
						推广员C
					</div>
					<div class="right">
						<i class="icon_you1"></i>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	<footer class="disBox">
		<a href="${ctx}/pay/tomyhead"><i class="f-icon01"></i>首页</a>
		<a href="${ctx}/pay/tomytask"><i class="f-icon02"></i>任务</a>
		<a href="${ctx}/pay/toextend"  class="cur"><i class="f-icon03"></i>推广</a>
		<a href="${ctx}/pay/tomycenter"><i class="f-icon04"></i>我的</a>
	</footer>
	<script type="text/javascript">
var x = 0;		
var max = 100;
var sum = $("#aa").val();
var chart = c3.generate({
	bindto: '#chart',
    data: {
        columns: [
            ['data', 0]
        ],
        type: 'gauge',
    },
    gauge: {
        label: {
            format: function(value, ratio) {
                return value;
            },
            show: false // to turn off the min/max labels.
        },
    min: 0, // 0 is default, //can handle negative min e.g. vacuum / voltage / current flow / rate of change
    max: max, // 100 is default
    // units: ' 人',
    width: 20, // for adjusting arc thickness
    expand: false
    },
    color: {
        pattern: ['#FF0000', '#F97600', '#F6C600', '#60B044'], // the three color levels for the percentage values.
        threshold: {
//            unit: 'value', // percentage is default
//            max: 200, // 100 is default
            values: [30, 60, 90, 100]
        }
    },
    size: {
        height: 163
    }
});

setTimeout(function () {
    chart.load({
        columns: [['data', sum]]
    });
}, 500);

var int = setInterval(function () {
	if(x<sum){
		x++;
    	var vum = document.getElementById('sum').innerHTML= x;
	} else{
		clearInterval(int);
	}
	
}, 20);

function todetail(type){
	window.location.href="${ctx}/pay/toextenddetail?type="+type;
}
	</script>


</body>
</html>