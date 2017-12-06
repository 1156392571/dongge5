$(function(){
		var ptjWorkarea=$("#ptjWorkarea").val();
		var ptjCompanytype=$("#ptjCompanytype").val();
		var ptjJstype=$("#ptjJstype").val();
		//工作区域
		if(ptjWorkarea=="1"){
			$("#gzqy li").eq(1).addClass("a");
		}else if(ptjWorkarea=="2"){
			$("#gzqy li").eq(2).addClass("a");
		}else if(ptjWorkarea=="3"){
			$("#gzqy li").eq(3).addClass("a");
		}else if(ptjWorkarea=="4"){
			$("#gzqy li").eq(4).addClass("a");
		}else if(ptjWorkarea=="5"){
			$("#gzqy li").eq(5).addClass("a");
		}else if(ptjWorkarea=="6"){
			$("#gzqy li").eq(6).addClass("a");
		}else if(ptjWorkarea=="7"){
			$("#gzqy li").eq(7).addClass("a");
		}else if(ptjWorkarea=="8"){
			$("#gzqy li").eq(8).addClass("a");
		}else if(ptjWorkarea=="9"){
			$("#gzqy li").eq(9).addClass("a");
		}else if(ptjWorkarea=="10"){
			$("#gzqy li").eq(10).addClass("a");
		}else if(ptjWorkarea=="11"){
			$("#gzqy li").eq(11).addClass("a");
		}else if(ptjWorkarea=="12"){
			$("#gzqy li").eq(12).addClass("a");
		}else if(ptjWorkarea=="13"){
			$("#gzqy li").eq(13).addClass("a");
		}else{
			$("#gzqy li").eq(0).addClass("a");
		}
		
		//公司类型
		if(ptjCompanytype=="1"){
			$("#gslx li").eq(1).addClass("a");
		}else if(ptjCompanytype=="2"){
			$("#gslx li").eq(2).addClass("a");
		}else if(ptjCompanytype=="3"){
			$("#gslx li").eq(3).addClass("a");
		}else{
			$("#gslx li").eq(0).addClass("a");
		}
		//结算方式
		if(ptjJstype=="1"){
			$("#jsfh li").eq(1).addClass("a");
		}else if(ptjJstype=="2"){
			$("#jsfh li").eq(2).addClass("a");
		}else if(ptjJstype=="3"){
			$("#jsfh li").eq(3).addClass("a");
		}else{
			$("#jsfh li").eq(0).addClass("a");
		}
		
	$('li').click(function () { $(this).addClass('a').siblings().removeClass('a') })

	})

	//拼接url
	function geturl(){
		var ptjWorkarea=$("#ptjWorkarea").val();
		var ptjCompanytype=$("#ptjCompanytype").val();
		var ptjJstype=$("#ptjJstype").val();
		var url=ctx+"/partTimeJobList?ptjWorkarea="+ptjWorkarea
			+"&ptjCompanytype="+ptjCompanytype+"&ptjJstype="+ptjJstype;
		window.location.href=url;
	}
	
	function workarea(type){
		if(type=="0"){
			$("#ptjWorkarea").val("");
			geturl();
		}else if(type=="1"){
			$("#ptjWorkarea").val("1");
			geturl();
		}else if(type=="2"){
			$("#ptjWorkarea").val("2");
			geturl();
		}else if(type=="3"){
			$("#ptjWorkarea").val("3");
			geturl();
		}else if(type=="4"){
			$("#ptjWorkarea").val("4");
			geturl();
		}else if(type=="5"){
			$("#ptjWorkarea").val("5");
			geturl();
		}else if(type=="6"){
			$("#ptjWorkarea").val("6");
			geturl();
		}else if(type=="7"){
			$("#ptjWorkarea").val("7");
			geturl();
		}else if(type=="8"){
			$("#ptjWorkarea").val("8");
			geturl();
		}else if(type=="9"){
			$("#ptjWorkarea").val("9");
			geturl();
		}else if(type=="10"){
			$("#ptjWorkarea").val("10");
			geturl();
		}else if(type=="11"){
			$("#ptjWorkarea").val("11");
			geturl();
		}else if(type=="12"){
			$("#ptjWorkarea").val("12");
			geturl();
		}else if(type=="13"){
			$("#ptjWorkarea").val("13");
			geturl();
		}
	}
	
	function companytype(type){
		if(type=="0"){
			$("#ptjCompanytype").val("");
			geturl();
		}else if(type=="1"){
			$("#ptjCompanytype").val("1");
			geturl();
		}else if(type=="2"){
			$("#ptjCompanytype").val("2");
			geturl();
		}else if(type=="3"){
			$("#ptjCompanytype").val("3");
			geturl();
		}
	}
	
	function jstype(type){
		if(type=="0"){
			$("#ptjJstype").val("");
			geturl();
		}else if(type=="1"){
			$("#ptjJstype").val("1");
			geturl();
		}else if(type=="2"){
			$("#ptjJstype").val("2");
			geturl();
		}else if(type=="3"){
			$("#ptjJstype").val("3");
			geturl();
		}else if(type=="4"){
			$("#ptjJstype").val("4");
			geturl();
		}
	}
	
	
