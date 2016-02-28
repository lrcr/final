<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div class="row">
	<div class="col-lg-12">
		<div class="col-lg-12"><h1 class="page-header">내가 가본 맛집</h1></div>
	</div>
	<!-- /.col-lg-12 -->
	<div class="col-lg-12">
			<div class="col-lg-12 col-xs-12 col-lg-offset-11 col-xs-offset-9 req-login-check" >
			<c:if test="${sessionScope.nicknm != null}">
				<button type="button" class="btn btn-primary write-login" data-toggle="modal" data-target="#community-write">글쓰기</button>
			</c:if>
			<c:if test="${sessionScope.nicknm == null}">
				<input type="button" class="btn btn-primary not-login" value="글쓰기">
			</c:if>
			</div>
		</div>
</div>

<!-- <form class="form-horizontal">
	<fieldset> -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-body">
				<div class="dataTable_wrapper">
					<table class="table table-striped table-bordered table-hover dataTables-example" >
						<thead>
							<tr>
								<th class="col-lg-1 col-xs-1"">이미지</th>
								<th class="col-lg-8 col-xs-8">제목</th>
								<th class="col-lg-2 col-xs-2">닉네임</th>
								<th class="col-lg-1 col-xs-1">조회수</th>
							</tr>
						</thead>
						<tbody id="board-list">
							<c:forEach items="${list}" var="rec">
								<tr>
									<td><div class="rec-list-img" style="width: 100px;  height:100px; text-indent: -1000px;background:url(resources/upload/${rec.no}.png) no-repeat; background-size: 100% 100%; " >${rec.rownum}</div></td>
									<td><a id="${rec.no}th-list" class="rec-list-title" data-toggle="modal" data-target="#community-modal" href="addrechit?no=${rec.no}">${rec.title}</a></td>
									<td>${rec.nicknm}</td>
									<td class="col-hits">${rec.hits}</td>
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
