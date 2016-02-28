<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <!-- 맛집추천글 detail Modal -->

	<div class="modal fade" id="community-modal" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content rec-modal-content">
				
				
			</div><!-- content 닫기 -->
		</div>
	</div>

<!-- 글쓰기 Modal -->
<div class="modal fade" id="community-write" tabindex="-1" role="dialog"
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
				<form class="form-horizontal" action="upload" method="post" enctype="multipart/form-data">
					<fieldset>

						<div class="form-group ">
							<label for="rec-title" id="" class="col-lg-1 control-label rec-title-label">제목</label>
							<div class="col-lg-11">
								<input type="text" class="form-control" name="title"  id="rec-title" placeholder="제목을 입력하세요(필수)">
							</div>
						</div>
						<div class="form-group ">
							<div class="col-lg-12">
							<label for="file-upload" id="" class="control-label">대표이미지</label>
								<input class="form-control imgfile" type="file" name="imgfile" >
							</div>
						</div>

						<div id="summernote" class="rec-editor"></div>

						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
							<input id="rec-edit" class="btn btn-default" type="button" value="수정하기">
							<button id="rec-save" class="btn btn-default" type="button">미리보기</button>
							<button id="rec-done" type="submit" class="btn btn-primary" >완료</button>
							<!--   data-dismiss="modal" -->
						</div>
					</fieldset>
				</form>
			</div>
			
		</div>
	</div>
</div>