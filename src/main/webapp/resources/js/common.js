/**
 * common.js
 */
$(document).ready(function() {
	$(".nav_btn").click(function() {
		if ($("#nav_navbar").hasClass("nav_hid")) {
			// $(this).children().prop("src", "images/btn_list.png");
			$("#nav_navbar").stop().animate({ "top" : "-55px" }, 500);
			$("body").stop().animate({ "padding-top" : "0px" }, 500, function() {
				$(".nav_btn_bottom").show();
			});
		} else {
			// $(this).children().prop("src", "images/btn_x.png");
			$(".nav_btn_bottom").hide();
			$("#nav_navbar").stop().animate({ "top" : "0px" }, 500);
			$("body").stop().animate({ "padding-top" : "51px" }, 500);
		}
		$("#nav_navbar").toggleClass("nav_hid");
	});
});