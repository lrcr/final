$(document).ready(function(){
	var today = $.fullCalendar.moment(new Date());
	$('#calendar').fullCalendar({
		height:450,
		header:{
			left:'prev',
			center:'title',
			right:'today next',
		},
		views:{
			month:{
				titleFormat:'YYYY년  M월'
			}
		},
		defaultDate:today.format(), // '2016-01-12',
		dayClick:function(date,jsEvent,view){
			$(".fc-day").css("background","transparent").text("");
			$(this).text("예약")
			$(".nalja").text(date.format());
			$("input[name=nalja]").val(date.format());
			$(this).css({
				"background-color":"#62c462",
				"color":"#fff"
			});
			
		},
		eventLimit:true
	});
	lastdel();
	$(".fc-prev-button,.fc-next-button, .fc-today-button").on("click",function(){
		lastdel();
	});
	$("#seltime").on("change",function(){
		$(".sigan").text($(this).val());
		$("input[name=sigan]").val($(this).val());
	});
	$("#selpep").on("change",function(){
		$(".inwon").text($(this).val()+"명");
		$("input[name=inwon]").val($(this).val());
	});
	$(".btn_reserve").on("click",function(){
		var res = true;
		var nalja = $(".reservePage input[nema=nalja]").val();
		var sigan = $(".reservePage input[name=sigan]").val();
		var inwon = $(".reservePage input[name=inwon]").val();
		if(nalja==""||sigan==""||inwon==""){
			alert("날짜/시간/인원을 선택해 주세요");
			res=false;
		}else{
			$(".reservePage input[type=text]").each(function(i,e){
				if($(e).val()=="") {
					$(this).focus();
					res = false;
				}
			});
		}
		return res;
	});
});
function lastdel(){
	if($(".fc-content-skeleton:last").children().children().children().children().eq(0).hasClass("fc-other-month")) $(".fc-row:last").css("display","none");
}