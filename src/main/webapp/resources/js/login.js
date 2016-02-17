$("#go-login").on("click",function(){
	if($("#sign-in").css("display")=="none"){
		 $(".login-box").val("");
		 $(".login-label").text("");
	}
});

$("#login-btn").on("click",function(){
	var id=$("#loginid").val();
	var pw=$("#loginpw").val();
	if(id==""){
		 $("#id-label").text("E-Mail을 입력하세요");
		   var msg = $("#id-label");
		   msg.animate({ opacity: '1'}, "slow");
	       msg.animate({ opacity: '0'}, "slow");
	       msg.animate({ opacity: '1'}, "slow");
	       return false;
	}
	
	if(pw==""){
		 $("#pw-label").text("패스워드를 입력하세요");
		 var msg = $("#pw-label");
		   msg.animate({ opacity: '1'}, "slow");
	       msg.animate({ opacity: '0'}, "slow");
	       msg.animate({ opacity: '1'}, "slow");
	       return false;
	}
	
	 var idpw=$("#login-form").serialize();
	 $.ajax({
	        url:"login",
	        type:"post",
	        data: idpw,
	        dataType:"xml",
	        error:function(){alert("Ajax error!!")},
	        success:function(result){
	        	
	        	
	        }//통신완료
	     });//ajax끝
	
});