<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
					<table class="table table-striped table-bordered table-hover dataTables-example" >
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
									<td><a class="col-title" data-toggle="modal" data-target="#boarddetail${bdlist.no}"  href="addhit?no=${bdlist.no}">${bdlist.title }</a></td>
									<td>${bdlist.nicknm }</td>
									<td class="col-hits">${bdlist.hits}</td>
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








