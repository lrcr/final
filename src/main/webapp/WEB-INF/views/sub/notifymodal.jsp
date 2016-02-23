<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <!-- 상세페이지Modal -->
<c:forEach var="bdlist" items="${list}">

	<div class="modal fade detailmodal" id="boarddetail${bdlist.no}" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" >[제목] ${bdlist.title }</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<fieldset>
							<table class="table table-striped table-hover ">
								<thead>
									<tr>
										<th>[닉네임]${bdlist.nicknm }</th>
										<th>[작성일]<fmt:formatDate value="${bdlist.submit }" pattern="20yy/MM/dd"/></th>
										<th class="col-hits">[조회수]${bdlist.hits}</th>
									</tr>
								</thead>
							</table>

							<div class="col-lg-12">${bdlist.content}</div>

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