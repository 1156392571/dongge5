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
<script type="text/javascript" src="${ctxStatic}/reg-login/js/time_js.js"></script>
<link href="${ctxStatic}/reg-login/css/time_css.css" rel="stylesheet" type="text/css" />
	<style type="text/css">
		.swiper-container {
			position: absolute;
		    width: 100%;
		    height: 100%;
		}
		.swiper-slide img{
			width: 100%;
			height: 100%;
		}  
	</style>
</head>
<body>
    <div>
		<div class="swiper-container">
		    <div class="swiper-wrapper">
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
					

		        	<img src="${ctxStatic}/reg-login/images/mycenter/fxb1.png">
		        </div>
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
		        	<img src="${ctxStatic}/reg-login/images/mycenter/fxb2.png">
		        </div>
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
		        	<img src="${ctxStatic}/reg-login/images/mycenter/fxb3.png">
		        </div>
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
		        	<img src="${ctxStatic}/reg-login/images/mycenter/fxb4.png">
		        </div>
		    </div>
		    <!-- 如果需要分页器 -->
		    <div class="swiper-pagination"></div>
		</div>
	</div>
</body>
<script type="text/javascript">
	countDown();
</script>
<!--效果html结束-->
<script src="https://cdn.bootcss.com/Swiper/4.0.7/js/swiper.min.js"></script>
<script>       
  var mySwiper = new Swiper ('.swiper-container', {
    direction: 'horizontal',
    // effect : 'fade',
    // speed:1000,
    width: window.innerWidth,
    height : window.innerHeight,
    // 如果需要分页器
    pagination: {
      el: '.swiper-pagination',
    },
    autoplay: {
    delay: 2000,
    stopOnLastSlide: true,
    disableOnInteraction: false,
    },
  })        
  </script>
</body>
</html>