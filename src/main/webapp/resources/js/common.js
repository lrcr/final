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
});
function listlink(col, val) {
	$.ajax({ 
		url : "listlink", 
		type : "get", 
		data : "col="+col+"&val="+val, 
		error : function() { alert("Ajax error!!")}, 
		success : function(result) {
			success = $(result).find("success").text();
			success = parseInt(success);
	} });
}
