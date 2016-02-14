<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap-theme.min.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/common.css">
<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/main.js"></script>
<style type="text/css">
#main_index {height:720px; width:100%; text-align:center; overflow:hidden;}
#main_index .main_menu {width:20%; height:100%; float:left;}
.main_text {color:#fff;}
.main_player {position:absolute; top:0; z-index:-1;}
.main_other {width:2.5%;}
.container-fluid {}
</style>
<script type="text/javascript">
var main_back = ["#f1ac1d","#e57d04","#dc0030","#b10058","#7c378a","#3465aa","#09a275"];
var main_vid = ["fFZwgPcW7FM","ly6J5BQkXgA","4OFAY0Du65A","Tc67umPKFss","u_f2gzaDTKA"];
$(document).ready(function(){
	$(".main_menu").each(function(i,e){
		$(e).css({"background":main_back[i]});
		$(e).click(function(){
			//$(".main_sub_menu").removeClass("hid").children().html("<source src=\"video/main_v"+(i+1)+".mp4\" type=\"video/mp4\"><source src=\"video/main_v"+(i+1)+".webm\" type=\"video/webm\">");
			$(".main_menu").stop().animate({"opacity":1,"width":"2.5%"},400);
			$(this).stop().animate({"opacity":0.3,"width":"90%"},400);
			$("#player").removeClass("hid");
			createYouTubeAPI(main_vid[i]);
			changeVideoId(main_vid[i]);
		});
	});
});
</script>
<title>HOME</title>
</head>
<body>
<div>
<div id="main_index">
	<div class="main_menu"><span class="main_text">먹</span>
		<div></div>
	</div>
	<div class="main_menu"><span class="main_text">방</span></div>
	<div class="main_menu"><span class="main_text">의</span></div>
	<div class="main_menu"><span class="main_text">달</span></div>
	<div class="main_menu"><span class="main_text">인</span></div>
</div>
<div id="player" class="main_player hid"></div>
<div class="main_sub_menu hid">
	<video class="main_player1" preload="none" loop autoplay width="100%"></video>
</div>
</div>
</body>
</html>
