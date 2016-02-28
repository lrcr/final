<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>True맛집</title>
	<link rel="stylesheet" href="https://bootswatch.com/slate/bootstrap.min.css">
    <link rel="stylesheet" href="css/board/metisMenu.min.css">
    <link rel="stylesheet" href="css/board/dataTables.bootstrap.css">
    <link rel="stylesheet" href="css/board/font-awesome.min.css">
    <link rel="stylesheet" href="css/jquery.mCustomScrollbar.css">
	<link rel="stylesheet" href="css/common.css">
	<link rel="stylesheet" href="css/star.css">
	<link rel="stylesheet" href="css/join.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.0/summernote.css">
	<script src="js/jquery-1.11.3.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/common.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.0/summernote.js"></script>
	<script src="js/board/kor.js"></script>
</head>
<body>
	<div id="tv_box_out">
		<%@include file="sub/navbar.jsp"%>
		<%@include file="sub/login.jsp"%>
		<%@include file="sub/join.jsp"%>
		<div id="tv_box_in" class="mCustomScrollbar">
			<%@include file="sub/community_list.jsp" %>
		</div>
		<%@include file="sub/community_modal.jsp" %>
	</div>
	<div class="main_support">
		<img src="images/support.png" width="80%" />
	</div>
	<script src="js/jquery.mCustomScrollbar.min.js"></script>
    <script src="js/board/metisMenu.min.js"></script>
    <script src="js/board/jquery.dataTables.min.js"></script>
    <script src="js/board/dataTables.bootstrap.min.js"></script>
    <script src="js/board/sb-admin-2.js"></script>
    <script src="js/board/responsive.js"></script>
	<script src="js/login-join/join.js"></script>
	<script src="js/login-join/login.js"></script>
	<script src="js/board/texteditor.js"></script>
	<script src="js/board/community.js"></script>
	<script src="js/search.js"></script>
</body>
</html>