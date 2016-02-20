<%@ page session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://bootswatch.com/slate/bootstrap.min.css" type="text/css" />
<link rel="stylesheet" href="css/common.css">
<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/main.js"></script>
<link rel="stylesheet" href="css/main.css">
<script type="text/javascript">
	var main_back = [ "#f1ac1d", "#dc0030", "#b10058", "#7c378a", "#3465aa", "#09a275", "#e57d04" ];
	var main_vid = [ "fFZwgPcW7FM", "ly6J5BQkXgA", "4OFAY0Du65A", "Tqa9LGsC5SU", "u_f2gzaDTKA" ];
	var main_sub_back = [ "#ee6334", "#ff8200", "#ed1369", "#777777", "#00aba8", "#666633", "#13cced", "#456c6c", "#4dbf13", "#794b80", "#ec3b4b", "#00fdfd" ];
	var main_sub_rgb = [ "238,99,52", "255,130,0", "237,19,105", "77,191,19", "0,171,168", "102,102,51", "19,204,237", "255,130,0", "121,75,128", "69,108,108",
			"236,59,75", "0,253,253", "119,119,119" ];
	$(document).ready(function() {
		$(".sub_menu_d").each(function(i, e) {
			$(e).css({ "background" : "rgba(" + main_sub_rgb[i] + ",0.4)" });
			$(e).hover(function() {
				//alert(i);
				$(this).css({ "background" : "rgba(" + main_sub_rgb[i] + ",1)" });
			}, function() {
				$(this).css({ "background" : "rgba(" + main_sub_rgb[i] + ",0.4)" });
			});
		});
		$(".onoff > img").click(function() {
			if ($(".onoff").hasClass("btn_onoff")) {
				$(".main_menu").each(function(i, e) {
					if ($(this).hasClass("this_view")) {
						createYouTubeAPI(main_vid[i]);
						changeVideoId(main_vid[i]);
						$("#player").animate({ "display" : "black" }, 700, function() {
							$(this).animate({ "width" : "100%", "height" : "100%", "margin" : "0" }, 300);
						});
					}
				});
				$(".onoff").removeClass("btn_onoff");
			} else {
				$("#player").animate({ "width" : "0", "height" : "0", "margin" : "20% 50%" }, 300, function() {
					stopVideo();
				});
				$(".onoff").addClass("btn_onoff");
			}
		});
		if ($(window).width() < 768) {
		}
		$(window).resize(function() {
			$(".main_menu").each(function(i, e) {
				if ($(window).width() < 768) {
					$(".sub_menu").css("margin-left", 0);
				} else {
					if ($(e).hasClass("this_view")) {
						$(".sub_menu").css("margin-left", (i * 2.5) + "%");
					}
				}
			});
		});
		$(".main_menu").each(function(i, e) {
			$(e).css({ "background" : main_back[i] });
			$(e).click(function() {
				$(".main_menu .main_text").show().css({ "font-size" : "14px" }).children().show();
				$(".main_menu").removeClass("this_view");
				$("#player,.sub_menu").addClass("hid");
				$(this).addClass("this_view");
				$(".main_menu").stop().animate({ "opacity" : 1, "width" : "2.5%" }, 400);
				$(this).stop().animate({ "opacity" : 0.4, "width" : "90%" }, 400, function() {
					$(".sub_menu_" + (i + 1)).stop().css("margin-left", (i * 2.5) + "%");
					$("#player,.sub_menu_" + (i + 1)).removeClass("hid");
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
		<%@include file="navbar.jsp"%>
		<%@include file="login.jsp"%>
		<%@include file="join.jsp"%>
		<div id="tv_box_in">
			<div class="main_index">
				<div class="main_menu">
					<span class="main_text">먹<span class="hid">는방송</span></span>
				</div>
				<div class="main_menu">
					<span class="main_text">방<span class="hid">방곳곳</span></span>
				</div>
				<div class="main_menu">
					<span class="main_text">의<span class="hid">기양양</span></span>
				</div>
				<div class="main_menu">
					<span class="main_text">달<span class="hid">라잡이</span></span>
				</div>
				<div class="main_menu">
					<span class="main_text">인<span class="hid">기맛집</span></span>
				</div>
			</div>
			<div id="main_main">
				<div class="sub_menu sub_menu_2 hid">
					<ul class="map_bg">
						<li class="incheon"><a href="#" target="_self">인천광역시</a></li>
						<li class="kangwon"><a href="#" target="_self">강원도</a></li>
						<li class="gyunggi"><a href="#" target="_self">경기도</a></li>
						<li class="chungnam"><a href="#" target="_self">충청남도</a></li>
						<li class="sejong"><a href="#" target="_self">세종특별자치시</a></li>
						<li class="chungbuk"><a href="#" target="_self">충청북도</a></li>
						<li class="daejeon"><a href="#" target="_self">대전광역시</a></li>
						<li class="gyeongnam"><a href="#" target="_self">경상남도</a></li>
						<li class="gyungbuk"><a href="#" target="_self">경상북도</a></li>
						<li class="daegu"><a href="#" target="_self">대구광역시</a></li>
						<li class="jeonbuk"><a href="#" target="_self">전라북도</a></li>
						<li class="jeonnam"><a href="#" target="_self">전라남도</a></li>
						<li class="kwangju"><a href="#" target="_self">광주광역시</a></li>
						<li class="ulsan"><a href="#" target="_self">울산광역시</a></li>
						<li class="jeju"><a href="#" target="_self">제주특별자치도</a></li>
						<li class="busan"><a href="#" target="_self">부산광역시</a></li>
						<li class="seoul"><a href="#" target="_self">서울특별시</a></li>
					</ul>
				</div>
			</div>
			<div class="sub_menu sub_menu_1 hid">
				<a href="#" class="sub_menu_d"><span class="main_text">식신로드</span></a> <a href="#" class="sub_menu_d"><span class="main_text">테이스티로드</span></a> <a href="#" class="sub_menu_d"><span class="main_text">백종원의 3대천왕</span></a> <a href="#" class="sub_menu_d"><span class="main_text">맛있는 녀석들</span></a> <a href="#" class="sub_menu_d"><span class="main_text">찾아라!맛있는TV</span></a>
			</div>
			<div class="sub_menu sub_menu_3 hid">
				<a href="#" class="sub_menu_d"><span class="main_text">한식</span></a> <a href="#" class="sub_menu_d"><span class="main_text">일식</span></a> <a href="#" class="sub_menu_d"><span class="main_text">중식</span></a> <a href="#" class="sub_menu_d"><span class="main_text">양식</span></a> <a href="#" class="sub_menu_d"><span class="main_text">주식</span></a> <a href="#" class="sub_menu_d"><span class="main_text">냉면</span></a> <a href="#" class="sub_menu_d"><span class="main_text">간식</span></a> <a href="#" class="sub_menu_d"><span class="main_text">분식</span></a>
			</div>
			<div id="player" class="main_player hid"></div>
		</div>
		<div class="onoff">
			<img alt="배경동영상 끄기" src="images/onoff.png" width="15px">
		</div>
	</div>
	<div class="main_support">
		<img src="images/support.png" width="80%" />
	</div>
	<script type="text/javascript" src="js/join.js"></script>
	<script type="text/javascript" src="js/login.js"></script>
	<script type="text/javascript" src="js/star.js"></script>
</body>
</html>
