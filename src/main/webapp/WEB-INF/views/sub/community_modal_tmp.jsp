<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<!-- Modal Content 부분 -->
<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
		<span aria-hidden="true">&times;</span>
	</button>
	<h4 class="modal-title">[제목]${recinfo.title}</h4>
</div>
<div class="modal-body">
	<form class="form-horizontal">
		<fieldset>
			<table class="table table-striped table-hover ">
				<thead>
					<tr>
						<th>[닉네임]${recinfo.nicknm}</th>
						<th>[작성일]<fmt:formatDate value="${recinfo.submit}" pattern="20yy/MM/dd"/></th>
						<th class="">[조회수]${recinfo.hits}</th>
					</tr>
				</thead>
			</table>
			<img class="req-img" src="resources/upload/${recinfo.no}.png" alt="이미지 로딩중">
			<div class="col-lg-12">${recinfo.content}</div>
		</fieldset>
	</form>
</div>

<div class="modal-footer">
	<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
</div>