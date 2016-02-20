$(':radio').change(
  function(){
    $('.choice').html("<strong>"+$(this).val() +"점</strong>");
  } 
)