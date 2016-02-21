<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">공지사항</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>


<!-- <form class="form-horizontal">
	<fieldset> -->
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="dataTable_wrapper">
							<table class="table table-striped table-bordered table-hover" 	id="dataTables-example">
								<thead>
									<tr>
										<th class="col-lg-1">번호</th>
										<th class="col-lg-8">제목</th>
										<th class="col-lg-2">닉네임</th>
										<th class="col-lg-1">조회수</th>
									</tr>
								</thead>
								<tbody id="board-list">
									<c:forEach items="${list}" var="bdlist">
										<tr>
											<td>${bdlist.rownum}</td>
											<td><a data-toggle="modal"
												data-target="#boarddetail${bdlist.no}" href="#">${bdlist.title }</a></td>
											<td>${bdlist.nicknm }</td>
											<td>${bdlist.hits }</td>
										</tr>
									</c:forEach>
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


		<div class="col-lg-12">
			<div class="col-lg-6" id="write-check">
				<c:if test="${sessionScope.nicknm != null}">
					<button type="button" class="btn btn-primary btn-lg write-login"
						data-toggle="modal" data-target="#writemodal">글쓰기</button>
				</c:if>
				<c:if test="${sessionScope.nicknm == null}">
					<input type="button" class="btn btn-primary not-login" value="글쓰기">
				</c:if>
			</div>
		</div>



<!-- 상세페이지Modal -->
<c:forEach var="bdlist" items="list">
<div class="modal fade" id="boarddetail" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">게시글</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal">
					<fieldset>
					
					
					</fieldset>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>
</c:forEach> 

<!-- 글쓰기 Modal -->
<div class="modal fade" id="writemodal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">게시글작성</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal">
					<fieldset>

						<div class="form-group ">
							<label for="write-title" id="write-title-label"
								class="col-lg-1 control-label">제목</label>
							<div class="col-lg-11">
								<input type="text" class="form-control" name="title"
									id="write-title" placeholder="제목을 입력하세요(필수)">
							</div>
						</div>

						<div id="summernote"></div>


					</fieldset>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				<button id="notify-edit" class="btn btn-default" type="button">수정</button>
				<button id="notify-save" class="btn btn-default" type="button">미리보기</button>
				<button id="write-done" type="button" class="btn btn-primary"
					data-dismiss="modal">완료</button>
			</div>
		</div>
	</div>
</div>





