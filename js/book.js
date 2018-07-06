$(function(){
	$("#check").click(function(){
		var a=false;
		$("select[name=num]").each(function(index,item){
			if($(this).val()!=0)
				a=true
		})
		if(!a){
			alert("If you want to buy something you must make sure at least one number field is not zero");
			return false;
		}else{
			return true
		}
	})
})