<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/head.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>首页</title>
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no,minimal-ui"/>
<meta name="format-detection" content="email=no" />
<meta name="format-detection" content="address=no" />
<meta name="format-detection" content="telephone=no" />
<link href="https://cdn.bootcss.com/Swiper/4.0.7/css/swiper.min.css" rel="stylesheet">
<script type="text/javascript" src="${ctxStatic}/reg-login/js/time_js_1.js"></script>
<link href="${ctxStatic}/reg-login/css/time_css.css" rel="stylesheet" type="text/css" />
	<style type="text/css">
		.swiper-slide {
			position: absolute;
		    width: 100%;
		    height: 100%;
		    background-image: url(${ctxStatic}/reg-login/images/mycenter/fxb3.png);
 			background-size: 100% 100%; 
		}
		.swiper-slide img{
			width: 100%;
			height: 100%;
		}  
	</style>
	<script type="text/javascript">
	var start1 = function(){
		// i = i + 0.2;
		i = i + 360/((gameTime)*10);  //旋转的角度  90s 为 0.4  60s为0.6
		count = count + 1;
		if(count <= (gameTime/2*10)){  // 一半的角度  90s 为 450
			$(".pie1").css("-o-transform","rotate(" + i + "deg)");
			$(".pie1").css("-moz-transform","rotate(" + i + "deg)");
			$(".pie1").css("-webkit-transform","rotate(" + i + "deg)");
		}else{
			$(".pie2").css("backgroundColor", "#4abfef");
			$(".pie2").css("-o-transform","rotate(" + i + "deg)");
			$(".pie2").css("-moz-transform","rotate(" + i + "deg)");
			$(".pie2").css("-webkit-transform","rotate(" + i + "deg)");
	        if(count === 29){
	            setInterval(function(){
	                $(".pie2").css("backgroundColor", "#4abfef");
	                $(".pie2").css("-o-transform","rotate(" + 360 + "deg)");
	                $(".pie2").css("-moz-transform","rotate(" + 360 + "deg)");
	                $(".pie2").css("-webkit-transform","rotate(" + 360 + "deg)");
	                window.location.href="${ctx}/pay/toreg?tInviter=${tUser.tInviter}";  
	            }, 100);
	        }
		}
	};
	</script>
</head>
<body>
    <div>
        <div class="swiper-slide">
        	<a href="${ctx}/pay/toreg?tInviter=${tUser.tInviter}" class="game_time">
				<div class="hold">
					<div class="pie pie1"></div>
				</div>
				<div class="hold">
					<div class="pie pie2"></div>
				</div>
				<div class="bg"> </div>
				<div class="time"></div>
			</a>
        </div>	
</body>
<script type="text/javascript">
	countDown();
</script>
<!--效果html结束-->
<script src="https://cdn.bootcss.com/Swiper/4.0.7/js/swiper.min.js"></script>
<script>       
countDown();   
  </script>
</body>
</html>