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
<link rel="stylesheet" href="css/star.css">
<link rel="stylesheet" href="css/index.css">
<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/common.js"></script>
<script src="js/index.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$(".sub_menu_d").each(function(i, e) {mainSubBack(i,e);});
		$(".onoff > img").click(function() {onoff();});
		$(".sub_menu_2 a").each(function(i,e){
			$(e).click(function(){listlink($(this).find(".sub_text ").text())});
		});
		$(".sub_menu .sub_menu_d").each(function(i,e){
			$(e).click(function(){listlink($(this).find(".sub_text ").text())});
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
		$("#stop-btn").tooltip({trigger: 'hover click','placement': 'left'});//동영상끄기 버튼 툴팁
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
				<div class="main_menu"><span class="main_text">의<span class="hid">식주식</span></span></div>
				<div class="main_menu"><span class="main_text">달<span class="hid">려간다</span></span></div>
				<div class="main_menu"><span class="main_text">인<span class="hid">기맛집</span></span></div>
			</div>
			<div class="sub_menu sub_menu_1 hid">
				<div class="sub_menu_d"><span class="sub_text ">식신로드</span></div> 
				<div class="sub_menu_d"><span class="sub_text ">테이스티로드</span></div> 
				<div class="sub_menu_d"><span class="sub_text ">백종원의 3대천왕</span></div> 
				<div class="sub_menu_d"><span class="sub_text ">맛있는 녀석들</span></div> 
				<div class="sub_menu_d"><span class="sub_text ">찾아라 맛있는TV</span></div>
			</div>
			<div class="sub_menu sub_menu_2 hid mCustomScrollbar container-fluid">
				<div class="map_bg">
					<div class="incheon col-xs-6"><a href="#"><span class="sub_text ">인천광역시</span></a></div>
					<div class="kangwon col-xs-6"><a href="#"><span class="sub_text ">강원도</span></a></div>
					<div class="gyunggi col-xs-6"><a href="#"><span class="sub_text ">경기도</span></a></div>
					<div class="seoul col-xs-6"><a href="#"><span class="sub_text ">서울특별시</span></a></div>
					<div class="chungnam col-xs-6"><a href="#"><span class="sub_text ">충청남도</span></a></div>
					<div class="sejong col-xs-6"><a href="#"><span class="sub_text ">세종특별자치시</span></a></div>
					<div class="chungbuk col-xs-6"><a href="#"><span class="sub_text ">충청북도</span></a></div>
					<div class="daejeon col-xs-6"><a href="#"><span class="sub_text ">대전광역시</span></a></div>
					<div class="gyeongnam col-xs-6"><a href="#"><span class="sub_text ">경상남도</span></a></div>
					<div class="gyungbuk col-xs-6"><a href="#"><span class="sub_text ">경상북도</span></a></div>
					<div class="daegu col-xs-6"><a href="#"><span class="sub_text ">대구광역시</span></a></div>
					<div class="jeonbuk col-xs-6"><a href="#"><span class="sub_text ">전라북도</span></a></div>
					<div class="jeonnam col-xs-6"><a href="#"><span class="sub_text ">전라남도</span></a></div>
					<div class="kwangju col-xs-6"><a href="#"><span class="sub_text ">광주광역시</span></a></div>
					<div class="ulsan col-xs-6"><a href="#"><span class="sub_text ">울산광역시</span></a></div>
					<div class="jeju col-xs-6"><a href="#"><span class="sub_text ">제주특별자치도</span></a></div>
					<div class="busan col-xs-6"><a href="#"><span class="sub_text ">부산광역시</span></a></div>
				</div>
			</div>
			<div class="sub_menu sub_menu_3 hid">
				<div class="sub_menu_d"><span class="sub_text ">한식</span></div>
				<div class="sub_menu_d"><span class="sub_text ">일식</span></div> 
				<div class="sub_menu_d"><span class="sub_text ">중식</span></div> 
				<div class="sub_menu_d"><span class="sub_text ">양식</span></div> 
				<div class="sub_menu_d"><span class="sub_text ">분식</span></div> 
				<div class="sub_menu_d"><span class="sub_text ">치킨</span></div> 
				<div class="sub_menu_d"><span class="sub_text ">육류</span></div> 
				<div class="sub_menu_d"><span class="sub_text ">디저트</span></div>
			</div>
			<div class="sub_menu sub_menu_4 hid container-fluid">
				<div class="sub_menu_d col-xs-6"><span class="sub_text ">예약 가능</span></div>
				<div class="sub_menu_d col-xs-6"><span class="sub_text ">배달 가능</span></div>
			</div>
			<div class="sub_menu sub_menu_5 hid">
			<div class="sub_5box">
				<div class="sub_menu_d sub_5_1"><span class="sub_text ">5</span></div>
				<div class="sub_menu_d sub_5_2"><span class="sub_text ">4</span></div> 
				<div class="sub_menu_d sub_5_3"><span class="sub_text ">3</span></div> 
				<div class="sub_menu_d sub_5_4"><span class="sub_text ">2</span></div> 
				<div class="sub_menu_d sub_5_5"><span class="sub_text ">1</span></div>
			</div>
			</div>
			<div id="player" class="main_player hid"></div>
		</div>
		<div class="onoff">
			<img alt="배경동영상 끄기" src="images/onoff.png" width="15px" data-toggle="tooltip"  title="" data-original-title="동영상끄기" id="stop-btn">
		</div>
	</div>
	<div class="main_support">
		<img src="images/support.png" width="80%" />
	</div>
	<script src="js/jquery.mCustomScrollbar.min.js"></script>
	<script src="js/login-join/join.js"></script>
	<script src="js/login-join/login.js"></script>
	<script src="js/search.js"></script>
</body>
</html>