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
		var storename = $(".storename").text();
		var nalja = $(".reservePage input[name=nalja]").val();
		var sigan = $(".reservePage input[name=sigan]").val();
		var inwon = $(".reservePage input[name=inwon]").val();
		var email = $(".reservePage input[name=email]").val();
		var name = $(".reservePage input[name=name]");
		var phone = $("#reservePhone");
		var title = $(".reserve_title").text();
		if(email==""){
			alert("로그인이 필요합니다");
			history.go(-1)();
			$("#sign-in").modal();
			res = false;
		}else if(nalja==""||sigan==""||inwon==""){
			alert("날짜/시간/인원을 선택해 주세요");
			res = false;
		}else if(name.val()==""){
			name.focus();
			res = false;
		}else if(phone.val()==""){
			phone.focus();
			res = false;
		}else{
			var modal = $.pureAlert.confirm({
				title: "<span class=\"reserve_name\">"+title+"하시겠습니까?</span>",
				content:"<div><span class=\"reserve_b\">상호명</span> : "+storename+"<br/>" +
				"<span class=\"reserve_b\">예약자</span> : "+name.val()+"<br/>" +
				"<span class=\"reserve_b\">예약일</span> : "+nalja+" "+sigan+"<br/>" +
				"<span class=\"reserve_b\">인원</span> : "+inwon+"명<br/>" +
				"<span class=\"reserve_b\">이메일</span> : "+email+"<br/>" +
				"<span class=\"reserve_b\">전화번호</span> : "+phone.val() +
				"</div>"
			});
			modal.on("ok.pure-alert", function(){
				$(".reserve_form").submit();
			});
			res = false;
		}
		return false;
	});
});
function lastdel(){
	if($(".fc-content-skeleton:last").children().children().children().children().eq(0).hasClass("fc-other-month")) $(".fc-row:last").css("display","none");
}
