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
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="https://bootswatch.com/slate/bootstrap.min.css" type="text/css" />
<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/main.js"></script>
<style type="text/css">
	html {height:100%;}
	body {height:100%; margin:0;}
	.container-fluid {padding:0; height:100%;}
	#main_main {height:100%; width:100%; margin:0 auto; position:relative;}
	#main_main:after {content:""; clear:both; display:block;}
	.main_index {text-align:center; overflow:hidden; width:100%; height:100%;}
	.main_index .main_menu {width:20%; height:100%; float:left;}
	.sub_menu {position:absolute; top:0; z-index:1; width:90%; height:100%;}
	.sub_menu_d {margin:0; width:25%; float:left; height:33.33%; padding-top:10%; text-align:center; font-size:20px; color:#eee; transition-property:background-color; transition-duration:0.6s;}
	.sub_menu_d:nth-child(1) {width:50%;}
	.sub_menu_d:nth-child(3) {height:66.66%; float:right;}
	.sub_menu_d:nth-child(4) {height:66.66%;}
	.sub_menu_d:nth-child(8) {width:50%;}
	.sub_menu a {display:inline-block; vertical-align:middle; text-decoration:none; color:inherit;}
	.main_text {color:#fff;}
	.main_player {position:absolute; top:0; z-index:-1;}
	.main_other {width:2.5%;}
@media screen and (max-width:767px){
/* 매우 작은 기기들 (모바일폰, 768px 보다 작은) screen-xs */
	body {background:#000;}
	#main_main {height:100%; width:100%;}
	.main_index .main_menu {width:100%; height:20%;}
	.sub_menu { width:100%; margin-left:0;}
	.sub_menu_d {text-align:center; background:rgba(119,119,119,0.4); font-size:20px; color:#eee; transition-property:background-color; transition-duration:0.6s;}
	#player {display:none;}
}
@media screen and (min-width:768px) and (max-width:991px){
/* 작은 기기들 (태블릿, 768px 이상) screen-sm*/
	/* #main_main {height:432px; width:768px; margin:0 auto; position:relative;} */
}
@media screen and (min-width:992px) and (max-width:1199px){
/* 중간 기기들 (데스크탑, 992px 이상) screen-md */
	/* #main_main {height:558px; width:992px; margin:0 auto; position:relative;} */
}
@media screen and (min-width:1200px){
/* 큰 기기들 (큰 데스크탑, 1200px 이상) screen-lg */
	/* #main_main {height:675px; width:1200px; margin:0 auto; position:relative;} */
}
</style>
<script type="text/javascript">
var main_back = ["#f1ac1d","#e57d04","#dc0030","#b10058","#7c378a","#3465aa","#09a275"];
var main_vid = ["fFZwgPcW7FM","ly6J5BQkXgA","4OFAY0Du65A","Tc67umPKFss","u_f2gzaDTKA"];
var main_sub_back = ["#ee6334","#ff8200","#ed1369","#777777","#00aba8","#666633","#13cced","#456c6c","#4dbf13","#794b80","#ec3b4b","#00fdfd"];
var main_sub_rgb = ["238,99,52","255,130,0","237,19,105","77,191,19","0,171,168","102,102,51","19,204,237","121,75,128","69,108,108","236,59,75","0,253,253","119,119,119"];
$(document).ready(function(){
	$(".sub_menu_d").each(function(i,e){
		//alert(e);
		$(e).css({"background":"rgba("+main_sub_rgb[i]+",0.4)"});
		$(e).hover(function(){
			$(this).css({"background":"rgba("+main_sub_rgb[i]+",1)"});
			//$(this).animate({"background":main_sub_back[i]},400);
		},function(){
			$(this).css({"background":"rgba("+main_sub_rgb[i]+",0.4)"});
			//$(this).animate({"background":"rgba("+main_sub_rgb[i]+",0.4)"},400);
		});
		
	});
	$(window).resize(function(){
		$(".main_menu").each(function(i,e){
			if($( window ).width()<768){
				//stopVideo();
				$(".sub_menu").css("margin-left",0);
			}else{
				if($(e).hasClass("this_view")){
					$(".sub_menu").css("margin-left",(i*2.5)+"%");
					//createYouTubeAPI(main_vid[i]);
					//changeVideoId(main_vid[i]);
				}
			}
		});
	}); 
	$(".main_menu").each(function(i,e){
		$(e).css({"background":main_back[i]});
		$(e).click(function(){
			$(".main_text").show();
			$(".main_menu").removeClass("this_view");
			$("#player,.sub_menu").addClass("hid");
			$(this).addClass("this_view");
			//$(".main_sub_menu").removeClass("hid").children().html("<source src=\"video/main_v"+(i+1)+".mp4\" type=\"video/mp4\"><source src=\"video/main_v"+(i+1)+".webm\" type=\"video/webm\">");
			$(".main_menu").stop().animate({"opacity":1,"width":"2.5%"},400);
			$(this).stop().animate({"opacity":0.4,"width":"90%"},400,function(){
				$(".sub_menu").stop().css("margin-left",(i*2.5)+"%");
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
<nav class="navbar navbar-default">
          <div class="container-fluid">
            <div class="navbar-header">
              <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
              <a class="navbar-brand" href="#">HOME</a>
            </div>
        
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
              <ul class="nav navbar-nav">
                <li class="active"><a href="#">Link <span class="sr-only">(current)</span></a></li>
                <li><a href="#">여기어때</a></li>
                <li class="dropdown">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Dropdown <span class="caret"></span></a>
                  <ul class="dropdown-menu" role="menu">
                    <li><a href="#">Action</a></li>
                    <li><a href="#">Another action</a></li>
                    <li><a href="#">Something else here</a></li>
                    <li class="divider"></li>
                    <li><a href="#">Separated link</a></li>
                    <li class="divider"></li>
                    <li><a href="#">One more separated link</a></li>
                  </ul>
                </li>
                <li><a href="#" data-toggle="modal" data-target="#sign-in">로그인</a></li>
                <li><a href="#" data-toggle="modal" data-target="#sign-up">회원가입</a></li>
              </ul>
              <form class="navbar-form navbar-left" role="search">
                <div class="form-group">
                  <input type="text" class="form-control" placeholder="인생맛집">
                </div>
                <button type="submit" class="btn btn-default">검색</button>
              </form>
              <ul class="nav navbar-nav navbar-right">
                <li><a href="#">Link</a></li>
              </ul>
            </div>
          </div>
        </nav>
        
        
        <!-- Login -->
        <div class="modal fade" id="sign-in" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">로그인</h4>
              </div>
              <div class="modal-body">
                <form role="form">
                    <fieldset>
                        <div class="form-group">
                            <input class="form-control" placeholder="E-mail" name="email" type="email" autofocus="">
                        </div>
                        <div class="form-group">
                            <input class="form-control" placeholder="Password" name="password" type="password" value="">
                        </div>
                        <div class="checkbox">
                            <label>
                                <input name="remember" type="checkbox" value="Remember Me">Remember Me
                            </label>
                        </div>
                    </fieldset>
                </form>
              </div>
              <div class="modal-footer">
                    <a href="#" class="btn btn-lg btn-primary btn-block">Login</a>
              </div>
            </div>
          </div>
        </div>
        
        <!-- 회원가입 -->
        
        <div id="sign-up" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
          <div class="modal-dialog modal-lg">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">회원가입</h4>
              </div>
              <div class="modal-body">
                <form class="form-horizontal">
                  <fieldset>
                    <div class="form-group">
                      <label for="inputEmail" class="col-lg-2 control-label">Email</label>
                      <div class="col-lg-10">
                        <input type="text" class="form-control" id="inputEmail" placeholder="Email">
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="inputPassword" class="col-lg-2 control-label">Password</label>
                      <div class="col-lg-10">
                        <input type="password" class="form-control" id="inputPassword" placeholder="Password">
                        <div class="checkbox">
                          <label>
                            <input type="checkbox"> Checkbox
                          </label>
                        </div>
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="textArea" class="col-lg-2 control-label">Textarea</label>
                      <div class="col-lg-10">
                        <textarea class="form-control" rows="3" id="textArea"></textarea>
                        <span class="help-block">A longer block of help text that breaks onto a new line and may extend beyond one line.</span>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-lg-2 control-label">Radios</label>
                      <div class="col-lg-10">
                        <div class="radio">
                          <label>
                            <input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked="">
                            Option one is this
                          </label>
                        </div>
                        <div class="radio">
                          <label>
                            <input type="radio" name="optionsRadios" id="optionsRadios2" value="option2">
                            Option two can be something else
                          </label>
                        </div>
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="select" class="col-lg-2 control-label">Selects</label>
                      <div class="col-lg-10">
                        <select class="form-control" id="select">
                          <option>1</option>
                          <option>2</option>
                          <option>3</option>
                          <option>4</option>
                          <option>5</option>
                        </select>
                        <br>
                        <select multiple="" class="form-control">
                          <option>1</option>
                          <option>2</option>
                          <option>3</option>
                          <option>4</option>
                          <option>5</option>
                        </select>
                      </div>
                    </div>
                    <div class="form-group">
                      <div class="col-lg-10 col-lg-offset-2">
                        <button type="reset" class="btn btn-default">Cancel</button>
                        <button type="submit" class="btn btn-primary">Submit</button>
                      </div>
                    </div>
                  </fieldset>
                </form>
              </div>
            </div><!-- /.modal-content -->
          </div>
        </div>
<div class="container-fluid">
<div id="main_main">
	<div class="main_index">
		<div class="main_menu"><span class="main_text">지역별 맛집</span></div>
		<div class="main_menu"><span class="main_text">업종별 맛집</span></div>
		<div class="main_menu"><span class="main_text">의</span></div>
		<div class="main_menu"><span class="main_text">달</span></div>
		<div class="main_menu"><span class="main_text">인</span></div>
	</div>
	<div class="sub_menu hid">
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
</body>
</html>
