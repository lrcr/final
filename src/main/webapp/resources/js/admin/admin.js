/* 체크리스트 */
$("#delete").click(function() {
	$("#checkbox:checked").parent().parent().remove();
});

$("#btn-todo").click(function() {			
	$(".todo-list").append('<li class="todo-list-item">' + '<div class="checkbox">'
							+ '<input type="checkbox" id="checkbox" />'
							+ '<label for="checkbox">' + $("#btn-input").val()
							+ '</label>' + '</div>' + '</li>');
	$("#btn-input").val("");
});

/*달력*/

$('#calendar').fullCalendar({
   		
	header : { left: 'today', center: 'title' ,right:'prev,next' }
, monthNames: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"]
, dayNamesShort: ["일", "월", "화", "수", "목", "금", "토"]
, views: {
    month: { // name of view
        titleFormat: 'YYYY년  M월'
          }
    },
dayClick: function(date, jsEvent, view) {    //달력 클릭 이벤트
    $('.fc-day').css('background-color', 'white');
    $('.fc-today').css('background-color', '#fcf8e3');
    $(this).css('background-color', 'gray');
	} ,
});

//수정버튼 클릭시
$("#modify").click(function() {
	var length = $(".selected").length;
	/* 선택된겂이 없으면 수행하지 않는다. */
	if (length != 0) {
		/* 선택된 갯수만큼 반복수행 */
		for (var i = 0; i < length; i++) {
			var email = $(".selected:first .member_email").text();
			var nickname = $(".selected:first .member_nickname").text();
			var pw = $(".selected:first .member_pw").text();
			var phone = $(".selected:first .member_phone").text();
			var agree = $(".selected:first .member_agree").text();
			console.log(email + nickname + pw + phone+ agree);
			$(".selected:first .member_pw").html('<input type="text" value="'+pw +'">');
			$(".selected:first .member_phone").html('<input type="text" value="'+ phone +'">');
			$(".selected:first .member_agree").html('<input type="text" value="'+ agree +'">');
			$(".selected:first").removeClass("selected");
		}
		
		$("#member_table input:checkbox:checked").parent().parent().addClass("selected");
		
		if ($("#confirm").text() != "확인") {
			$("#my_menu").append("<button id='confirm' style='background:#E9ECF2; border:none;'>확인</button>");
		} 
		
		$("#confirm").click(function() {
			/* 선택된 것들만큼 반복할 예정 */
			var length = $(".selected").length;
			for (var i = 0; i < length; i++) {
				 $.ajax({
					 url:"modifyuser",
					 type:"post",
					 data: {email:$(".selected:first .member_email input").val(),
						 	pw:$(".selected:first .member_password input").val(),
						 	phone:$(".selected:first .member_phone input").val(),
						 	agree:$(".selected:first .member_agree input").val()
					 },
//					 error:function(){alert("Ajax error!!")},
                    success : function(data) {
                    	$(".selected:first").removeClass("selected");
                    }
               });
			}
			alert("CUD 비활성화 중입니다^^;");
			location.reload();
		});
	}
});

// 삭제버튼 클릭시 
$("#delete").click(function() {
	confirm("삭제하시겠습니까?");
	alert("CUD 비활성화 중입니다^^;");
//	var length = $(".selected").length;
//	/* 선택된 체크박스가 있는 경우에만 실행 */
//	if (length!=0) {
//		for (var i = 0; i < length; i++) {
//			$.ajax(context + "/admin/delete",{
//				data : {
//					"id" : $(".selected:first .member_id").text()
//				},
//				async : false,
//				success : function(data) {
//					$(".selected:first").removeClass("selected");
//				},
//				error : function() {
//					
//				}
//			});
//		}
//	}
//	location.reload();
});

//음식점관리

$(".admin-btn").click(function() {
	
	alert("CUD 비활성화 중입니다^^;");
	
});


