
jQuery(document).ready(function() {

    $('.page-container form').submit(function(){
        var username = $(this).find('.username').val();
        var password = $(this).find('.password').val();
        var scPhone = $(this).find('.tPhone').val();
        var reg = /^1[3|4|5|7|8][0-9]{9}$/; 
        if(username == '') {
            $(this).find('.error').fadeOut('fast', function(){
                $(this).css('top', '27px');
            });
            $(this).find('.error').fadeIn('fast', function(){
                $(this).parent().find('.username').focus();
            });
            return false;
        }
        if(password == '') {
            $(this).find('.error').fadeOut('fast', function(){
                $(this).css('top', '96px');
            });
            $(this).find('.error').fadeIn('fast', function(){
                $(this).parent().find('.password').focus();
            });
            alert("密码不能为空");
            return false;
        }
        if(reg.test(scPhone)==false||scPhone==''){
        	$(this).find('.error').fadeOut('fast', function(){
                $(this).css('top', '234px');
            });
        	 $(this).find('.error').fadeIn('fast', function(){
                 $(this).parent().find('.scPhone').focus();
             });
        	 alert("手机号格式不正确");
             return false;
        }
    });

    $('.page-container form .username, .page-container form .password, .page-container form .tPhone').keyup(function(){
        $(this).parent().find('.error').fadeOut('fast');
    });

});
