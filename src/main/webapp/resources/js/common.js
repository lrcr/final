/**
 * common.js
 */
$(document).ready(function() {
	$(".nav_btn").click(function() {
		if ($("#nav_navbar").hasClass("nav_blk")) {
			$("#nav_navbar").stop().animate({ "top" : "-55px" }, 500);
			$("body").stop().animate({ "padding-top" : "0px" }, 500, function() {
				$(".nav_btn_bottom").removeClass("hid");
			});
		} else {
			$(".nav_btn_bottom").addClass("hid");
			$("#nav_navbar").stop().animate({ "top" : "0px" }, 500);
			$("body").stop().animate({ "padding-top" : "51px" }, 500);
		}
		$("#nav_navbar").toggleClass("nav_blk");
	});
	$(window).resize(function() {
		if ($(window).width() < 768) {
			$("#nav_navbar").css({ "top" : "0" }).addClass("nav_blk");
			$("body").css({ "padding-top" : "51px" });
			$(".nav_btn_bottom").addClass("hid");
			// stopVideo();
		} else {

		}
	});

	/** 나의정보 */
	$(".myinfo").on("click", function() {
		$.ajax({ 
			url : "myInfo", 
			type : "post", 
			error : function() {
			$("#tv_box_out").html("<img src=\"images/error.png\" alt=\"에러페이지\" />");
		}, success : function(result) {
			$(".myinfo-cont").html(result);

		} });
	});
	
	
});

/** 카카오링크 연동 */
function cacaolink(a, store_name, img_no) {
	// 사용할 앱의 JavaScript 키를 설정해 주세요.
	Kakao.init('160294267f9390d543bcdaab1b98c0ce');

    // 카카오톡 링크 버튼을 생성합니다. 처음 한번만 호출하면 됩니다.
    Kakao.Link.createTalkLinkButton({
      container: '#kakao-link-btn',
      label: a,
      image: {
        src: 'http://192.168.10.46:7070/project3/images/storeimg/'+img_no+'.jpg',
        width: '300',
        height: '200'
      },
      webButton: {
        text: store_name,
        url: 'http://192.168.10.46:7070/project3/cacao?nm='+store_name // 앱 설정의 웹 플랫폼에 등록한 도메인의 URL이어야 합니다.
      }
    });
}