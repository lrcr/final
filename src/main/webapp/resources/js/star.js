$(':radio').change(function(){
	if($(this).val()==5)
    $('.choice').html("<h4>"+$(this).val() +"점 - 인생맛집이네요</h4>");
	else if($(this).val()==4)
	    $('.choice').html("<h4>"+$(this).val() +"점 - 다음에 또 갈래요</h4>");
	else if($(this).val()==3)
	    $('.choice').html("<h4>"+$(this).val() +"점 - 한번 쯤 갈만해요</h4>");
	else if($(this).val()==2)
	    $('.choice').html("<h4>"+$(this).val() +"점 - 여기가 왜 맛집이죠?</h4>");
	else if($(this).val()==1)
	    $('.choice').html("<h4>"+$(this).val() +"점 - 다신 안갈래요</h4>");
  } 
)