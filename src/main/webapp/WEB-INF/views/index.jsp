<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://bootswatch.com/slate/bootstrap.min.css">
<link rel="stylesheet" href="css/jquery.mCustomScrollbar.css">
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/index.css">
<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/common.js"></script>
<script src="js/index.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$(".sub_menu_d").each(function(i, e) {mainSubBack(i,e);});
		$(".onoff > img").click(function() {onoff();});
		$(".sub_menu a").each(function(i,e){
			$(e).click(function(){listlink($(this).text())});
		});
		$(window).resize(function() {
			$(".main_menu").each(function(i, e) {
				if ($(window).width() < 768) {
					if ($(e).hasClass("this_view")) {
						$(".main_index").css({"height":"30px" ,"line-height":"30px"});
						$(".main_menu").css({ "opacity" : 1, "width" : "20%","height":"100%" ,"line-height":"30px"});
						$(".sub_menu_" + (i + 1)).css({"margin-left": "0"}).removeClass("hid");
						$(this).children().show();
					}else{
						$(".main_menu").css("height","20%");
					}
				} else {
					$(".main_menu").css("height","100%");
					if ($(e).hasClass("this_view")) {
						$(".main_index").css({"height":"100%" ,"line-height":"nomal"});
						$(".main_menu").css({ "opacity" : 1, "width" : "2.5%","height":"100%" ,"line-height":"nomal" });
						$(this).css({ "opacity" : 0.4, "width" : "90%" }).children().hide();
							$(".sub_menu_" + (i + 1)).stop().css("margin-left", (i * 2.5) + "%");
							$("#player,.sub_menu_" + (i + 1)).removeClass("hid");
						
					}
				}
			});
		});
		$(".main_menu").each(function(i, e) {indexLoad(i,e)});
	});
</script>

<title>HOME</title>
</head>
<body>
	<div id="tv_box_out">
		<%@include file="sub/navbar.jsp"%>
		<%@include file="sub/login.jsp"%>
		<%@include file="sub/join.jsp"%>
		<div id="tv_box_in">
			<div class="main_index">
				<div class="main_menu"><span class="main_text">먹<span class="hid">는방송</span></span></div>
				<div class="main_menu"><span class="main_text">방<span class="hid">방곳곳</span></span></div>
				<div class="main_menu"><span class="main_text">의<span class="hid">기양양</span></span></div>
				<div class="main_menu"><span class="main_text">달<span class="hid">라잡이</span></span></div>
				<div class="main_menu"><span class="main_text">인<span class="hid">기맛집</span></span></div>
			</div>
			<div class="sub_menu sub_menu_1 hid">
				<a href="#" class="sub_menu_d"><span class="main_text">식신로드</span></a> 
				<a href="#" class="sub_menu_d"><span class="main_text">테이스티로드</span></a> 
				<a href="#" class="sub_menu_d"><span class="main_text">백종원의 3대천왕</span></a> 
				<a href="#" class="sub_menu_d"><span class="main_text">맛있는 녀석들</span></a> 
				<a href="#" class="sub_menu_d"><span class="main_text">찾아라 맛잇는TV</span></a>
			</div>
			<div class="sub_menu sub_menu_2 mCustomScrollbar hid container-fluid">
				<div class="map_bg">
					<div class="incheon col-xs-6"><a href="#">인천광역시</a></div>
					<div class="kangwon col-xs-6"><a href="#">강원도</a></div>
					<div class="gyunggi col-xs-6"><a href="#">경기도</a></div>
					<div class="seoul col-xs-6"><a href="#">서울특별시</a></div>
					<div class="chungnam col-xs-6"><a href="#">충청남도</a></div>
					<div class="sejong col-xs-6"><a href="#">세종특별자치시</a></div>
					<div class="chungbuk col-xs-6"><a href="#">충청북도</a></div>
					<div class="daejeon col-xs-6"><a href="#">대전광역시</a></div>
					<div class="gyeongnam col-xs-6"><a href="#">경상남도</a></div>
					<div class="gyungbuk col-xs-6"><a href="#">경상북도</a></div>
					<div class="daegu col-xs-6"><a href="#">대구광역시</a></div>
					<div class="jeonbuk col-xs-6"><a href="#">전라북도</a></div>
					<div class="jeonnam col-xs-6"><a href="#">전라남도</a></div>
					<div class="kwangju col-xs-6"><a href="#">광주광역시</a></div>
					<div class="ulsan col-xs-6"><a href="#">울산광역시</a></div>
					<div class="jeju col-xs-6"><a href="#">제주특별자치도</a></div>
					<div class="busan col-xs-6"><a href="#">부산광역시</a></div>
				</div>
			</div>
			<div class="sub_menu sub_menu_3 hid">
				<a href="#" class="sub_menu_d"><span class="main_text">한식</span></a>
				<a href="#" class="sub_menu_d"><span class="main_text">일식</span></a> 
				<a href="#" class="sub_menu_d"><span class="main_text">중식</span></a> 
				<a href="#" class="sub_menu_d"><span class="main_text">양식</span></a> 
				<a href="#" class="sub_menu_d"><span class="main_text">분식</span></a> 
				<a href="#" class="sub_menu_d"><span class="main_text">치킨</span></a> 
				<a href="#" class="sub_menu_d"><span class="main_text">육류</span></a> 
				<a href="#" class="sub_menu_d"><span class="main_text">디저트</span></a>
			</div>
			<div class="sub_menu sub_menu_4 hid">
				<a href="#" class="sub_menu_d"><span class="main_text">한식</span></a>
				<a href="#" class="sub_menu_d"><span class="main_text">일식</span></a> 
				<a href="#" class="sub_menu_d"><span class="main_text">중식</span></a> 
				<a href="#" class="sub_menu_d"><span class="main_text">양식</span></a> 
				<a href="#" class="sub_menu_d"><span class="main_text">분식</span></a> 
				<a href="#" class="sub_menu_d"><span class="main_text">치킨</span></a> 
				<a href="#" class="sub_menu_d"><span class="main_text">육류</span></a> 
				<a href="#" class="sub_menu_d"><span class="main_text">디저트</span></a>
			</div>
			<div class="sub_menu sub_menu_5 hid">
				<a href="#" class="sub_menu_d"><span class="main_text">★★★★★</span></a>
				<a href="#" class="sub_menu_d"><span class="main_text">★★★★</span></a> 
				<a href="#" class="sub_menu_d"><span class="main_text">★★★</span></a> 
				<a href="#" class="sub_menu_d"><span class="main_text">★★</span></a> 
				<a href="#" class="sub_menu_d"><span class="main_text">★</span></a> 
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
	<script src="js/login-join/join.js"></script>
	<script src="js/login-join/login.js"></script>
	<script src="js/star.js"></script>
	<script src="js/search.js"></script>
</body>
</html>
