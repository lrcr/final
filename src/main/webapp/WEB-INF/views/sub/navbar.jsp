<%@ page contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<script>
	$(document).ready(function() {

		//     $(".vvv").on("submit",function(){
		//         $.ajax({
		//         	type: "post",
		//         	url: "goSearch.go",
		//         	data:  {title:$(".form-control").val()} , 
		//         	success: function(result){
		//         	$(".modal-body").html(result);
		//         	}
		//         })
		//         return false;
		//         });

		//     $('.form-control').keydown(function(e) {
		//         if (e.keyCode == 49) f();       
		//     });

		$(".myinfo").on("click", function() {
			$.ajax({ 
				type : "POST", 
				url : "myInfo",
				//data:{nick:"Aa"},
				success : function(result) {
					$(".modal-body2").html(result);
				}
			});
		});

	});
</script>
<nav class="navbar navbar-default navbar-collapse navbar-fixed-top nav_blk" id="nav_navbar">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="./">HOME</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">메뉴<span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="#">지역별</a></li>
						<li><a href="#">업종별</a></li>
					</ul>
				</li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="broadcast" id="broadcast">방송맛집</a></li>

				<!-- 사용자 맛집 추천 게시판 -->
				<li><a href="#">맛집추천</a></li>
				<li><a href="notify">공지사항</a></li>
				<li id="login-nav"><c:if test="${sessionScope.nicknm eq null}">
						<a href="#" id="go-login" data-toggle="modal"
							data-target="#sign-in">로그인</a>
					</c:if> <c:if test="${sessionScope.nicknm != null}">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown"
							role="button" aria-expanded="false"> ${nicknm}님<span
							class="caret"></span>
						</a>
						<c:if test="${sessionScope.nicknm != '관리자'}">
							<ul class="dropdown-menu" role="menu">
								<li><a class="myinfo" data-toggle="modal" data-target="#myInfo">나의 정보</a></li>
								<li><a href="#">나의 맛집</a></li>
								<li><a href="#">예약 확인</a></li>
							</ul>
						</c:if>
						<c:if test="${sessionScope.nicknm == '관리자'}">
							<ul class="dropdown-menu" role="menu">
								<li><a class="myinfo" data-toggle="modal" data-target="#myInfo">나의 정보</a></li>
								<li><a href="#">나의 맛집</a></li>
								<li><a href="#">예약 확인</a></li>
								<li><a href="#">관리자홈</a></li>
							</ul>
						</c:if>
					</c:if></li>
				<li id="signup-nav"><c:if test="${sessionScope.nicknm eq null}">
						<a href="#" id="go-join" data-toggle="modal"
							data-target="#sign-up">회원가입</a>
					</c:if>
					 <c:if test="${sessionScope.nicknm != null}">
						<a href="logout" id="logout">로그아웃</a>
					</c:if></li>
				<li>
					<form class="navbar-form navbar-right" action="search" method="post" role="search">
						<div class="input-group">
						<input type="text" class="form-control search-input"  name="text" placeholder="인생맛집">
							<span class="input-group-btn">
								<input type="submit" class="btn btn-default search-btn" value="검색">
							</span>
						</div>
					</form>
				</li>
			</ul>
		</div>
		<button type="button" class="nav_btn nav_btn_top">
			<span class="glyphicon glyphicon-triangle-top" aria-hidden="true"></span>
		</button>
		<button type="button" class="nav_btn nav_btn_bottom hid">
			<span class="glyphicon glyphicon-triangle-bottom" aria-hidden="true"></span>
		</button>
	</div>

	<div class="modal fade" id="myInfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" style="width:90%">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span><input class="btn btn-default" type="submit" value="Submit"><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">내 정보</h4>
				</div>
				<div class="modal-body2"></div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
</nav>