function doGetSmsCode(){
	var phone=$("#mobile").val();
	var data={};
	data.phone=phone;
	$.ajax({
		url:'${ctx}/pay/getSmscode',
		type:'post',
		contentType : 'application/json;charset=utf-8',
		data : JSON.stringify(data),
		dateType : "json",
		success:function(data){
			alert(data);
		}
	})
}