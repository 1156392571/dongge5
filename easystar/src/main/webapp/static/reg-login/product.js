$(function(){
		var protype=$("#protype").val();
		var pxrule=$("#pxrule").val();
		var rztype=$("#rztype").val();
		var jstype=$("#jstype").val();
		//产品类型
		if(protype=="1"){
			$("#cplx li").eq(1).addClass("a");
		}else if(protype=="2"){
			$("#cplx li").eq(2).addClass("a");
		}else{
			$("#cplx li").eq(0).addClass("a");
		}
		//排序规则
		if(pxrule=="1"){
			$("#pxgz li").eq(1).addClass("a");
		}else if(pxrule=="2"){
			$("#pxgz li").eq(2).addClass("a");
		}else if(pxrule=="3"){
			$("#pxgz li").eq(3).addClass("a");
		}else{
			$("#pxgz li").eq(0).addClass("a");
		}
		//资料认证
		if(rztype=="1"){
			$("#zlrz li").eq(1).addClass("a");
		}else if(rztype=="2"){
			$("#zlrz li").eq(2).addClass("a");
		}else if(rztype=="3"){
			$("#zlrz li").eq(3).addClass("a");
		}else{
			$("#zlrz li").eq(0).addClass("a");
		}
		//结算条件
		if(jstype=="1"){
			$("#jstj li").eq(1).addClass("a");
		}else if(jstype=="2"){
			$("#jstj li").eq(2).addClass("a");
		}else if(jstype=="3"){
			$("#jstj li").eq(3).addClass("a");
		}else{
			$("#jstj li").eq(0).addClass("a");
		}
		
	$('li').click(function () { $(this).addClass('a').siblings().removeClass('a') })

	})

	//拼接url
	function geturl(){
		var protype=$("#protype").val();
		var pxrule=$("#pxrule").val();
		var rztype=$("#rztype").val();
		var jstype=$("#jstype").val();
		var url="productList?proType="+protype+"&proReserve1="+pxrule
				+"&proRztype="+rztype+"&proJstype="+jstype;
		window.location.href=url;
	}
	
	function protype(type){
		if(type=="0"){
			$("#protype").val("");
			geturl();
		}else if(type=="1"){
			$("#protype").val("1");
			geturl();
		}else if(type=="2"){
			$("#protype").val("2");
			geturl();
		}
	}
	
	function pxrule(type){
		if(type=="0"){
			$("#pxrule").val("");
			geturl();
		}else if(type=="1"){
			$("#pxrule").val("1");
			geturl();
		}else if(type=="2"){
			$("#pxrule").val("2");
			geturl();
		}else if(type=="3"){
			$("#pxrule").val("3");
			geturl();
		}
	}
	
	function rztype(type){
		if(type=="0"){
			$("#rztype").val("");
			geturl();
		}else if(type=="1"){
			$("#rztype").val("1");
			geturl();
		}else if(type=="2"){
			$("#rztype").val("2");
			geturl();
		}else if(type=="3"){
			$("#rztype").val("3");
			geturl();
		}
	}
	
	function jstype(type){
		if(type=="0"){
			$("#jstype").val("");
			geturl();
		}else if(type=="1"){
			$("#jstype").val("1");
			geturl();
		}else if(type=="2"){
			$("#jstype").val("2");
			geturl();
		}else if(type=="3"){
			$("#jstype").val("3");
			geturl();
		}
	}
	
	
	$(function(){
	})