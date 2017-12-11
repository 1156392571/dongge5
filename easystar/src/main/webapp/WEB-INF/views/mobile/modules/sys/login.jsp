<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <script>
        var pageName = 'mobile/account/login';
//        var getValidcodeUrl = "//";
        var mobileLoginUrl = 'http://m.xinli001.com/account/login';
        var wxUrl = "http://m.xinli001.com/oauth/weixin";
        var weiboUrl = "http://m.xinli001.com/oauth/weibo";
        var qqUrl = "http://m.xinli001.com/oauth/qq";
        var phonereg = /^1[0-9]{10}$/;
        var checkGeetestUrl = 'http://m.xinli001.com/ajax/validate-geetest';
        var getGeetestUrl = 'http://m.xinli001.com/ajax/get-geetest-code';
    </script>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" >
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-title" content="">
<meta name="format-detection" content="telephone=no">
<title>米兔登陆</title>
<meta name="keywords" content="">
<meta name="description" content="">
<link rel="stylesheet" href="${ctxStatic}/reg-login/css/mobile_e53ede8df3.css">

<script src="${ctxStatic}/reg-login/js/mobile_34853f7dca.js" ></script>
<script>
    /*
    var checkGeetestUrl = 'http://m.xinli001.com/ajax/validate-geetest';
    var getGeetestUrl = 'http://m.xinli001.com/ajax/get-geetest-code';
    var postUserMessageUrl = 'http://m.xinli001.com/ajax/post-user-message.json';
    $(function() {
        if($('script[src$="app.ad.js"]').length<1 && pageName != 'mobile/account/login'){
            $("<script>").attr({"src":"http://lapp.xinli001.com/jsmin/app.ad.min.js"}).appendTo($("body"));
        }else{
            console.log("Already loaded app.ad.js.");
        }
    });
    */
</script>
</head>

<body style="background-color:#fff">
<div class="login-container">
    <header class="login-header-new">
        <a href="javascript:void(0)http://m.xinli001.com"><i class="icon-arrow-left"></i></a>
        <a href="javascript:void(0)http://m.xinli001.com"><div class="logo"></div></a>
    </header>
    <section class="login-section">
        <ul class="login-tabs js-tabs">
            <li class="login-tab js-tab selected">手机验证登录</li>
            <li class="login-tab js-tab">账号密码登录</li>
        </ul>
        <div class="js-tabconts">
            <div class="js-tabcont selected">
                <div class="login-input-group" id="login-form-mobile">
                    <div class="login-input-item">
                        <i class="icon-mobile"></i>
                        <input class="login-input" type="tel" name="mobile" placeholder="手机号" />
                        <i class="clear"></i>
                    </div>
                    <div class="login-input-item">
                        <i class="icon-lock"></i>
                        <input class="login-input login-input-dyn" type="tel" name="dyn-pwd" placeholder="验证码" maxlength="6" />
                        <i class="clear clear-dyn"></i>
                        <button class="dyn-pwd-btn">获取验证码</button>
                    </div>
                    <div id="popup-captcha"></div>
                </div>
                <button class="login-btn" disabled="disabled" id="login-btn-mobile" status="0">登录</button>
            </div>
            <div class="js-tabcont">
                <div class="login-input-group" id="login-form-username">
                    <div class="login-input-item">
                        <i class="icon-user"></i>
                        <input class="login-input" type="text" name="user" placeholder="手机号或用户名" />
                        <i class="clear"></i>
                    </div>
                    <div class="login-input-item">
                        <i class="icon-lock"></i>
                        <input class="login-input" type="password" name="pwd" placeholder="密码" />
                        <i class="clear"></i>
                    </div>
                </div>
                <button class="login-btn" disabled="disabled" id="login-btn-username" status="0">登录</button>
                <p class="login-tips">忘记密码如何登录？</p>
            </div>
        </div>
    </section>
    
    
    <!-- 
    <section class="open-login-section">
        <div class="bg"></div>
        <div class="open-login-container">
            <div class="open-login-title">
                <i class="icon-arrow-bottom-circle"></i>
                <i class="icon-arrow-top-circle"></i>
                <p class="title-txt">第三方登录</p>
            </div>
            <div class="open-login-option-bar">
               <div class="option" source="weixin">
                   <i class="icon-wechat"></i>
                   <p class="txt">微信</p>
               </div>
                <div class="option" source="weibo">
                    <i class="icon-weibo"></i>
                    <p class="txt">微博</p>
                </div>
                <div class="option" source="qq">
                    <i class="icon-qq"></i>
                    <p class="txt">QQ</p>
                </div>
            </div>
        </div>
    </section>
     -->
    
    <!-- 点击“忘记密码如何登录”时显示的弹窗 -->
    <section class="forget-pwd-pop">
        <div class="forget-pwd-mask"></div>
        <div class="forget-pwd-content">
            <h1 class="forget-pwd-title">忘记密码</h1>
            <p class="txt"><strong>手机号</strong>用户可使用「手机号+验证码」登录；</p>
            <p class="txt"><strong>邮箱账号</strong>用户可在电脑上登录米兔网站找回密码。</p>
            <div class="ok">我知道了</div>
        </div>
    </section>
</div>


<script type="text/javascript">
var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3Fd64469e9d7bdbf03af6f074dffe7f9b5' type='text/javascript'%3E%3C/script%3E"));

(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
        (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
    m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
})(window,document,'script','//www.google-analytics.com/analytics.js','ga');

ga('create', 'UA-74218902-7', 'auto');
ga('send', 'pageview');
</script><script type="text/javascript"> 
     /*创建于2016-06-14*/ 
     var cpro_id = "u2671677";
</script>
<script src="http://cpro.baidustatic.com/cpro/ui/cm.js" type="text/javascript"></script></body>
</html>