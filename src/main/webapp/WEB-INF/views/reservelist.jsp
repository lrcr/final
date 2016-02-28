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
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/star.css">
<link rel="stylesheet" href="css/reserve/reserve.css">
<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/common.js"></script>
<script src="js/reserve/reservelist.js"></script>
</head>
<body>
	<div id="tv_box_out">
		<%@include file="sub/navbar.jsp"%>
		<%@include file="sub/login.jsp"%>
		<%@include file="sub/join.jsp"%>
		<div id="tv_box_in" class="mCustomScrollbar">
			<div class="container-fluid reservelist">
				<div class="panel panel-success">
					<div class="panel-heading">
						<h3 class="panel-title">예약확인</h3>
					</div>
					<div class="panel-body">
						<div class="row">
							<c:forEach var="dto" items="${reserve}">
								<div class="col-sm-6 col-md-4 col-lg-3">
									<div class="thumbnail">
										<div class="text-center reserveImg" onmouseover="javascript:storeover(${dto.storeno},${dto.no});" onmouseout="javascript:storeout(${dto.no});" onclick="javascript:reserveone(${dto.no});">
											<img src="images/storeimg/${dto.storeno}.jpg" />
											<div class="text-center reserveTmp reserveTmp${dto.no} hid"></div>
										</div>
										<form class="form-horizontal reserveOne${dto.no}" action="reserve" method="post">
											<div class="form-group">
												<label class="col-xs-4 text-right control-label">예약자</label>
												<div class="col-xs-8">
													<p class="form-control-static">${dto.name}</p>
												</div>
											</div>
											<div class="form-group">
												<label class="col-xs-4 text-right control-label">예약일</label>
												<div class="col-xs-8">
													<p class="form-control-static">${dto.nalja}&nbsp;${dto.sigan}</p>
												</div>
											</div>
											<div class="form-group">
												<label class="col-xs-4 text-right control-label">예약인원</label>
												<div class="col-xs-8">
													<p class="form-control-static">${dto.inwon}명</p>
												</div>
											</div>
											<input type="hidden" value="${dto.no}" name="no" />
											<input type="hidden" value="${dto.storeno}" name="storeno" />
											<input type="hidden" value="${dto.email}" name="email" />
										</form>
									</div>
								</div>
							</c:forEach>
						</div>
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