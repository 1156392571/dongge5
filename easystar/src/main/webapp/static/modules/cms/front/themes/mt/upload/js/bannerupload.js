jQuery(function() {

    	uploader_1 = new Array();//创建 uploader数组
    	// 优化retina, 在retina下这个值是2
        var ratio = window.devicePixelRatio || 1,
        // 缩略图大小
        thumbnailWidth = 100 * ratio,
        thumbnailHeight = 100 * ratio,
        supportTransition = (function(){
            var s = document.createElement('p').style,
            r = 'transition' in s ||
                  'WebkitTransition' in s ||
                  'MozTransition' in s ||
                  'msTransition' in s ||
                  'OTransition' in s;
	        s = null;
	        return r;
        })();
     	// 所有文件的进度信息，key为file id
        var percentages = {};
        var state = 'pedding';
    	
    	//可行性判断
    	if ( !WebUploader.Uploader.support() ) {
            alert( 'Web Uploader 不支持您的浏览器！如果你使用的是IE浏览器，请尝试升级 flash 播放器');
            throw new Error( 'WebUploader does not support the browser you are using.' );
        }
    	
    	//循环页面中每个上传域
    	$('.upload_container').each(function(index){
    		
            var statusBar=$(this).find('.statusBar');//再次添加按钮容器实例
            
            var info =statusBar.find('.info');//提示信息容器实例
            
            var upload = $(this).find( '.uploadBtn' );// 上传按钮
            
            var filePicker=$(this).find('#filePicker');//上传按钮实例
            
            var placeholder=$(this).find('.placeholder');//按钮与虚线框实例
    		
    		var queueList=$(this).find('.queueList');//拖拽容器实例
    		
    		var filePicker2=$(this).find('#filePicker2_'+index);//继续添加按钮实例
    		
    		// 图片容器       	
    		var queue = $('<ul class="filelist"></ul>').appendTo( queueList);
    		
    		// 添加的文件数量
            var fileCount = 0;
            // 添加的文件总大小
            var fileSize = 0;
    		
    		
    		//初始化上传实例
            uploader_1[index] = WebUploader.create({
            	//自动上传
            	auto :false,
            	
                pick: {
                    id: filePicker,
                    
                    label: '上传'
                },
                
                formData: {                
                	token:index,//可以在这里附加控件编号，从而区分是哪个控件上传的
                	
                	ImageType: "1"
                },
                
                dnd: '#dndArea',
                
                // swf文件路径
                swf: 'res/Uploader.swf',

                chunked: false,//是否分片处理大文件的上传
                chunkSize: 512 * 1024,
                
                server: '../a/upload?method=upload',//上传地址
                
                method:'POST',
                
                //这里可以根据 index 或者其他，使用变量形式
                accept: {
                    title: 'Images',
                    extensions: 'gif,jpg,jpeg,bmp,png,doc',
                    mimeTypes: 'image/*'
                },
                
                disableGlobalDnd: true,//禁用浏览器的拖拽功能，否则图片会被浏览器打开
                
                fileNumLimit: 2,//一次最多上传文件个数
                
                fileSizeLimit: 10 * 1024 * 1024,    // 总共的最大限制10M
                
                fileSingleSizeLimit: 3 * 1024 * 1024    // 单文件的最大限制3M
            });
    		

            // 添加“添加文件”的按钮
            uploader_1[index].addButton({
                id: filePicker2,
                label: '重新上传'
            });
            
            //加载的时候
            uploader_1[index].on('ready',function(){
            	state = 'pedding';
            	var fileinfo="";
            	if(index==0){
            		fileinfo = document.getElementById("bpUrlinfo").value;
            	}else if(index==1){
            		fileinfo = document.getElementById("scReserve2").value;
            	}else if(index==2){
            		fileinfo = document.getElementById("scReserve3").value;
            	}
            	if(fileinfo!==""){
	//            	var fileinfo = "WU_FILE_0,123.jpg,image/jpeg,8433,uploads\\1\\project\\20171013\\1507866273084_123.jpg";
	            	var files = new Array();
	            	files = fileinfo.split(",")
	            	var obj ={};
	            	statusMap = {};
					fileCount++;
	                fileSize += parseInt(files[3]);
	                if ( fileCount === 1 ) {
	                	placeholder.addClass( 'element-invisible' );
	                    statusBar.show();
	                }
	        		obj.id=files[0];
	                obj.name=files[1];
	                obj.type=files[2];
	                obj.size=parseInt(files[3]);
	                obj.ret=files[4];
	                obj.source=this;
	                obj.flog=true;
	                obj.status = 'complete',
	                obj.getStatus = function(){
	                	return '';
	                }
	                obj.version = WebUploader.Base.version;
	                obj.statusText = '';
	                obj.setStatus = function(){
	                	var prevStatus = statusMap[this.id];
	                	typeof text !== 'undefined' && (this.statusText = text);
	                	if(status !== prevStatus){
	                		statusMap[this.id] = status;
	                		//文件状态设置为已完成
	                		uploader_1[index].trigger('statuschage',status,prevStatus);
	                	}
	                }
	                editFile( obj,uploader_1[index],queue,index);
	                setState( 'edit' ,uploader_1[index],placeholder,queue,statusBar,filePicker2,upload);
	                updateStatus('edit',uploader_1[index],info,fileCount,fileSize);
            	}
            });
            
            //编辑时获取图片
            function editFile(file,now_uploader,queue,index){
            	var $li = $( '<li id="' + file.id + '">' +  
                        '<p class="title">' + file.name + '</p>' +  
                        '<p class="imgWrap"></p>'+  
                        '<p class="progress"><span></span></p>' +  
                        '</li>' ),  
      
                    $prgress = $li.find('p.progress span'),  
                    $wrap = $li.find( 'p.imgWrap' ),  
                    $info = $('<p class="error"></p>');  
                      
                if ( file.getStatus() === 'invalid' ) {  
                    showError( file.statusText );  
                } else {  
                    // @todo lazyload  
                	$wrap.text( '预览中' );
    	            if(file.flog == true){
    	            	var img = $('<img src="'+ctxw+"/"+file.ret+'" style="height:100%;">');
    	                $wrap.empty().append( img );
    	            }else{
    	            	now_uploader.makeThumb( file, function( error, src ) {
    	                    if ( error ) {
    	                        $wrap.text( '不能预览' );
    	                        return;
    	                    }
    	
    	                    var img = $('<img src="'+src+'">');
    	                    $wrap.empty().append( img );
    	                }, thumbnailWidth, thumbnailHeight );
    	            }
                      
                    percentages[ file.id ] = [ file.size, 0 ];  
                    file.rotation = 0;  
                }  
      
                $li.append( '<span class="success"></span>' );  
      
                $li.appendTo($(".filelist").eq(index));
            }
            
            // 当有文件添加进来时执行，负责view的创建
            function addFile( file,now_uploader,queue,index) {
                var $li = $( '<li id="' + file.id + '">' +
                        '<p class="title">' + file.name + '</p>' +
                        '<p class="imgWrap"></p>'+
                        '<p class="progress"><span></span></p>' +
                        '</li>' ),

                    $btns = $('<div class="file-panel">' +
                        '<span class="cancel">删除</span>' +
                        '<span class="rotateRight">向右旋转</span>' +
                        '<span class="rotateLeft">向左旋转</span></div>').appendTo( $li ),
                    $prgress = $li.find('p.progress span'),
                    $wrap = $li.find( 'p.imgWrap' ),
                    $info = $('<p class="error"></p>');
                    
    	            showError = function( code ) {
    	                switch( code ) {
    	                    case 'exceed_size':
    	                        text = '文件大小超出';
    	                        break;
    	
    	                    case 'interrupt':
    	                        text = '上传暂停';
    	                        break;
    	
    	                    default:
    	                        text = '上传失败，请重试';
    	                        break;
    	                }
    	
    	                $info.text( text ).appendTo( $li );
    	            };
    	
    	        if ( file.getStatus() === 'invalid' ) {
    	            showError( file.statusText );
    	        } else {           
                
    	            $wrap.text( '预览中' );
    	            if(file.flog == true){
    	            	var img = $('<img src="'+file.ret+'">');
    	                $wrap.empty().append( img );
    	            }else{
    	            	now_uploader.makeThumb( file, function( error, src ) {
    	                    if ( error ) {
    	                        $wrap.text( '不能预览' );
    	                        return;
    	                    }
    	
    	                    var img = $('<img src="'+src+'">');
    	                    $wrap.empty().append( img );
    	                }, thumbnailWidth, thumbnailHeight );
    	            }
    	
    	            percentages[ file.id ] = [ file.size, 0 ];
    	            file.rotation = 0;
    	        }
    	        
                //状态改变
                file.on('statuschange', function( cur, prev ) {
                    if ( prev === 'progress' ) {
                        $prgress.hide().width(0);
                    } else if ( prev === 'queued' ) {
                        $li.off( 'mouseenter mouseleave' );
                        $btns.remove();
                    }

                    // 成功
                    if ( cur === 'error' || cur === 'invalid' ) {
                        console.log( file.statusText );
                        showError( file.statusText );
                        percentages[ file.id ][ 1 ] = 1;
                    } else if ( cur === 'interrupt' ) {
                        showError( 'interrupt' );
                    } else if ( cur === 'queued' ) {
                        percentages[ file.id ][ 1 ] = 0;
                    } else if ( cur === 'progress' ) {
                        $info.remove();
                        $prgress.css('display', 'block');
                    } else if ( cur === 'complete' ) {
                        $li.append( '<span class="success"></span>' );
                    }

                    $li.removeClass( 'state-' + prev ).addClass( 'state-' + cur );
                });
                
                
                $li.on( 'mouseenter', function() {
                    $btns.stop().animate({height: 30});
                });

                $li.on( 'mouseleave', function() {
                    $btns.stop().animate({height: 0});
                });
                

                $btns.on( 'click', 'span', function() {
                    var index = $(this).index(),
                        deg;

                    switch ( index ) {
                        case 0:
                        	now_uploader.removeFile( file );
                            return;

                        case 1:
                            file.rotation += 90;
                            break;

                        case 2:
                            file.rotation -= 90;
                            break;
                    }

                    if ( supportTransition ) {
                        deg = 'rotate(' + file.rotation + 'deg)';
                        $wrap.css({
                            '-webkit-transform': deg,
                            '-mos-transform': deg,
                            '-o-transform': deg,
                            'transform': deg
                        });
                    } else {
                        $wrap.css( 'filter', 'progid:DXImageTransform.Microsoft.BasicImage(rotation='+ (~~((file.rotation/90)%4 + 4)%4) +')');
                        
                    }

                });
                
                //清空标签
                queue.empty($(".filelist").eq(index));
                
                
                $li.appendTo($(".filelist").eq(index));
            }
            
            // 负责view的销毁
            function removeFile( file ) {
                var $li = $('#'+file.id);
                delete percentages[ file.id ];
               
                $li.off().find('.file-panel').off().end().remove();
            } 
            
            //
            function updateStatus(val,now_uploader,info,f_count,f_size) {
                var text = '';

                if ( val === 'ready' ) {
                    text = '选中' + f_count + '张图片，共' +
                            WebUploader.formatSize( f_size ) + '。';
                }else {
                	stats = now_uploader.getStats();
                    text = '共' + fileCount + '个（' +
                            WebUploader.formatSize( fileSize )  +
                            '），已上传' + stats.successNum + '个';
                } 
                
                info.html( text );
            } 
            
            //判断当前状态
            function setState( val, now_uploader,placeHolder,queue,statusBar,filePicker2,upload) {
            	var file, stats;
                if ( val === state ) {
                    return;
                }
                upload.removeClass( 'state-' + state );
                upload.addClass( 'state-' + val );
                state = val;
            	
                switch ( state ) {
                    case 'pedding':
                        placeHolder.removeClass( 'element-invisible' );
//                        queue.parent().removeClass('filled');
                        queue.hide();
//                        statusBar.addClass( 'element-invisible' );
                        now_uploader.refresh();
                        break;
                    case 'ready':
                        placeHolder.addClass( 'element-invisible' );
                        filePicker2.addClass( 'element-invisible');
//                        queue.parent().addClass('filled');
                        queue.show();
                        statusBar.removeClass('element-invisible');
                        now_uploader.refresh();
                        break;  
                    case 'paused':
//                        $progress.show();
//                        $upload.text( '继续上传' );
                        break;
                    case 'confirm':
//                      $progress.hide();
                        upload.text( '开始上传' );
                        stats = now_uploader.getStats();
                        if ( stats.successNum && !stats.uploadFailNum ) {
                            setState( 'finish' ,now_uploader,placeholder,queue,statusBar,filePicker2,upload);
                            return;
                        }
                        break;
                    case 'finish':
                    	filePicker2.removeClass( 'element-invisible');
                        stats = now_uploader.getStats();
                        if ( stats.successNum ) {
                        	//上传成功操作
//                            document.getElementById("shareUrl").style.visibility = 'hidden';
//                            createQrcode();
                        	  upload.text( '开始上传' );
                        	  now_uploader.reset();
                        } else {
                            // 没有成功的图片，重设
                            state = 'done';
                            location.reload();
                        }
                        break;
                    case 'edit':
//                      $progress.show();
//                      $upload.text( '继续上传' );
                    	filePicker2.removeClass( 'element-invisible');
                    	queue.show();
                        statusBar.removeClass('element-invisible');
                        now_uploader.refresh();
                      break;   
                }
            }
            
            //可以在这里附加额外上传数据
            uploader_1[index].on('uploadBeforeSend',function(object,data,header) {
            	/*var tt=$("input[name='id']").val();
            	data=$.extend(data,{
            		modelid:tt
            		});*/
//                alert("上传前触发");
            });
            
            
            //上传成功操作
            uploader_1[index].on('uploadSuccess',function(file,response){
            	var realurl = response.realPath; //上传图片的路径
            	var fileinfo = response.fileinfo; //上传图片的路径
            	//判断图片地址存放的位置
            	if(index==0){
            		document.getElementById("bpUrl").value = realurl;
            		document.getElementById("bpUrlinfo").value = fileinfo;
            	}else if(index==1){
            		document.getElementById("scPhotourl2").value = realurl;
            		document.getElementById("scReserve2").value = fileinfo;
            	}else if(index==2){
            		document.getElementById("scPhotourl3").value = realurl;
            		document.getElementById("scReserve3").value = fileinfo;
            	}
            });
            
            // 所有文件上传成功后调用        
            uploader_1[index].on('uploadFinished', function () {
                //清空队列
//            	uploader_1[index].reset();
            });
            
            
            //当文件加入队列时触发	uploader[0].upload();
            uploader_1[index].onFileQueued = function( file ) {
            	//初始化
            	fileCount = 0;
            	fileSize = 0;
            	
    			fileCount++;
                fileSize += file.size;

                if ( fileCount === 1 ) {
                	placeholder.addClass( 'element-invisible' );
                    statusBar.show();
                }
                
                addFile( file,uploader_1[index],queue,index);
                setState( 'ready' ,uploader_1[index],placeholder,queue,statusBar,filePicker2,upload);
                updateStatus('ready',uploader_1[index],info,fileCount,fileSize);
            };
            
    		//当文件被移除队列后触发。
            uploader_1[index].onFileDequeued = function( file ) {
            	fileCount--;
                fileSize -= file.size;
                if ( !fileCount ) {
                    setState( 'pedding',uploader_1[index],placeholder,queue,statusBar,filePicker2,upload);
                    updateStatus('pedding',uploader_1[index],info,fileCount,fileSize);
                }              
                removeFile( file );
            };
            
            //
            uploader_1[index].on( 'all', function( type ) {
                var stats;
                switch( type ) {
                    case 'uploadFinished':
                        setState( 'confirm',uploader_1[index],placeholder,queue,statusBar,filePicker2,upload);
                        break;

                    case 'startUpload':
                        setState( 'uploading',uploader_1[index],placeholder,queue,statusBar,filePicker2,upload);
                        break;

                    case 'stopUpload':
                        setState( 'paused' ,uploader_1[index],placeholder,queue,statusBar,filePicker2,upload);
                        break;
                }
            });
            
            uploader_1[index].onError = function( code ){
            	alert( 'Eroor: ' + code );
            }
            
            upload.on('click', function() {
                if ( $(this).hasClass( 'disabled' ) ) {
                    return false;
                }

                if ( state === 'ready' ) {
                	uploader_1[index].upload();
                } else if ( state === 'paused' ) {
                	uploader_1[index].upload();
                } else if ( state === 'uploading' ) {
                	uploader_1[index].stop();
                }else if( state === 'pedding' ){
                	info.html( "没有可上传的图片！" );
                }else if(state === 'finish'){
                }
            });
            
            upload.addClass( 'state-' + state );
            setState( 'pedding',uploader_1[index],placeholder,queue,statusBar,filePicker2,upload);
            updateStatus('pedding',uploader_1[index],info,fileCount,fileSize);
        
        
    });
        
});
