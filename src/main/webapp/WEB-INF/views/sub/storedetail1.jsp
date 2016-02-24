<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
									<img class="detail-img" src="images/storeimg/${dto.no}.jpg"alt="이미지 로딩 실패">
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
												<th>
													<fmt:parseNumber value="${dto.eval}" var="eval"/>
													<span class="star-rating small">
														<c:if test="${eval==5}">
															<i></i><i></i><i></i><i></i><i class="on"></i>
														</c:if>
														<c:if test="${eval>=4 && eval<5}">
															<i></i><i></i><i></i><i class="on"></i><i></i>
														</c:if>
														<c:if test="${eval>=3 && eval<4}">
															<i></i><i></i><i class="on"></i><i></i><i></i>
														</c:if>
														<c:if test="${eval>=2 && eval<3}">
															<i></i><i class="on"></i><i ></i><i></i><i></i>
														</c:if>
														<c:if test="${eval>=1 && eval<2}">
															<i></i><i class="on"></i><i ></i><i></i><i></i>
														</c:if>
														<c:if test="${eval<1}">
															<i></i><i></i><i></i><i></i><i></i>
														</c:if>
													</span>	
												</th>
												<th><h4>${dto.eval}</h4></th>
												<th><h4>[분류]${dto.indu}</h4></th>
											</tr>
										</thead>
										<thead>
											<tr>
												<th><h4>[위치]</h4></th>
												<th><h4>${dto.addr }</h4></th>
												<th><a class="btn btn-primary" href="javascript:viewmap(${dto.loc},${dto.no});">지도보기</a></th>
												<c:if test="${dto.site !=null}">
													<th><a class="btn btn-primary" href="${dto.site}" target="block">홈페이지</a></th>
												</c:if>
												<c:if test="${dto.site == null}">
													<th></th>
												</c:if>
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
								<strong class="choice col-lg-9"><h4>제 점수는요</h4></strong> 
 								<span class="star-rating small col-lg-3 right"> 
 									<input type="radio" name="rating" value="1"><i></i> 
 									<input type="radio" name="rating" value="2"><i></i> 
 									<input type="radio" name="rating" value="3"><i></i> 
 									<input type="radio" name="rating" value="4"><i></i> 
 									<input type="radio" name="rating" value="5"><i></i>
  								</span>		  								
 								<span><a id="kakao-link-btn" href="javascript:cacaolink('${dto.keyword}','${dto.nm}','${dto.no}');">
 									<img src="http://dn.api1.kage.kakao.co.kr/14/dn/btqa9B90G1b/GESkkYjKCwJdYOkLvIBKZ0/o.jpg" width="50px"/>
 								</a></span>
  							</div >		  							
							
							<div class="col-lg-12">
								<div class="form-group col-lg-12" >
								  <div class="input-group detail-input">
								  <c:if test="${sessionScope.nicknm != null}">
								     <input type="text" id="${dto.no}th-input" class="form-control"  placeholder="댓글 내용을 입력하세요">
								     <span class="input-group-btn">
								      <button class="btn btn-default eval-btn" type="button">평가하기</button>
								    </span>
								   </c:if>
								   <c:if test="${sessionScope.nicknm == null}">
								   	 <input type="text" id="${dto.no}th-input" class="form-control disabled-input"  placeholder="로그인이 필요합니다" disabled>
								   	 <span class="input-group-btn">
								      <button class="btn btn-default eval-btn" type="button" disabled>평가하기</button>
								    </span>
								   </c:if>
								   
								  </div>
								</div>
							</div>
								
								<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-body">
				<div class="dataTable_wrapper">
					<table class="table table-striped table-bordered table-hover dataTables-example" >
						<thead>
							<th>번호</th><th>닉네임</th><th>내용</th><th>점수</th><th>작성일</th>
						</thead>
						<tbody id="${dto.no}th-reply">
							<c:if test="${dto.no==myno }">
							<c:forEach items="${reply}" var="comment">
								<tr>
									<td class="col-lg-1">${comment.no}</td>
									<td class="col-lg-1">${comment.nickname}</td>
									<td class="col-lg-6">${comment.ment}</td>
									<td class="col-lg-3">${comment.eval}</td>
									<td class="col-lg-1">${comment.submit}</td>
								</tr>
							</c:forEach>
							</c:if>
						</tbody>
					</table>
				</div>
				<!-- /.table-responsive -->
			</div>
			<!-- /.panel-body -->
		</div>
		<!-- /.panel -->
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
								
								
						</fieldset>
					</form>
				</div>
				<!-- modal body -->
			</div>
			<!-- /.modal-content -->
		</div>
	</div>

</c:forEach>