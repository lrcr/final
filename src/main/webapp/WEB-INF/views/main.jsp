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
	<link rel="stylesheet" href="css/common.css">
	<link rel="stylesheet" href="css/main.css">
	<link rel="stylesheet" href="css/star.css" type="text/css" />
	<link rel="stylesheet" href="css/join.css" type="text/css" />
	<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/common.js"></script>
	<script type="text/javascript" src="https://maps.google.com/maps/api/js?sensor=true"></script>
	<script type="text/javascript" src="js/jquery.ui.map.js"></script>
	<script type="text/javascript" src="js/jquery.ui.map.extensions.js"></script>
	<script type="text/javascript" src="js/map.js"></script>
</head>
<body>
	<div id="tv_box_out">
		<%@include file="navbar.jsp"%>
		<%@include file="login.jsp"%>
		<%@include file="join.jsp"%>
		<div id="tv_box_in">
			<%@include file="content.jsp"%>
			<%-- <%@include file="requestboard.jsp"%> --%>
		</div>
	</div>
	<div class="main_support">
		<img src="images/support.png" width="80%" />
	</div>
	<script type="text/javascript" src="js/join.js"></script>
	<script type="text/javascript" src="js/login.js"></script>
	<script type="text/javascript" src="js/star.js"></script>
</body>
</html>