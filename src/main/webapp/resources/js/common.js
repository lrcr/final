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
//			stopVideo();
		}else{
			
		}
	});
});
