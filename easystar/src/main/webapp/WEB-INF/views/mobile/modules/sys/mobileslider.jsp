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
<link href="${ctxStatic}/reg-login/css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <div id="wrap" class="wrapper">
        <div id="pages">
            <div class="page page1">
            	<div class="box">
                    <img src="${ctxStatic}/reg-login/images/slider/fxb1.jpg" />
                </div>
            </div>
            <div class="page page2">
            	<div class="box">
                    <img src="${ctxStatic}/reg-login/images/slider/fxb2.jpg" />
                </div>
            </div>
            <div class="page page3">
            	<div class="box">
                    <a href="${ctx}/pay/toreg?tInviter=${tUser.tInviter}"><img src="${ctxStatic}/reg-login/images/slider/fxb3.jpg" /></a>
                </div>
            </div>
        </div>
    </div>
	<script type="text/javascript" src="${ctxStatic}/reg-login/js/pageSwitch.js"></script>
    <script>
    var reg=location.search.match(/ts=([^&]*)/),
		ts=reg&&reg[1]||'flip3d',
		a=new pageSwitch('pages',{
        duration:1000,
        start:0,
        direction:0,
        loop:false,
        ease:'ease',
        transition:ts,
		freeze:false,
		mouse:true,
        mousewheel:true,
        arrowkey:true
    });
	
	/*
    document.getElementById('tssel').onchange=function(){
		location.href='?ts='+this.value;
	}
	
	var options=document.getElementById('tssel').options,
		i=0,op;
	while(op=options[i++]){
		if(op.value===ts){
			op.selected=true;
			break;
		}
	}
	*/
	
	function colorRand(){
		return parseInt(Math.random()*255);
	}
	
	function createPage(){
		var div=document.createElement('div');
		div.style.backgroundColor='rgb('+colorRand()+','+colorRand()+','+colorRand()+')';
		return div;
	}
    </script>
</body>
</html>