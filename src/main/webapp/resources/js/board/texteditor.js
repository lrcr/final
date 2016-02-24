  $('#summernote').summernote({
    lang: 'ko-KR', // default: 'en-US'
    height: 300,                 // set editor height
    minHeight: null,             // set minimum height of editor
    maxHeight: null,             // set maximum height of editor
    focus: true                  // set focus to editable area after initializing summernote
    
  });
  
  
  $("#notify-edit").on("click",function(){
    $('#summernote').summernote({
       lang: 'ko-KR', // default: 'en-US'
        height: 300,                 // set editor height
        minHeight: null,             // set minimum height of editor
        maxHeight: null,             // set maximum height of editor
        focus: true                  // set focus to editable area after initializing summernote
    });
    $("#write-title").attr("disabled",false);
    if($(this).val()=="돌아가기"){
		$("#write-done").attr("disabled",false);
		$("#notify-save").attr("disabled",false);
		$(this).val("수정하기");
    }
  });
  
    $("#notify-save").on("click",function(){
      var makrup = $('#summernote').summernote('code');
      $('#summernote').summernote('destroy');
      $("#write-done").attr("disabled",true);
      $("#notify-edit").val("돌아가기");
      $(this).attr("disabled",true);
      
      $("#write-title").attr("disabled",true);
    });
    
$(".not-login").on("click",function(){
	alert("로그인이 필요합니다");
});

$(".write-login").on("click",function(){
	if($("#writemodal").css("display")=="none"){
		 $("#write-title").val("");
		 $("#write-title").attr("disabled",false);
		 $("#write-done").attr("disabled",false);
		 $("#notify-save").attr("disabled",false);
		 $("#notify-edit").val("수정하기");
		 $('#summernote').summernote({
		       lang: 'ko-KR', // default: 'en-US'
		        height: 300,                 // set editor height
		        minHeight: null,             // set minimum height of editor
		        maxHeight: null,             // set maximum height of editor
		        focus: true                  // set focus to editable area after initializing summernote
		    });
		 $(".note-editable").html("");
	}
});

$("#write-done").on("click",function(){
	if($("#write-title").val()==""){
		$('#write-title-label').css("color","red");
        var msg=$("#write-title-label");
        msg.animate({ opacity: '1'}, "slow");
        msg.animate({ opacity: '0'}, "slow");
        msg.animate({ opacity: '1'}, "slow");
        return false;
	}
	else if($(".note-editable").html()=="<p><br></p>"||$(".note-editable").html()==""){
		alert("내용을 입력하세요");
		return false;
	}
	else{
		var content=$(".note-editable").html();
		var leng=content.length;
		if(leng>=4000){
			for(var i=0; i<(leng/4000)+1;i++)
				{
					var content_i=content.substr(0,4000);
				}
			
			var content_2=content.substr(4000,(content.length)-1);
			alert(content_1);
			alert(content_2);
			alert(content_1.length);
			alert(content_2.length);
			alert(content_1.length+content_2.length);
		}
		var db="title="+$("#write-title").val()+"&content="+$(".note-editable").html();
        $.ajax({
           url:"addboard",
           type:"post",
           data: db,
           dataType:"xml",
           error:function(){alert("Ajax error!!")},
           success:function(result){
        	  location.replace("/project3/notify");
           }//통신완료
        });//ajax끝
		
		
		
	}
});
//$(":file").attr("disabled",true);
$(".modal").css("overflow","auto");
