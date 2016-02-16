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
		$("#pw2Msg").text("비밀번호를 입력하지 않았습니다");
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
		$("#phoneMsg").text("전화번호를 입력하세요");
	}
	else{
		for(var i=0; i<phnmval.length; i++){
			var idx = phnmval.charAt(i).charCodeAt();
			
			if(!(idx>47&&idx<58)){
				$("#phoneMsg").text("숫자 이외에는 입력이 불가합니다");
			}else{
				$("#phoneMsg").text("");
			}
		}
	}
});

var checkno=0;
var emailchk="";
var nmchk="";



$('.check-btn').on('click',function (){
	var idval = $('#id').val();
	var leng = idval.length;
	var e_Msg = document.getElementById("emailMsg");
	if(leng==0){
		$('#alert-box').show();
		$('#mask').show();
		$(".alert-body").text('E-mail을 입력하세요');
		
	}
	  else if(leng!=0){
			var cnt=0;
			for(var i=0; i<idval.length;i++){
				if(idval.charAt(i)=='@'||idval.charAt(i)=='.')
			 	cnt=cnt+1;
				else cnt=cnt+0;
			}
			if(cnt!=2){
				$('#alert-box').show();
				$('#mask').show();
				$('.alert-body').text("E-mail 형식이 아닙니다.");
			}
			else{
				var em=$('#id').serialize();
				$.ajax({
					url:"emailcheck.do",
					type:"post",
					data: em,
					dataType:"xml",
					error:function(){alert("Ajax error!!")},
					success:function(result){
						success =$(result).find("success").text();
						success=parseInt(success);
						if(success>0) {
							$('#alert-box').show();
							$('#mask').show();
							$('.alert-body').text("이미 사용중인 E-mail 입니다");
							$('#id').val('');
						}
						else {
							$('#alert-box').show();
							$('#mask').show();
							$('.alert-body').text("사용가능한 E-mail 입니다");
							checkno=1;
							emailchk=idval;
						}
					}//통신완료
				});//ajax끝
			}
	}
});

$('.submit-btn').on('click',function(){
	var id = $('#id').val().length;
	var pw1 = $('#pw1').val().length;
	var pw2 = $('#pw2').val().length;
	var nm = $('#nm').val().length;
	var ph = $('#phone-no').val().length;
	var e_msg = document.getElementById("emailMsg");
	var pw1_msg = document.getElementById("pw1Msg");
	var pw2_msg = document.getElementById("pw2Msg");
	var nmMsg = document.getElementById("nmMsg");
	var phoneMsg = document.getElementById("phoneMsg");
	
	if(id==0){
		e_msg.style.display="block";
		e_msg.ClassName="error";
		e_msg.innerHTML = "E-mail을 입력하세요";
		return false;
	}
	
	 if(pw1==0){
		pw1_msg.style.display="block";
		pw1_msg.ClassName="error";
		pw1_msg.innerHTML = "패스워드를 입력하세요";
		return false;
	}
	 
	 if(pw2==0){
		pw2_msg.style.display="block";
		pw2_msg.ClassName="error";
		pw2_msg.innerHTML = "패스워드를 다시 한 번 입력하세요";
		return false;
	}
	 
	 if(nm==0){
		nmMsg.style.display="block";
		nmMsg.ClassName="error";
		nmMsg.innerHTML = "이름을 입력하세요";
		return false; 
	 }
	 
	 if(ph==0){
		phoneMsg.style.display="block";
		phoneMsg.ClassName="error";
		phoneMsg.innerHTML = "번호를 입력하세요";
		return false;
	 }
	 if(checkno!=1){
			$('#alert-box').show();
			$('#mask').show();
			$('.alert-body').text("E-mail 중복검사가 필요합니다");
			return false;
		}
		else if(checkno==1){
			if($('#id').val()!=emailchk){
				$('#alert-box').show();
				$('#mask').show();
				$('.alert-body').text("E-mail 중복검사가 필요합니다");
				return false;
			}
		}
	 var favor1=$('.favorite1').val();
		var favor2=$('.favorite2').val();
		var favor3=$('.favorite3').val();
		if(favor1==favor2||favor2==favor3||favor3==favor1){
			$('#alert-box').show();
			$('#mask').show();
			$('.alert-body').text("선호하는 지점이 중복됩니다!");
			return false;
		}
});


