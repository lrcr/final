<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>True맛집</title>
	<link rel="stylesheet" href="https://bootswatch.com/slate/bootstrap.min.css" type="text/css" />
    <link href="css/board/metisMenu.min.css" rel="stylesheet">
    <link href="css/board/dataTables.bootstrap.css" rel="stylesheet">
    <link href="css/board/font-awesome.min.css" rel="stylesheet" >
    <link rel="stylesheet" href="css/jquery.mCustomScrollbar.css" type="text/css" />
	<link rel="stylesheet" href="css/common.css">
	<link rel="stylesheet" href="css/index.css">
	<link rel="stylesheet" href="css/star.css" type="text/css" />
	<link rel="stylesheet" href="css/join.css" type="text/css" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.0/summernote.css" >
	<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/common.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.0/summernote.js"></script>
	<script src="js/board/kor.js"></script>
</head>
<body>
	<div id="tv_box_out">
		<%@include file="sub/navbar.jsp"%>
		<%@include file="sub/login.jsp"%>
		<%@include file="sub/join.jsp"%>
		<div id="tv_box_in" class="mCustomScrollbar">
		<div id="tv_box_in">
			<%@include file="sub/notify.jsp" %>
		</div>
		<%@include file="sub/notifymodal.jsp" %>
	</div>
	<div class="main_support">
		<img src="images/support.png" width="80%" />
	</div>
	<script type="text/javascript" src="js/jquery.mCustomScrollbar.min.js"></script>
    <script src="js/board/metisMenu.min.js"></script>
    <script src="js/board/jquery.dataTables.min.js"></script>
    <script src="js/board/dataTables.bootstrap.min.js"></script>
    <script src="js/board/sb-admin-2.js"></script>
    <script type="text/javascript" src="js/board/responsive.js"></script>
	<script type="text/javascript" src="js/login-join/join.js"></script>
	<script type="text/javascript" src="js/login-join/login.js"></script>
	<script type="text/javascript" src="js/board/texteditor.js"></script>
	<script type="text/javascript" src="js/search.js"></script>
</body>
</html>