$(function(){
		var tasktype=$("#tasktype").val();
		var pxrule=$("#pxrule").val();
		var rztype=$("#rztype").val();
		//产品类型
		if(tasktype=="1"){
			$("#cplx li").eq(1).addClass("a");
		}else if(tasktype=="2"){
			$("#cplx li").eq(2).addClass("a");
		}else if(tasktype=="3"){
			$("#cplx li").eq(3).addClass("a");
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
		}else if(pxrule=="4"){
			$("#pxgz li").eq(4).addClass("a");
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
		
	$('li').click(function () { $(this).addClass('a').siblings().removeClass('a') })

	})

	//拼接url
	function geturl(){
		var tasktype=$("#tasktype").val();
		var pxrule=$("#pxrule").val();
		var rztype=$("#rztype").val();
		var url=ctx+"/taskList?taskType="+tasktype+"&taskReserve1="+pxrule
				+"&taskRztype="+rztype;
		window.location.href=url;
	}
	
	function tasktype(type){
		if(type=="0"){
			$("#tasktype").val("");
			geturl();
		}else if(type=="1"){
			$("#tasktype").val("1");
			geturl();
		}else if(type=="2"){
			$("#tasktype").val("2");
			geturl();
		}else if(type=="3"){
			$("#tasktype").val("3");
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
		}else if(type=="4"){
			$("#pxrule").val("4");
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
	
	
