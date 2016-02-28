/**
 * 
 */
var reservno;
function reserveone(no){
	$(".reserveOne"+no).submit();
}
function storeover(storeno,no){
	reservno = no;
	$(".reserveTmp"+no).removeClass("hid");
	$.ajax({
		url:"detailpage",
		type:"post",
		data:{storeno:storeno},
		success:function(result){
			$(".reserveTmp"+no).html(result);
		}
	});
}
function storeout(no){
	$(".reserveTmp").addClass("hid");
}