$("#rec-edit").on("click", function() {
	$('#summernote').summernote({
		lang : 'ko-KR', // default: 'en-US'
		height : 300, // set editor height
		minHeight : null, // set minimum height of editor
		maxHeight : null, // set maximum height of editor
		focus : true
	// set focus to editable area after initializing summernote
	});

	$("#rec-title").attr("disabled", false);
	$("#rec-done").attr("disabled", false);
	$("#rec-edit").attr("disabled", true);
	$("#rec-save").attr("disabled", false);
});

$("#rec-save").on("click", function() {
	var makrup = $('#summernote').summernote('code');
	$('#summernote').summernote('destroy');
	$("#rec-done").attr("disabled", true);
	$("#rec-edit").attr("disabled", false);
	$(this).attr("disabled", true);
	$("#rec-title").attr("disabled", true);
});

$(".write-login").on("click", function() {
	if ($("#community-write").css("display") == "none") {
		$("#rec-title").val("");
		$("#rec-title").attr("disabled", false);
		$("#rec-done").attr("disabled", false);
		$("#rec-save").attr("disabled", false);
		$("#rec-edit").attr("disabled", true);
		$('#summernote').summernote({
			lang : 'ko-KR', // default: 'en-US'
			height : 300, // set editor height
			minHeight : null, // set minimum height of editor
			maxHeight : null, // set maximum height of editor
			focus : true
		// set focus to editable area after initializing summernote
		});
		$(".note-editable").html("");
	}
});

$("#rec-done").on("click",function() {
	if ($("#rec-title").val() == "") {
		$('.rec-title-label').css("color", "red");
		var msg = $("#rec-title");
		msg.animate({	opacity : '1'	}, "slow");
		msg.animate({	opacity : '0'	}, "slow");
		msg.animate({	opacity : '1'	}, "slow");
		return false;
	} else if ($(".note-editable").html() == "<p><br></p>"	|| $(".note-editable").html() == "") {
		alert("내용을 입력하세요");
		return false;
	}
	 else {
		 $.ajax({
			 url:"saverec",
			 type:"post",
			 data: {title:$("#rec-title").val(), content:$(".note-editable").html()},
//			 error:function(){alert("Ajax error!!")},
			 success:function(result){
				 if(result==="done")
					 {
					 	return true;
					 }
				 else{
					 return false;
				 }
		 	}//통신완료
		 });//ajax끝
	 }
});

$(".rec-list-title").on("click",function(){
	$.ajax({
		 url:"getrecdetail",
		 type:"post",
		 data: {no:parseInt($(this).attr("id"))},
//		 error:function(){alert("Ajax error!!")},
		 success:function(result){
			if(result!=""){
				$(".rec-modal-content").html(result);
			}
	 	}//통신완료
	 });//ajax끝
});


