<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>用户注册</title>
<meta charset="utf-8">
<meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<link rel="stylesheet" href="${ctxStatic}/reg-login/css/style1.css">
<link rel="stylesheet" href="${ctxStatic}/reg-login/css/primary.css">
<script src="${ctxStatic}/reg-login/js/jquery-1.8.2.min.js"></script>
</head>
<body>
	<header class="disBox boxAlign-center bgf8">
	    <a class="wd160 pdL28" href="seeInformation"><i class="HarrowLeft"></i></a>
	    <h1 class="boxFlex fs30 cl3 owt tact">我的详情</h1>
	    <div class="wd160 pdR28 tart">
	    	<input type="submit" class="fs26 clCC" value="保存">
	    </div>
	</header>
	<div class="container-pdTB">
		<a href="javascript:;" style="height:3.125rem;" class="disBox boxAlign-center">
			<div class="mgL28 iconH90">
				<!--90*90-->
				<img src="${user.u_imgPath}" id="u_imgPath" width="80px";height="80px"/>
<!-- 				<img src="images/icon_01.png" id="u_imgPath" width="80px";height="80px"/> -->
			</div>
			<div class="boxFlex text-right">我的头像</div>
<!-- 			<p class="fs24 cl3 sctx">上传头像</p> -->
			<input  accept="image/*;capture=camera" name="u_imgPath" class="tupianshangc" type="file" onChange="handleFiles(this)"/>
			<i class="arrowR22"></i>
		</a>
		<ul class="wdxqxx">
			<li class="disBox boxAlign-center"><label>手机号码</label><input type="text" value="${user.zhanghao}" readonly/></li>
			<li class="disBox boxAlign-center"><label>真实姓名</label><input type="text" value="${user.realName}" name="realName" placeholder="请输入姓名" /></li>
			<li class="disBox boxAlign-center"><label>证件号码</label><input type="text" value="${user.IDcard}" name="IDcard" placeholder="请输入证件号码" /></li>
			<li class="disBox boxAlign-center"><label>邮箱地址</label><input type="text" value="${user.u_Email}" name="u_Email" placeholder="请输入邮箱地址" /></li>
		</ul>
		<div style="height:0.65rem; background:#f8f8f8;"></div>

		<div class="wdxqABC">
			<a class="disBox boxAlign-center showwdxqewm" href="javascript:;">
				<i class="icon_XQ XQ01"></i><p class="boxFlex">二维码</p><i class="arrowR22"></i>
			</a>
<!-- 			<a class="disBox boxAlign-center" href="javascript:;"> -->
<!-- 				<i class="icon_XQ XQ02"></i><p class="boxFlex">我的关注</p><i class="arrowR22"></i> -->
<!-- 			</a> -->
<!-- 			<a class="disBox boxAlign-center" href="javascript:;"> -->
<!-- 				<i class="icon_XQ XQ03"></i><p class="boxFlex">我的收藏</p><i class="arrowR22"></i> -->
<!-- 			</a> -->
			<a class="disBox boxAlign-center" href="selectUserFoot?u_id=${user.id}">
				<i class="icon_XQ XQ04"></i><p class="boxFlex">足迹</p><i class="arrowR22"></i>
			</a>
			<a class="disBox boxAlign-center" href="javascript:;">
				<i class="icon_XQ XQ05"></i><p class="boxFlex" onclick="repassword()">修改密码</p><i class="arrowR22"></i>
			</a>
		</div>
<br><br><br><br>
		<a href="javascript:;" class="btnA bgadA04 fs26" style="margin-top:1.35rem;background-color: #fe6700;" onclick="logout()">退出登录</a>
	</div>



	<div class="dsnn pz">
		<div class="wjmmzzc"></div>
		<div class="wdxqPhoto">
			<div class="bgF fs26 clBB tact mgB16 wd-radius">
				<p class="bdbtc">拍照</p>
				<p>从相机选择</p>
			</div>
			<div class="bgF fs26 clBB tact wd-radius qxpz"><p>取消</p></div>
		</div>
	</div>
	
	<div class="dsnn wdxqewm">
		<div class="wjmmzzc hidewdxqewm"></div>
		<div class="wdewm">
			<p class="fs26 cl3" style="padding-left:0.7rem; padding-bottom:0.8rem;">我的二维码</p>
			<div class="wdewmPNG bgF">
				<!--354*354-->
				<img src="img/erweima.png"/>
			</div>
		</div>
	</div>

</body>
</html>