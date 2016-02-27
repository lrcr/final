<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>True맛집</title>
<link rel="stylesheet" href="https://bootswatch.com/slate/bootstrap.min.css">
<link rel="stylesheet" href="css/jquery.mCustomScrollbar.css">
<link rel="stylesheet" href="css/fullcalendar.min.css">
<link rel="stylesheet" href="css/common.css">
<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/reserve/moment.min.js"></script>
<script src="js/reserve/fullcalendar.min.js"></script>
<script src="js/common.js"></script>
<script src="js/reserve/reserve.js"></script>
</head>
<body>
	<div id="tv_box_out">
		<%@include file="sub/navbar.jsp"%>
		<%@include file="sub/login.jsp"%>
		<%@include file="sub/join.jsp"%>
		<div id="tv_box_in" class="mCustomScrollbar">
			<div class="container-fluid">
				<div class="panel panel-success">
					<div class="panel-heading">
						<h3 class="panel-title">예약하기</h3>
					</div>
					<div class="panel-body">
						<form class="form-horizontal">
							<div class="row">
								<div class="col-sm-6">
									<div class="thumbnail">
										<div class="row">
											<div class="col-xs-12 text-center"><img src="images/star/star1.png" /></div>
											<div class="col-xs-12 text-center">가게명</div>
										</div>
									</div>
									<div class="thumbnail">
									<div id="calendar"></div>
									
									</div>
									<div class="thumbnail">
										<div class="form-group" style="border: 1px solid #ff0000;">
											<label for="seltime" class="col-xs-2 control-label" style="border: 1px solid #fff000;">시간</label>
											<div class="col-xs-3">
												<select class="form-control" id="seltime">
													<option>09:00</option>
													<option>2</option>
													<option>3</option>
													<option>4</option>
													<option>5</option>
												</select>
											</div>
											<label for="selpep" class="col-xs-2 control-label">인원</label>
											<div class="col-xs-2">
												<select class="form-control" id="selpep">
													<option>1</option>
													<option>2</option>
													<option>3</option>
													<option>4</option>
													<option>5</option>
												</select>
											</div>
										</div>
									</div>
								</div>
								<div class="col-sm-6">
									<div class="thumbnail">
									<p class="text-success well well-sm">예약자정보</p>
										<div class="form-group">
											<label for="reserveName" class="col-sm-3 control-label">예약자</label>
											<div class="col-sm-8">
												<input type="text" class="form-control" id="reserveName" placeholder="이름을 입력하세요">
											</div>
										</div>
										<div class="form-group">
											<label for="reservePhone" class="col-sm-3 control-label">연락처</label>
											<div class="col-sm-8">
												<input type="text" class="form-control" id="reservePhone" placeholder="번호를 입력하세요">
											</div>
										</div>
										<div class="form-group">
											<label for="reserveEmail" class="col-sm-3 control-label">이메일</label>
											<div class="col-sm-8">
												<input type="text" class="form-control" id="reserveEmail" placeholder="이메일을 입력하세요">
											</div>
										</div>
										<div class="form-group">
											<label for="reserveMsg" class="col-sm-3 control-label">요청사항</label>
											<div class="col-sm-8">
												<textarea class="form-control" rows="3" id="treserveMsg" placeholder="하고싶은 말을 적어주세요"></textarea>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-3 control-label">예약내용</label>
											<div class="col-sm-8">
												<p class="form-control-static">email@example.com</p>
											</div>
										</div>
									</div>
									<div class="thumbnail">
										<p class="text-success well well-sm">음식점정보</p>
										<div class="form-group">
											<label class="col-sm-3 control-label">상호명</label>
											<div class="col-sm-8">
												<p class="form-control-static">email@example.com</p>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-3 control-label">주소</label>
											<div class="col-sm-8">
												<p class="form-control-static">email@example.com</p>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-3 control-label">전화번호</label>
											<div class="col-sm-8">
												<p class="form-control-static">email@example.com</p>
											</div>
										</div>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="main_support">
		<img src="images/support.png" width="80%" />
	</div>
	<script src="js/jquery.mCustomScrollbar.min.js"></script>
	<script src="js/login-join/join.js"></script>
	<script src="js/login-join/login.js"></script>
	<script src="js/search.js"></script>
	<script src="js/detail.js"></script>
</body>
</html>