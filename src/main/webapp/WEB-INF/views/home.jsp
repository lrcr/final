<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap-theme.min.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="https://bootswatch.com/slate/bootstrap.min.css" type="text/css" />
<link rel="stylesheet" href="css/main.css">
<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/main.js"></script>
<style type="text/css">
html {height:100%;}
body {height:100%; margin:0;}
#tv_box_out {overflow:auto; background:#383838; width:100%; height:100%; border:5px solid #b5b5b5; border-radius:25px;}
#tv_box_in {position:relative; width:95%; height:90%; overflow:hidden; border:5px solid #1c1c1c; border-radius:25px; margin:20px auto; z-index:4;}
#main_main {height:100%; width:100%;}
#main_main:after {content:""; clear:both; display:block;}
.container-fluid {padding:0; height:100%;}
.navbar {margin:0;}
.main_index {text-align:center; overflow:hidden; width:100%; height:100%;}
.main_index .main_menu {width:20%; height:100%; float:left; padding-top:10%; }
.sub_menu {position:absolute; top:0; width:90%; height:100%;}
.sub_menu_d {margin:0; width:25%; float:left; height:33.33%; padding-top:10%; text-align:center; font-size:20px; color:#eee; transition-property:background-color; transition-duration:0.6s;}
.sub_menu_d:nth-child(1) {width:50%;}
.sub_menu_d:nth-child(3) {height:66.66%; float:right;}
.sub_menu_d:nth-child(4) {height:66.66%;}
.sub_menu_d:nth-child(8) {width:50%;}
.sub_menu a {display:inline-block; vertical-align:middle; text-decoration:none; color:inherit;}
.main_text {color:#fff;}
.main_menu .main_text {font-size:40px; font-weight:bold; }
.main_player {position:absolute; top:0; z-index:-1;}
.main_other {width:2.5%;}
.main_icon-bar {display:block; width:24px; height:3px; border-radius:1px; margin-top:5px; background-color:#fff;}
.main_btn {position:absolute; margin-left:5px; z-index:5; background:none; border:none; outline:0;}
.main_btn:hover,.main_btn:active,.main_btn:focus,.main_btn:visited,.main_btn:link {text-decoration:none; border:0; outline:0; box-shadow:none;}
.glyphicon-menu-hamburger {width}
@media screen and (max-width:767px) {
	/* 매우 작은 기기들 (모바일폰, 768px 보다 작은) screen-xs */
	body {background:#000;}
	#main_main {height:100%; width:100%;}
	.main_index .main_menu {width:100%; height:20%;}
	.sub_menu {width:100%; margin-left:0;}
	.sub_menu_d {text-align:center; background:rgba(119, 119, 119, 0.4); font-size:20px; color:#eee; transition-property:background-color; transition-duration:0.6s;}
	#player {display:none;}
}

@media screen and (min-width:768px) and (max-width:991px) { /* 작은 기기들 (태블릿, 768px 이상) screen-sm*/
	/* #main_main {height:432px; width:768px; margin:0 auto; position:relative;} */
}

@media screen and (min-width:992px) and (max-width:1199px) { /* 중간 기기들 (데스크탑, 992px 이상) screen-md */
	/* #main_main {height:558px; width:992px; margin:0 auto; position:relative;} */
}

@media screen and (min-width:1200px) { /* 큰 기기들 (큰 데스크탑, 1200px 이상) screen-lg */
	/* #main_main {height:675px; width:1200px; margin:0 auto; position:relative;} */
}
</style>
<script type="text/javascript">
	var main_back = [ "#f1ac1d", "#e57d04", "#dc0030", "#b10058", "#7c378a", "#3465aa", "#09a275" ];
	var main_vid = [ "fFZwgPcW7FM", "ly6J5BQkXgA", "4OFAY0Du65A", "Tc67umPKFss", "u_f2gzaDTKA" ];
	var main_sub_back = [ "#ee6334", "#ff8200", "#ed1369", "#777777", "#00aba8", "#666633", "#13cced", "#456c6c", "#4dbf13", "#794b80", "#ec3b4b", "#00fdfd" ];
	var main_sub_rgb = [ "238,99,52", "255,130,0", "237,19,105", "77,191,19", "0,171,168", "102,102,51", "19,204,237", "121,75,128", "69,108,108", "236,59,75", "0,253,253", "119,119,119" ];
	$(document).ready(function() {
		$(".sub_menu_d").each(function(i, e) {
			//alert(e);
			$(e).css({ "background" :"rgba(" + main_sub_rgb[i] + ",0.4)" });
			$(e).hover(function() {
				$(this).css({ "background" :"rgba(" + main_sub_rgb[i] + ",1)" });
				//$(this).animate({"background":main_sub_back[i]},400);
			}, function() {
				$(this).css({ "background" :"rgba(" + main_sub_rgb[i] + ",0.4)" });
				//$(this).animate({"background":"rgba("+main_sub_rgb[i]+",0.4)"},400);
			});
		});
		if ($(window).width() < 768) {}
		$(window).resize(function() {
			$(".main_menu").each(function(i, e) {
				if ($(window).width() < 768) {
					//stopVideo();
					$(".sub_menu").css("margin-left", 0);
				} else {
					if ($(e).hasClass("this_view")) {
						$(".sub_menu").css("margin-left", (i * 2.5) + "%");
						//createYouTubeAPI(main_vid[i]);
						//changeVideoId(main_vid[i]);
					}
				}
			});
		});
		$(".main_btn").click(function(){
			if($("#main_navbar").hasClass("hid")){
				$(this).children().prop("src","images/btn_x.png");
				$("body").css("padding-top","51px");
			}else{
				$(this).children().prop("src","images/btn_list.png");
				$("body").css("padding-top","0");
			}
			$("#main_navbar").toggleClass("hid");
		});
		$(".main_menu").each(function(i, e) {
			$(e).css({ "background" :main_back[i] });
			$(e).click(function() {
				$(".main_menu .main_text").show().css({"font-size":"14px"}).children().show();
				$(".main_menu").removeClass("this_view");
				$("#player,.sub_menu").addClass("hid");
				$(this).addClass("this_view");
				//$(".main_sub_menu").removeClass("hid").children().html("<source src=\"video/main_v"+(i+1)+".mp4\" type=\"video/mp4\"><source src=\"video/main_v"+(i+1)+".webm\" type=\"video/webm\">");
				$(".main_menu").stop().animate({ "opacity" :1, "width" :"2.5%" }, 400);
				$(this).stop().animate({ "opacity" :0.4, "width" :"90%" }, 400, function() {
					$(".sub_menu").stop().css("margin-left", (i * 2.5) + "%");
					$("#player,.sub_menu").removeClass("hid");
				}).children().hide();
				createYouTubeAPI(main_vid[i]);
				changeVideoId(main_vid[i]);
			});
		});
	});
</script>

<title>HOME</title>
</head>
<body>
<div id="tv_box_out">
<%@include file="navbar.jsp" %>
<%@include file="login.jsp" %>
<%@include file="join.jsp" %>
<button class="main_btn">
	<img src="images/btn_list.png" />
</button>
<div id="tv_box_in">
	<div id="main_main">
		<div class="main_index">
			<div class="main_menu"><span class="main_text">먹<span class="hid">는방송</span></span></div>
			<div class="main_menu"><span class="main_text">방<span class="hid">방곳곳</span></span></div>
			<div class="main_menu"><span class="main_text">의<span class="hid">기양양</span></span></div>
			<div class="main_menu"><span class="main_text">달<span class="hid">라잡이</span></span></div>
			<div class="main_menu"><span class="main_text">인<span class="hid">기맛집</span></span></div>
		</div>
			<div class="sub_menu hid">
				<a href="#" class="sub_menu_d"><span class="main_text">서울</span></a>
				<a href="#" class="sub_menu_d"><span class="main_text">일식</span></a>
				<a href="#" class="sub_menu_d"><span class="main_text">중식</span></a>
				<a href="#" class="sub_menu_d"><span class="main_text">양식</span></a>
				<a href="#" class="sub_menu_d"><span class="main_text">주식</span></a>
				<a href="#" class="sub_menu_d"><span class="main_text">냉면</span></a>
				<a href="#" class="sub_menu_d"><span class="main_text">간식</span></a>
				<a href="#" class="sub_menu_d"><span class="main_text">분식</span></a>
			</div>
			<div class="sub_menu_2 hid">
				<a href="#" class="sub_menu_d"><span class="main_text">한식</span></a>
				<a href="#" class="sub_menu_d"><span class="main_text">일식</span></a>
				<a href="#" class="sub_menu_d"><span class="main_text">중식</span></a>
				<a href="#" class="sub_menu_d"><span class="main_text">양식</span></a>
				<a href="#" class="sub_menu_d"><span class="main_text">주식</span></a>
				<a href="#" class="sub_menu_d"><span class="main_text">냉면</span></a>
				<a href="#" class="sub_menu_d"><span class="main_text">간식</span></a>
				<a href="#" class="sub_menu_d"><span class="main_text">분식</span></a>
			</div>
			<div id="player" class="main_player hid"></div>
		</div>
		<div class="main_sub_menu hid">
			<video class="main_player1" preload="none" loop autoplay width="100%"></video>
		</div>
	</div>
</div>
</body>
</html>
