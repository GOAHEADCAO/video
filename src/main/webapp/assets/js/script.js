$(function(){
	var pass1 = $('#password1'),
	  user=$("#user"),
		pass2 = $('#password2'),
		email = $('#email'),
		form = $('#main form'),
		arrow = $('#main .arrow');
	$('#main .row input').val('');
	$("#user").bind('input propertychange',function(){
		if($("#user").val().length<8){
			$("input[type='submit']").val("请输入正确的学号!");
			user.parent().addClass('error').removeClass('success');
		}
		else{
			$("input[type='submit']").val("注册");
			user.parent().removeClass('error').addClass('success');
		}
	});
/*	form.on('submit',function(e){
		if($('#main .row.success').length == $('#main .row').length){
			alert("欢迎使用EF直播平台，感谢您的注册！");
			e.preventDefault();
		}
		else{
			e.preventDefault();
		}
	});*/
	email.bind('input propertychange',function(){
		if (!/^\S+@\S+\.\S+$/.test(email.val())){
			email.parent().addClass('error').removeClass('success');
			$("input[type='submit']").attr("disabled","true");
		}
		else{
			email.parent().removeClass('error').addClass('success');
		}
	});
	pass1.complexify({minimumChars:6, strengthScaleFactor:0.7}, function(valid, complexity){
		if(valid){
			pass2.removeAttr('disabled');
			pass1.parent().removeClass('error').addClass('success');
		}
		else{
			pass2.attr('disabled','true');
			pass1.parent().removeClass('success').addClass('error');
		}
		var calculated = (complexity/200)*268 - 134;
		var prop = 'rotate('+(calculated)+'deg)';
		arrow.css({
			'-moz-transform':prop,
			'-webkit-transform':prop,
			'-o-transform':prop,
			'-ms-transform':prop,
			'transform':prop
		});
	});
	pass2.on('keydown input',function(){
		if(pass2.val() == pass1.val()){
			var sexval=$("input:radio[name='sex']:checked").val();
			pass2.parent().removeClass('error').addClass('success');
			$("input[type='submit']").removeAttr("disabled","true");
			$("input[type='submit']").val("注册");
		}
		else{
			var sexval=$("input:radio[name='sex']:checked").val();
			if(sexval==undefined){
				sexval="亲";
			}else{
				sexval=$("input:radio[name='sex']:checked").val();
			}
			pass2.parent().removeClass('success').addClass('error');
			$("input[type='submit']").attr("disabled","true");
			$("input[type='submit']").val(sexval+","+"两次密码输入不一致哦！");
		}

	});
	if($("input:radio[name='sex']:checked").val()==null){
		$("input[type='submit']").attr("disabled",true);
	}
	else{
		$("input[type='submit']").removeAttr("disabled",true);
	}
});
