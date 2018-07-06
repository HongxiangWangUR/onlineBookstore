$(function(){
	$("#success_modal_button").click(function(){
		$.removeCookie('userpass')
		window.location.reload()
	})
	$("#change").click(function(){
		if($("#password").val()==""||$("#re_password").val()==""||$("#email").val()==""){
			alert("Please make sure you fill in all fields")
			return false;
		}
		if($("#password").val()!=$("#re_password").val()){
			alert("Please make sure two passwords are the same");
			return false;
		}
		$.ajax({
			url:"updateServlet",
			method:"post",
			data:{
				username:$("#username").val(),
				password:$("#password").val(),
				email:$("#email").val()
			},
			dataType:"json",
			success:function(data,textStatus){
				if(data.result=='ok'){
					$("#successModal").modal({
						backdrop:'static',
						keyboard:false
					})
					$("#success").click()
				}else{
					$("#error").click()
				}
			},
			error:function(XMLHttpRequest,textStatus,errorThrown){
				alert(errorThrown)
			}
		})
	})
})