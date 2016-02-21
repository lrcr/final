$("#go-join").on("click",function(){
	if($("#sign-up").css("display")=="none"){
		 $(".joinbox").val("");
		 $(".joinlabel").text("");
	}
});

$('#emailinput').on('focusout',function(){
   var idval = $('#emailinput').val();
   var leng = idval.length;
   
   if(leng==0){
      $('#emailMsg').text("사용하실 E-Mail 주소를 입력해주세요");
   }
   else{
      $('#emailMsg').text("");
   }
      
});


$('#nicknameinput').on('focusout',function(){
   var nmval = $(this).val();
   var leng = nmval.length;
   if(leng==0){
	   $('#nicknmMsg').text("사용하실 닉네임을 입력해주세요");
   }
   else if(leng!=0){
	   $('#nicknmMsg').text("");
   }
});

$('#password1').on('focusout',function(){
   var pwval = $('#password1').val();
   var leng = pwval.length;
   
   var sutja,munja;
    sutja= false;
    munja = false;
    
    for(var i=0; i<pwval.length; i++){
       var idx = pwval.charAt(i).charCodeAt();
       if(idx>47&&idx<58){
            sutja = true;
        }else if(idx>64&&idx<123){
            munja =true;
        }
    }
    
    if(!(munja&&sutja)){
       $("#pw1Msg").text("영문과 숫자를 조합 해야 합니다.");
    }
   
    //비밀번호 자리 수
    else if(leng<4||leng>12){
       $("#pw1Msg").text("4자리 이상 12자리 이하로 입력 하세요");
       return false;
   }else{
      $("#pw1Msg").text("");
   }
});

$('#password2').on('focusout',function(){
   var pw1val = $('#password1').val();
   var pw2val = $('#password2').val();
   
   if(pw2val==""){
      $("#pw2Msg").text("비밀번호를 입력하세요");
   }
   else if(pw1val!=pw2val){
      $("#pw2Msg").text("비밀번호가 일치하지 않습니다");
   }else {
      $("#pw2Msg").text("");
   }
});


$('#phone').on('focusout',function(){
   var phnmval =$(this).val();
   var leng = phnmval.length;
   
   if(leng==0){
      $("#phoneMsg").text("번호를 입력하세요");
   }
   else{
	      var chksum=0;
	      for(var i=0; i<phnmval.length; i++){
	         var idx = phnmval.charAt(i).charCodeAt();
	         if(!(idx>47&&idx<58)){
	        	 chksum= chksum+1;
	         }
	      }
      
         if(chksum==0){
        	 $("#phoneMsg").text("");
         }
         else{
        	 $("#phoneMsg").text("숫자 이외에는 입력이 불가합니다");
         }
   }
});

var emok=0;
var emailchk="";
var nmok=0;
var nmchk="";

//email 중복체크
$('#emailcheck').on('click',function (){
   var idval = $('#emailinput').val();
   var leng = idval.length;
   
   if(leng==0){
      $('#emailMsg').text("사용하실 E-Mail 주소를 입력해주세요");
      var msg=$("#emailMsg")
      msg.animate({ opacity: '1'}, "slow");
      msg.animate({ opacity: '0'}, "slow");
      msg.animate({ opacity: '1'}, "slow");
   }
   
   else if(leng!=0){
         var cnt=0;
         for(var i=0; i<idval.length;i++){
            if(idval.charAt(i)=='@'||idval.charAt(i)=='.')
             cnt=cnt+1;
            else cnt=cnt+0;
         }
         if(cnt!=2){
            $('#emailMsg').text("E-Mail 형식이 아닙니다.");
            var msg=$("#emailMsg")
            msg.animate({ opacity: '1'}, "slow");
            msg.animate({ opacity: '0'}, "slow");
            msg.animate({ opacity: '1'}, "slow");
         }
         else{
            var em=$('#emailinput').serialize();
            $.ajax({
               url:"emailchk",
               type:"post",
               data: em,
               dataType:"xml",
               error:function(){alert("Ajax error!!")},
               success:function(result){
                  success =$(result).find("success").text();
                  success=parseInt(success);
                  if(success>0) {
                     $('#emailMsg').text("이미 사용중인 E-mail 입니다");
                     var msg=$("#emailMsg")
                     msg.animate({ opacity: '1'}, "slow");
                     msg.animate({ opacity: '0'}, "slow");
                     msg.animate({ opacity: '1'}, "slow");
                     $('#emailinput').val('');
                  }
                  else {
                     $('#emailMsg').text("사용가능한 E-mail 입니다");
                     var msg=$("#emailMsg")
                     msg.animate({ opacity: '1'}, "slow");
                     msg.animate({ opacity: '0'}, "slow");
                     msg.animate({ opacity: '1'}, "slow");
                     emok=1;
                     emailchk=idval;
                  }
               }//통신완료
            });//ajax끝
         }
   }
});

//닉네임 중복체크
$('#nmcheck').on('click',function (){
	   var idval = $('#nicknameinput').val();
	   var leng = idval.length;
	   
	   if(leng==0){
	      $('#nicknmMsg').text("사용하실 닉네임을 입력해주세요");
	      var msg=$("#nicknmMsg")
	      msg.animate({ opacity: '1'}, "slow");
	      msg.animate({ opacity: '0'}, "slow");
	      msg.animate({ opacity: '1'}, "slow");
	   }
	   
	   else if(leng!=0){
	            var em=$('#nicknameinput').serialize();
	            $.ajax({
	               url:"nicknmchk",
	               type:"post",
	               data: em,
	               dataType:"xml",
	               error:function(){alert("Ajax error!!")},
	               success:function(result){
	                  success =$(result).find("success").text();
	                  success=parseInt(success);
	                  if(success>0) {
	                     $('#nicknmMsg').text("이미 사용중인 닉네임 입니다");
	                     var msg=$("#nicknameMsg");
	                     msg.animate({ opacity: '1'}, "slow");
	                     msg.animate({ opacity: '0'}, "slow");
	                     msg.animate({ opacity: '1'}, "slow");
	                     $('#nicknamelinput').val('');
	                  }
	                  else {
	                     $('#nicknmMsg').text("사용가능한 닉네임 입니다");
	                     var msg=$("#nicknameMsg");
	                     msg.animate({ opacity: '1'}, "slow");
	                     msg.animate({ opacity: '0'}, "slow");
	                     msg.animate({ opacity: '1'}, "slow");
	                     nmok=1;
	                     nmchk=idval;
	                  }
	               }//통신완료
	            });//ajax끝
	         }
	   
	});

$('#submit-btn').on('click',function(){
   var id = $('#emailinput').val().length;
   var nm = $('#nicknameinput').val().length;
   var pw1 = $('#password1').val().length;
   var pw2 = $('#password2').val().length;
   var ph = $('#phone').val().length;
   
   
   if(id==0){
      $('#emailMsg').text("사용하실 E-Mail 주소를 입력해주세요");
       var msg = $("#emailMsg");
       msg.animate({ opacity: '1'}, "slow");
       msg.animate({ opacity: '0'}, "slow");
       msg.animate({ opacity: '1'}, "slow");
       return false;
   }   
   
    if(pw1==0){
      $("#pw1Msg").text("비밀번호를 입력하세요");
      var msg = $("#pw1Msg");
       msg.animate({ opacity: '1'}, "slow");
       msg.animate({ opacity: '0'}, "slow");
       msg.animate({ opacity: '1'}, "slow");
       return false;
   }
    
   if(pw2==0){
      $("#pw2Msg").text("비밀번호를 한번 더 입력하세요");
      var msg = $("#pw2Msg");
       msg.animate({ opacity: '1'}, "slow");
       msg.animate({ opacity: '0'}, "slow");
       msg.animate({ opacity: '1'}, "slow");
       return false;
   }
   if($("#pw1Msg").text()!=""){
	   var msg = $("#pw1Msg");
	   msg.animate({ opacity: '1'}, "slow");
       msg.animate({ opacity: '0'}, "slow");
       msg.animate({ opacity: '1'}, "slow");
       return false;
   }
   
   if($("#pw2Msg").text()!=""){
	   var msg = $("#pw2Msg");
	   msg.animate({ opacity: '1'}, "slow");
       msg.animate({ opacity: '0'}, "slow");
       msg.animate({ opacity: '1'}, "slow");
       return false;
   }
   
   if($("#pw1Msg").text()!=$("#pw2Msg").text()){
	   $("#pw2Msg").text("비밀번호가 일치하지 않습니다");
	   var msg = $("#pw2Msg");
	   msg.animate({ opacity: '1'}, "slow");
       msg.animate({ opacity: '0'}, "slow");
       msg.animate({ opacity: '1'}, "slow");
       return false;
   }
   
   if(nm==0){
	      $('#nicknmMsg').text("닉네임을 입력하세요");
	       var msg = $("#nicknmMsg");
	       msg.animate({ opacity: '1'}, "slow");
	       msg.animate({ opacity: '0'}, "slow");
	       msg.animate({ opacity: '1'}, "slow");
	       return false;
	    }
    
    if(ph==0){
      $("#phoneMsg").text("번호를 입력하세요");
      var msg = $("#phoneMsg");
       msg.animate({ opacity: '1'}, "slow");
       msg.animate({ opacity: '0'}, "slow");
       msg.animate({ opacity: '1'}, "slow");
       return false;
    }
    
    if(emok!=1){
    	$("#emailMsg").text("E-mail 중복체크가 필요합니다");
    	 var msg = $("#emailMsg");
         msg.animate({ opacity: '1'}, "slow");
         msg.animate({ opacity: '0'}, "slow");
         msg.animate({ opacity: '1'}, "slow");
         return false;
      }
      else if(emok==1){
         if($('#emailinput').val()!==emailchk){
        	 $('#emailMsg').text("E-mail 중복체크가 필요합니다");
        	 var msg = $("#emailMsg");
        	 msg.animate({ opacity: '1'}, "slow");
             msg.animate({ opacity: '0'}, "slow");
             msg.animate({ opacity: '1'}, "slow");
             return false;
         }
      }
    
    if(nmok!=1){
    	$("#nicknmMsg").text("닉네임 중복체크가 필요합니다");
    	 var msg = $("#nicknmMsg");
         msg.animate({ opacity: '1'}, "slow");
         msg.animate({ opacity: '0'}, "slow");
         msg.animate({ opacity: '1'}, "slow");
         return false;
      }
      else if(nmok==1){
         if($('#nicknameinput').val()!==nmchk){
        	 $('#nicknmMsg').text("닉네임 중복체크가 필요합니다");
        	 var msg = $("#nicknmMsg");
        	 msg.animate({ opacity: '1'}, "slow");
             msg.animate({ opacity: '0'}, "slow");
             msg.animate({ opacity: '1'}, "slow");
             return false;
         }
      }
    if($("#phoneMsg").text()!=""){
    	var msg = $("#phoneMsg");
    	msg.animate({ opacity: '1'}, "slow");
        msg.animate({ opacity: '0'}, "slow");
        msg.animate({ opacity: '1'}, "slow");
        return false;
    }
    
    //회원가입 버튼 누를 때
    var agree="";
    var success=0;
    if($("#option1").prop("checked")==true)
    	{
    		agree="ok";
    	}
    else{ agree="no"; }
    	
    $.ajax({
        url:"join",
        type:"post",
        data: {email:$("#emailinput").val(),
        		pw:$("#password2").val(),
        		nicknm:$("#nicknameinput").val(),
        		phone:$("#phone").val(),
        		agree:agree
        },
        error:function(){alert("Ajax error!!")},
        success:function(result){
        	alert("가입되셨습니다!");
        }//통신완료
     });//ajax끝
    
});


