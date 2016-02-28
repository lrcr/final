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
	        error:function(){alert("잘못된 로그인 정보입니다")},
	        success:function(result){
	        	
	        	var nicknm=decodeURIComponent($(result).find("nicknm").text());
	        	success =$(result).find("login").text();
                success=parseInt(success);
                if(success>0) {
	                 alert(nicknm+"님 환영합니다!");
					if(nicknm!="관리자"){
						$("#go-login").hide();
						var span = $("#login-nav span").html();
						$("#login-nav span").remove();
						$("#login-nav").prepend(span);
						$(".navnicknm").html(nicknm+"님<span class=\"caret\"></span>");
						$("#login-nav .hid").removeClass("hid");
//	                 $("#login-nav").html(
//	                		 "<a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\" role=\"button\" aria-expanded=\"false\">"+nicknm+"님<span class=\"caret\"></span></a>" +
//	                		 "<ul class=\"dropdown-menu\" role=\"menu\">" +
//	                		 	"<li><a href=\"javascript:myinfoview();\" >나의 정보</a></li>" +
//	                		 	"<li><a href=\"#\">나의 맛집</a></li>" +
//	                		 	"<li><a href=\"#\">예약 확인</a></li>" +
//	                		 "</ul>"
//	                 );
	                 }else if(nicknm=="관리자"){
	                	 $("#login-nav").html(
	    		                 "<a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\" role=\"button\" aria-expanded=\"false\">"
	    							+nicknm+"님 <span class=\"caret\"></span>"+
	    						"</a>"+
	    						"<ul class=\"dropdown-menu\" role=\"menu\">"+
	    							"<li><a href=\"#\" class=\"myinfo\" data-toggle=\"modal\" data-target=\"#myInfo\">나의 정보</a></li>" +
	    							"<li><a href=\"bookmarklist\">나의 맛집</a></li>"+
	    							"<li><a href=\"reservelist\">예약 확인</a></li>"+
	    							"<li><a href=\"admin\">관리자홈</a></li>"+
	    						"</ul>"
	    						);
	                 }
	                 
	                 $("#signup-nav").html(
	                		 "<a href=\"logout\" id=\"logout\">로그아웃</a>"
	                 );
	                 
	                 $(".req-login-check").html("<button type=\"button\" class=\"btn btn-primary\"data-toggle=\"modal\" data-target=\"#community-write\">글쓰기</button>");
	               
	                 $(".disabled-input").attr("disabled",false);
	                 $(".disabled-input").attr("placeholder","댓글을 입력하세요");
	                 $(".eval-btn").attr("disabled",false);
                }
                else {
                	alert("잘못된 로그인 정보입니다");
                }
	        	
	        }//통신완료
	     });//ajax끝
});




