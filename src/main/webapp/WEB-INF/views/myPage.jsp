<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>
	$(document).ready(function() {
		$(".updateInfo").on("click", function() {
			var bbb = confirm("진짜수정할거야?");
			if (bbb == true) {
				alert("수정완료");
			} else {
				alert("수정취소");
			}
		});
	});
</script>
<title>Insert title here</title>
</head>
<body>
	<%-- ?email=${myinf.email}&pw=${myinf.pw}&nickname=${myinf.nickname}&phone=${myinf.phone}&agree=${myinf.agree} --%>
	<form action="goUpdate" class="goUpdate" method="post">
		<div>
			<label class="control-label">이메일</label> <input type="text" class="form-group" value="${myinfo.email}" name="email" readonly />
		</div>
		<div>
			<label class="control-label">비밀번호</label> <input type="text" class="form-group" value="${myinfo.pw}" name="pw" />
		</div>
		<div>
			<label class="control-label">닉네임</label> <input type="text" class="form-group" value="${myinfo.nicknm}" name="nicknm" />
		</div>
		<div>
			<label class="control-label">전화번호</label> <input type="text" class="form-group" value="${myinfo.phone}" name="phone" />
		</div>
		<div>
			<label class="control-label">카톡수신여부</label> <input type="text" class="form-group" value="${myinfo.agree}" name="agree" />
		</div>
		<input class="updateInfo btn-default" type="submit" value="Submit">
	</form>
</body>
</html>