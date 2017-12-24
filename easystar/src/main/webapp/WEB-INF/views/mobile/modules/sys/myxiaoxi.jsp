<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
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
<title>我的返现</title>
<style type="text/css">
    html,body{
        height:100%;width:100%;font-family:"微软雅黑";background-color:#eee;
    }
    body{margin:0px;padding:0px;}
        #dviews{width:100%;height:100%;margin:0px auto;}
        #tabto{width:100%;height:10%;margin:0px;font-size:0px;}
        .totab{display:inline-block;width:100%;height:100%;text-align:center;background-color:white;color:black;font-size:15px;border-right:1px solid #ccc;}
        #to1{background-color:rgb(0, 140, 255);color:white;}
        #divto{width:100%;height:100%;margin:0px;margin-top:10px;}
        .todiv{width:100%;height:100%;margin:0px;position:absolute;background-color:white;background-color:#eee;}
        #tdv1{z-index:1;}
        ul{
            padding:0px;margin-top:10px;height:100%;width:100%;
        }
    li{list-style:none;margin-bottom: 1px;
    text-align:center;height:8%;
    background-color:white;
        font-size: 14px;line-height:50px;}
    li >span{
        color:black;
        display:inline-block;
        width:28%;
    }
    li >span:nth-child(1){
        text-align:left;
    }
    li >span:nth-child(3){
        text-align:right;
    }
    .p1{margin-bottom:0px;}
    .totab span{
        font-size:12px;
    }
    .navs{
        height:8%;width:100%;margin-bottom:10px;background-color:white;
    }
    .navs >span{
        display: inline-block;width: 40%;height: 100%;line-height: 50px;padding-left: 26px;color: red;
    }
    .sptright{
        text-align: right;
    }
    .monry{
        color:red;
    }
    .title{
        background-color:#f9f9f9
    }
    </style>
</head>
<body>
<div id = "dviews">
<div id ="tabto">
    <div class="totab" id="to1"><p class = "p1">赏金消息</p><span>10.9元</span></div>
    </div>

    <div id ="divto">
    <div class="todiv" id="tdv1">
    <div class = "navs">
        <span class = "sptleft">10份赏金</span><span class = "sptright">共1.60元</span>
    </div>
    <ul>
        <li class = "title"><span>说明</span><span>收益</span><span>时间</span></li>
        <c:forEach items="${xiaoxilist}" var="list">
        	<li><span>${list.tma_dtlname}</span><span>${list.tma_jine}</span><span class = "monry">${list.createtime}</span></li>
        </c:forEach>
    </ul>
    </div>
    </div>
    </div>

</body>
<script src="${ctxStatic}/reg-login/js/jquery.js"></script>
<script type="text/javascript">

var oBar = document.getElementsByClassName("totab");

            for(var i = 0; i<oBar.length;i++){
                oBar[i].onclick = function() {
                $(".totab").css({"background-color":"white","color":"black"});
                this.style.backgroundColor = "rgb(0, 140, 255)";
                this.style.color = "white";
                Move(this);
             }
            }

  function Move(obj) {
           var oId = obj.id;
           var oWich = parseInt(oId.slice(-1))-1;
           var oPanl = document.getElementsByClassName("todiv");
           for(var i = 0; i<oPanl.length;i++){
           oPanl[i].style.zIndex = 0;

       }
           oPanl[oWich].style.zIndex = 1;

        }

</script>
</html>