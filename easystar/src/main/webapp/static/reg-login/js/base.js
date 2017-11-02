//datagrid 查询
function doSearch(id, params){
	$(id).datagrid('options').pageNumber = 1;
	$(id).datagrid('options').queryParams = params;
	// 刷新表格
	dgReload(id);
}

//刷新表格
function dgReload(id){
	$(id).datagrid("reload");
}

//打开弹出层
function openDialog(id){
	$(id).dialog('open');
}
//关闭弹出层
function closeDialog(id){
	$(id).dialog('close');
}

Date.prototype.format = function (format) {
    var o = {
        "M+": this.getMonth() + 1,
        "d+": this.getDate(),
        "h+": this.getHours(),
        "m+": this.getMinutes(),
        "s+": this.getSeconds(),
        "q+": Math.floor((this.getMonth() + 3) / 3),
        "S": this.getMilliseconds()
    }
    if (/(y+)/.test(format)) {
        format = format.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    }
    for (var k in o) {
        if (new RegExp("(" + k + ")").test(format)) {
            format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k] : ("00" + o[k]).substr(("" + o[k]).length));
        }
    }
    return format;
}