$(function(){
	$.cookie.raw=true
	//login check
	loginCheck();
	//login
	$("#login_submit").click(function(){
		$.ajax({
			type:"POST",
			url:"login",
			data:{
				username:$("#login_username").val(),
				password:$("#login_password").val()
			},
			dataType:"json",
			success:function(data,textStatus){
				if(data.result=='ok'){
					if($("#check1").is(":checked")){
						$.cookie('userpass',$("#login_username").val()+'|'+$("#login_password").val(),{expires:7})
					}else{
						$.cookie('userpass',$("#login_username").val()+'|'+$("#login_password").val())
					}
					$("#login_close").click()
					login_success()
				}else{
					alert('Username or password is not right')
				}
			},
			error:function(XMLHttpRequest,textStatus,errorThrown){
				alert("errorThrown")
			}
		})
	})
	//sign out
	$("#sign_out").click(function(){
		$.removeCookie('userpass');
		window.location.reload()
	})
	//register sign up check
	signup_input_check()
	//sign up
	$("#signup_submit").click(function(){
		if($("#signup_username").val()==""||$("#signup_password1").val()==""||$("#signup_password2").val()==""||$('#email').val()==""){
			alert('None of the field should be empty!')
			return false
		}else{
			$.ajax({
				type:"POST",
				url:"signup",
				dataType:"json",
				data:{
					username:$("#signup_username").val(),
					password:$("#signup_password1").val(),
					email:$('#email').val()
				},
				success:function(data,textStatus){
					if(data.result=='ok'){
						if($('#check2').is(':checked')){
							$.cookie('userpass',$('#signup_username').val()+'|'+$('#signup_password1').val(),{expires:7})
						}else{
							$.cookie('userpass',$('#signup_username').val()+'|'+$('#signup_password1').val())
						}
						$('#signup_close').click()
						login_success();
					}else{
						alert('sorry, create user error, please try again!');
					}
				},
				error:function(XMLHttpRequest,textStatus,errorThrown){
					alert('error!')
				}
			})
		}
	})
})

function loginCheck(){
	if($.cookie('userpass')){
		var userpass=$.cookie('userpass')
		var user=userpass.split('|')[0]
		var pass=userpass.split('|')[1]
		$.ajax({
			type:"post",
			url:"login",
			data:{
				username:user,
				password:pass
			},
			dataType:"json",
			success:function(data,textStatus){
				login_success()
			},
			error:function(XMLHttpRequest,textStatus,errorThrown){
				alert("errorThrown")
			}
		})
	}
}

function login_success(){
	$("#navbar_ul").show()
	$("#button_div").hide()
	$("#sign_out").show()
}

function signup_input_check(){
	$("#signup_form :input").blur(function(){
		if($(this).is("#signup_username")){
			$.ajax({
				type:"post",
				url:"signup_check",
				data:{username:$("#signup_username").val()},
				dataType:"json",
				success:function(data,textStatus){
					if(data.result=='exist'){
						$("#signup_tag1").remove();
						$("#signup_username").after("<small class='form-text text-danger' id='signup_tag1'>This username already exists.</small>")
						$("#signup_submit").attr('disabled','true');
					}else{
						$("#signup_tag1").remove();
						$("#signup_username").after("<small class='form-text text-success' id='signup_tag1'>This username is ok.</small>")
						$("#signup_submit").removeAttr('disabled')
					}
				},
				error:function(XMLHttpRequest,textStatus,errorThrown){
					alert(errorThrown)
				}
			})
		}
		if($(this).is("#signup_password1")){
			if($("#signup_password1").val()==""){
				$("#signup_tag2").remove();
				$("#signup_password1").after("<small class='form-text text-danger' id='signup_tag2'>Password can't be empty.</small>")
				$("#signup_submit").attr('disabled','true');
			}else{
				$("#signup_tag2").remove();
				$("#signup_password1").after("<small class='form-text text-success' id='signup_tag2'>Password ok.</small>")
				$("#signup_submit").removeAttr('disabled')
			}
		}
		if($(this).is("#signup_password2")){
			if($("#signup_password2").val()!=$("#signup_password1").val()){
				$("#signup_tag3").remove();
				$("#signup_password2").after("<small class='form-text text-danger' id='signup_tag3'>Two passwords must be the same.</small>")
				$("#signup_submit").attr('disabled','true');
			}else{
				$("#signup_tag3").remove();
				$("#signup_password2").after("<small class='form-text text-success' id='signup_tag3'>Retype password ok.</small>")
				$("#signup_submit").removeAttr('disabled')
			}
		}
	})
}