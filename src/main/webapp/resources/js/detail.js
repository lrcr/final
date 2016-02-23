$(".detail-info").on("click",function(){
	var no=parseInt($(this).attr("id"));
	$.ajax({
        url:"detail",
        type:"post",
        data: {no:no},
        error:function(){alert("Ajax error!!")},
        success:function(result){
        	$("#detail-fieldset").html(result);
        	
        }//통신완료
     });//ajax끝
});

var starcnt=0;
function starval(score){
	starcnt=score;
	if(!(starcnt==1||starcnt==2||starcnt==3||starcnt==4||starcnt==5))
	{
		$(".choice").css("color","red");
		$(".choice").html("<h4>평점을 매겨주세요[최하1점]</h4>");
		  var msg=$(".choice");
          msg.animate({ opacity: '1'}, "slow");
          msg.animate({ opacity: '0'}, "slow");
          msg.animate({ opacity: '1'}, "slow");
	}
	
	if(starcnt==5)  $('.choice').html("<h4>5점 - 인생맛집이네요</h4>");
	else if(starcnt==4)
	    $('.choice').html("<h4>"+starcnt +"점 - 다음에 또 갈래요</h4>");
	else if(starcnt==3)
	    $('.choice').html("<h4>"+starcnt +"점 - 한번 쯤 갈만해요</h4>");
	else if(starcnt==2)
	    $('.choice').html("<h4>"+starcnt +"점 - 여기가 왜 맛집이죠?</h4>");
	else if(starcnt==1)
	    $('.choice').html("<h4>"+starcnt +"점 - 다신 안갈래요</h4>");
}

function evaluate(no){
	var ment=$("#"+no+"th-input").val();
	if(starcnt==0)
		{
			$(".choice").css("color","red");
			$(".choice").html("<h4>평점을 매겨주세요[최하1점]</h4>");
			  var msg=$(".choice");
              msg.animate({ opacity: '1'}, "slow");
              msg.animate({ opacity: '0'}, "slow");
              msg.animate({ opacity: '1'}, "slow");
		}
	else if(ment==""){
		$("#"+no+"th-input").attr("placeholder","댓글을 입력하세요!");
		var msg=$("#"+no+"th-input")
		msg.animate({ opacity: '1'}, "slow");
        msg.animate({ opacity: '0'}, "slow");
        msg.animate({ opacity: '1'}, "slow");
	}
	else{
		$.ajax({
            url:"addreply",
            type:"post",
            data: {eval:starcnt,ment:ment,no:no},
            error:function(){alert("Ajax error!!")},
            success:function(result){
            	alert(result);
                if(result=="") {
                	alert("이미 평가하셨습니다!");
                }
                else{
                	$("#detail-fieldset").html(result);
                }
            	
            }//통신완료
         });//ajax끝

	}
	starcnt=0;
}
