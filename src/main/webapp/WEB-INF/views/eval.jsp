<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>평점</title>
	<link rel="stylesheet"
		href="https://bootswatch.com/slate/bootstrap.min.css" type="text/css" />
	<link rel="stylesheet" href="css/star.css" type="text/css" />
	<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
</head>
<body>
	<span class="star-rating"> 
		<input type="radio" name="rating" value="1"><i></i> 
		<input type="radio" name="rating" value="2"><i></i>
		<input type="radio" name="rating" value="3"><i></i>
		<input type="radio" name="rating" value="4"><i></i>
		<input type="radio" name="rating" value="5"><i></i>
	</span>
	
	<strong class="choice">제 점수는요</strong>

	<span class="star-rating small"> 
		<input type="radio" name="rating" value="1"><i></i> 
		<input type="radio" name="rating" value="2"><i></i>
		<input type="radio" name="rating" value="3"><i></i>
		<input type="radio" name="rating" value="4"><i></i>
		<input type="radio" name="rating" value="5"><i></i>
	</span>

	<script type="text/javascript" src="js/star.js"></script>
</body>
</html>