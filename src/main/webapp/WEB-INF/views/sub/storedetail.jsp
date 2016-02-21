<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:forEach items="${broadcast}" var="dto">

	<!--#storedetail-->

	<div id="storedetail${dto.no }" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h1 class="modal-title">${dto.nm}</h1>
				</div>
				<div class="modal-body ">
					<form class="form-horizontal">
						<fieldset>

							<div class="detail-frame col-lg-12">
								<c:if test="${dto.link eq null }">
									<img alt="이미지 대체">
								</c:if>
								<c:if test="${dto.link !=null}">
									<div class="embed-responsive embed-responsive-16by9">
										<iframe class="embed-responsive-item" src="${dto.link}"></iframe>
									</div>
								</c:if>
							</div>

							<div class="col-lg-12" style="height: 10px"></div>
							<div class="col-lg-12">
								<div class="col-lg-12 well">
									<p>
									<h4>${dto.info}</h4>
									</p>
								</div>
							</div>

							<div class="col-lg-12">
								<div class="table-responsive">
									<table class="table">
										<thead>
											<tr>
												<th><h4>[전화번호]</h4></th>
												<th><h4>${dto.tel}</h4></th>
												<th><h4>[예약정보]</h4></th>
												<th><h4>
														<c:if test="${dto.reserve eq 'OFF'}">없음</c:if>
														<c:if test="${dto.reserve eq 'ON'}">예약가능</c:if>
													</h4></th>
											</tr>
										</thead>
										<thead>
											<tr>
												<th><h4>[관련 키워드]</h4></th>
												<th><h4>${dto.keyword }</h4></th>
												<th><h4>[영업시간]</h4></th>
												<th><h4>${dto.time }</h4></th>
											</tr>
										</thead>
										<thead>
											<tr>
												<th><h4>[평점]</h4></th>
												<th></th>
												<th>${dto.eval}</th>
												<th></th>
											</tr>
										</thead>
										<thead>
											<tr>
												<th><h4>[위치]</h4></th>
												<th><h4>${dto.addr }</h4></th>
												<th><a class="btn btn-primary" href="javascript:viewmap(${dto.loc },${dto.no });">지도보기</a></th>
												<th><a class="btn btn-primary" href="${dto.site}" target="block">홈페이지</a></th>
											</tr>
										</thead>
									</table>
								</div>
							</div>

							<div class="col-lg-12">
								<!-- 지도  -->
								<div id="${dto.no}th-mview" class="col-lg-12 mapview"></div>
							</div>


							<div class="col-lg-12">
								<strong class="choice col-lg-6">제 점수는요</strong> <span class="star-rating col-lg-6"> <input type="radio" name="rating" value="1"><i></i> <input type="radio" name="rating" value="2"><i></i> <input type="radio" name="rating" value="3"><i></i> <input type="radio" name="rating" value="4"><i></i> <input type="radio" name="rating" value="5"><i></i>
								</span>
							</div>

							<div class="form-group col-lg-12">
								<div class="input-group">
									<input type="text" class="form-control" placeholder="댓글 내용을 입력하세요"> 
									<span class="input-group-btn">
										<button class="btn btn-default" type="button">평가하기</button>
									</span>
								</div>
							</div>
						</fieldset>
					</form>
				</div>
				<!-- modal body -->
			</div>
			<!-- /.modal-content -->
		</div>
	</div>

</c:forEach>