<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	<link rel="stylesheet" href="css/common.css" type="text/css" />
	<link rel="stylesheet" href="css/star.css" type="text/css" />
	<link rel="stylesheet" href="css/join.css" type="text/css" />
	<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/common.js"></script>
	<script type="text/javascript" src="https://maps.google.com/maps/api/js?sensor=true"></script>
	<script type="text/javascript" src="js/map/jquery.ui.map.js"></script>
	<script type="text/javascript" src="js/map/jquery.ui.map.extensions.js"></script>
	<script type="text/javascript" src="js/map/map.js"></script>
</head>
<body>
	<div id="tv_box_out">
		<%@include file="sub/navbar.jsp"%>
		<%@include file="sub/login.jsp"%>
		<%@include file="sub/join.jsp"%>
		<div id="tv_box_in" class="mCustomScrollbar">
			<%@include file="sub/content.jsp"%>
		</div>
		<%@include file="sub/storedetail.jsp"%>
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
	<script type="text/javascript" src="js/star.js"></script>
	<script type="text/javascript" src="js/search.js"></script>
</body>
</html>