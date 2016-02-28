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
<link rel="stylesheet" href="css/reserve/fullcalendar.min.css">
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/reserve/reserve.css">
<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/reserve/moment.min.js"></script>
<script src="js/reserve/fullcalendar.min.js"></script>
<script src="js/jquery.bootstrap-pureAlert.min.js"></script>
<script src="js/common.js"></script>
<script src="js/reserve/reserve.js"></script>
</head>
<body>
	<div id="tv_box_out">
		<%@include file="sub/navbar.jsp"%>
		<%@include file="sub/login.jsp"%>
		<%@include file="sub/join.jsp"%>
		<div id="tv_box_in" class="mCustomScrollbar">
			<div class="container-fluid reservePage">
				<div class="panel panel-success">
					<c:if test="${reserve eq null}">
						<c:set var="tit" value="예약" />
						<c:set var="name" value="${member.nicknm}" />
					</c:if>
					<c:if test="${reserve ne null}">
						<c:set var="tit" value="수정" />
						<c:set var="name" value="${reserve.name}" />
					</c:if>
					<div class="panel-heading">
						<h3 class="panel-title reserve_title">${tit}</h3>
					</div>
					<form class="form-horizontal reserve_form" action="reservechk" method="post">
						<div class="panel-body">
							<div class="row">
								<div class="col-sm-6">
									<div class="thumbnail">
										<div class="row">
											<div class="col-xs-12 text-center reserve_name">${store.nm}</div>
											<div class="col-xs-12 text-center reserveImg">
												<img src="images/storeimg/${store.no}.jpg" />
												<input type="hidden" name="storeno" value="${store.no}" />
											</div>
											<p class="form-control-static col-xs-12 text-center">
												<c:if test="${reserve eq null}">
													<span class="nalja"></span>
													<span class="sigan"></span>
													<span class="inwon"></span>
												</c:if>
												<c:if test="${reserve ne null}">
													<span class="nalja">${reserve.nalja}</span>
													<span class="sigan">${reserve.sigan}</span>
													<span class="inwon">${reserve.inwon}명</span>
												</c:if>
											</p>
										</div>
									</div>
									<div class="thumbnail">
										<div id="calendar"></div>
										<!-- 달력 -->
									</div>
									<div class="thumbnail">
										<div class="form-group">
											<label for="seltime" class="col-xs-2 control-label">시간</label>
											<div class="col-xs-3">
												<select class="form-control" id="seltime">
													<option>선택</option>
													<c:forEach var="i" begin="10" end="18">
														<option>${i}:00</option>
													</c:forEach>
												</select>
											</div>
											<label for="selpep" class="col-xs-2 control-label">인원</label>
											<div class="col-xs-3">
												<select class="form-control" id="selpep">
													<option>선택</option>
													<c:forEach begin="1" end="15" varStatus="status">
														<option>${status.count}</option>
													</c:forEach>
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
												<input type="text" class="form-control" id="reserveName" name="name" placeholder="이름은 필수입니다" value="${name}">
											</div>
										</div>
										<div class="form-group">
											<label for="reservePhone" class="col-sm-3 control-label">연락처</label>
											<div class="col-sm-8">
												<input type="text" class="form-control" id="reservePhone" placeholder="번호는 필수입니다" value="${member.phone}">
											</div>
										</div>
										<div class="form-group">
											<label for="reserveEmail" class="col-sm-3 control-label">이메일</label>
											<div class="col-sm-8">
												<input type="text" class="form-control" id="reserveEmail" name="email" placeholder="이메일은 필수입니다" value="${member.email}" readonly="readonly">
											</div>
										</div>
										<div class="form-group">
											<label for="reserveMsg" class="col-sm-3 control-label">요청사항</label>
											<div class="col-sm-8">
												<textarea class="form-control" rows="3" id="treserveMsg" name="opinion" placeholder="하고싶은 말을 적어주세요">${reserve.opinion}</textarea>
											</div>
										</div>
										<div class="form-group">
											<label class="col-xs-3 control-label">예약내용</label>
											<div class="col-xs-8">
												<p class="form-control-static reserveCont">
													<c:if test="${reserve eq null}">
														<span class="nalja"></span>
														<span class="sigan"></span>
														<span class="inwon"></span>
														<input type="hidden" name="nalja" value="" />
														<input type="hidden" name="sigan" value="" />
														<input type="hidden" name="inwon" value="" />
													</c:if>
													<c:if test="${reserve ne null}">
														<span class="nalja">${reserve.nalja}</span>
														<span class="sigan">${reserve.sigan}</span>
														<span class="inwon">${reserve.inwon}명</span>
														<input type="hidden" name="nalja" value="${reserve.nalja}" />
														<input type="hidden" name="sigan" value="${reserve.sigan}" />
														<input type="hidden" name="inwon" value="${reserve.inwon}" />
													</c:if>
												</p>
											</div>
										</div>
									</div>
									<div class="thumbnail">
										<p class="text-success well well-sm">음식점정보</p>
										<div class="form-group">
											<label class="col-xs-3 control-label">상호명</label>
											<div class="col-xs-8">
												<p class="form-control-static storename">${store.nm}</p>
											</div>
										</div>
										<div class="form-group">
											<label class="col-xs-3 control-label">주소</label>
											<div class="col-xs-8">
												<p class="form-control-static">${store.addr}</p>
											</div>
										</div>
										<div class="form-group">
											<label class="col-xs-3 control-label">전화번호</label>
											<div class="col-xs-8">
												<p class="form-control-static">${store.tel}</p>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="panel-footer">
							<div class="text-center">
								<c:if test="${reserve eq null}">
									<input type="hidden" name="reup" value="chk" />
									<button type="button" class="btn btn-success btn_reserve">예약하기</button>
								</c:if>
								<c:if test="${reserve ne null}">
									<input type="hidden" name="no" value="${reserve.no}" />
									<input type="hidden" name="reup" value="up" />
									<button type="submit" class="btn btn-success btn_reserve">수정하기</button>
								</c:if>
							</div>
						</div>
					</form>
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