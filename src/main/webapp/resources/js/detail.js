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


$(":radio").on("click",function(){
	eval=$(this).val();
});

$(".eval-btn").on("click",function(){
	alert("ok");
	var inputid=$(this).parent().siblings("input").attr("id");
	var ment=$("#"+inputid).val();
	var no=parseInt(inputid);
	if(!(eval==1||eval==2||eval==3||eval==4||eval==5))
		{
			$(".choice").css("color","red");
			$(".choice").html("<h4>평점을 매겨주세요[최하1점]</h4>");
			  var msg=$(".choice");
              msg.animate({ opacity: '1'}, "slow");
              msg.animate({ opacity: '0'}, "slow");
              msg.animate({ opacity: '1'}, "slow");
		}
	else if(ment==""){
		$("#"+inputid).attr("placeholder","댓글을 입력하세요!");
		var msg=$("#"+inputid);
		msg.animate({ opacity: '1'}, "slow");
        msg.animate({ opacity: '0'}, "slow");
        msg.animate({ opacity: '1'}, "slow");
	}
	else{
		alert(eval+","+ment+","+no);
		$.ajax({
            url:"addreply",
            type:"post",
            data: {eval:eval,ment:ment,no:no},
            error:function(){alert("Ajax error!!")},
            success:function(result){
                if(result=="1") {
                	alert("이미 평가하셨습니다!");
                }
                else{
                	$("#detail-fieldset").html(result);
                }
            	
            }//통신완료
         });//ajax끝
	}
});