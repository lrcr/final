<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>관리자홈</title>
<link href="https://bootswatch.com/cosmo/bootstrap.min.css" rel="stylesheet">
<link href="css/admin/bootstrap-table.css" rel="stylesheet">
<link href="css/admin/styles.css" rel="stylesheet">
<link href='css/admin/fullcalendar.min.css' rel="stylesheet"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.0/summernote.css">
<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src='js/admin/moment.min.js'></script>
<script src='js/admin/fullcalendar.min.js'></script>
<script src="js/admin/bootstrap-table.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.0/summernote.js"></script>
<script src="js/board/kor.js"></script>
<style type="text/css">
.modal-dialog{z-index:10000;}
</style>
</head>

<body>
		<%@include file="adminnav.jsp"%>
		<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">			
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>공지사항관리</h1>
			</div>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default" style="position:relative;">
					<div class="panel-heading">게시글 목록</div>
					<div class="panel-body">
						<div id="my_menu">
						
							<button id="delete" class="btn btn-default">삭제</button>&nbsp;
							<button class="btn btn-success write-login" data-toggle="modal" data-target="#writemodal">글쓰기</button>
						</div>
						<table id="board_table" data-toggle="table" data-url="tables/data1.json"  data-show-refresh="true" data-show-toggle="true" data-show-columns="true" data-search="true" data-select-item-name="toolbar1" data-pagination="true" data-sort-name="name" data-sort-order="desc">
						    <thead>
							    <tr>
							        <th data-field="check" data-checkbox="true" ></th>
							        <th data-field="no" data-sortable="true">번호</th>
							        <th data-field="title" data-sortable="true">제목</th>
							        <th data-field="nicknm" data-sortable="true">게시자</th>
							        <th data-field="hits" data-sortable="true">조회수</th>
							    </tr>
						    </thead>
						    <tbody>
						    	<c:forEach items="${list}" var="bdlist">
								<tr>
									<td></td>
									<td>${bdlist.rownum}</td>
									<td><a class="col-title" data-toggle="modal" data-target="#boarddetail${bdlist.no}" href="addhit?no=${bdlist.no}">${bdlist.title}</a></td>
									<td>${bdlist.nicknm }</td>
									<td class="col-hits">${bdlist.hits}</td>
								</tr>
							</c:forEach>
						    </tbody>
						</table>
					</div>
				</div>
			</div>
		</div><!--/.row-->	
	</div><!--/.main-->
	<%@include file="../sub/notifymodal.jsp"%>
	<script src="js/admin/admin.js"></script>
	<script src="js/board/responsive.js"></script>
	<script src="js/board/texteditor.js"></script>
</body>

</html>