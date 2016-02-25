<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 회원정보 수정 -->
<form action="goUpdate" class="goUpdate form-horizontal" method="post">
	<div class="form-group">
		<label class="col-sm-2 control-label">이메일</label>
		<div class="col-sm-9">
			<p class="form-control-static">${myinfo.email}</p>
		</div>
		<input type="hidden" class="form-control" name="email" value="${myinfo.email}">
	</div>
	<div class="form-group">
		<div class="col-sm-offset-2 col-sm-10">
			<button type="button" class="btn btn-default infopwch">비밀번호 변경</button>
		</div>
	</div>
	<div class="myinfo_pw hid">
		<div class="form-group">
			<label class="col-sm-2 control-label" for="myinfopassword1">비밀번호</label>
			<div class="col-sm-9">
				<input type="password" class="form-control" id="myinfopassword1">
			</div>
			<label class="control-label myinfo_pw1msg"></label>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label" for="myinfopassword2">비밀번호 확인</label>
			<div class="col-sm-9">
				<input type="password" class="form-control" id="myinfopassword2" name="pw" value="${myinfo.pw}">
			</div>
			<label class="control-label myinfo_pw2msg"></label>
		</div>
	</div>
	<div class="form-group">
		<label class="col-sm-2 control-label" for="myinfonicknm">닉네임</label>
		<div class="col-sm-9">
			<div class="input-group">
				<input type="text" class="form-control" id="myinfonicknm" name="nicknm" value="${myinfo.nicknm}">
				<div class="input-group-btn">
					<button type="button" class="btn btn-default myinfo_nmcheck">중복체크</button>
				</div>
			</div>
			<label class="control-label myinfo_nmmsg"></label>
		</div>
	</div>
	<div class="form-group">
		<label class="col-sm-2 control-label" for="myinfophone">전화번호</label>
		<div class="col-sm-9">
			<input type="text" class="form-control" id="myinfophone" name="phone" value="${myinfo.phone}">
		</div>
		<label class="control-label myinfo_phmsg"></label>
	</div>
	<c:if test="${myinfo.agree eq 'ok'}">
		<c:set var="active_ok" value="active" />
		<c:set var="checked_ok" value="checked" />
	</c:if>
	<c:if test="${myinfo.agree eq 'no'}">
		<c:set var="active_no" value="active" />
		<c:set var="checked_no" value="checked" />
	</c:if>
	<div class="form-group">
		<label class="col-sm-6 control-label">카카오톡 알림 수신 동의 여부</label>
		<div class="btn-group col-sm-6" data-toggle="buttons">
			<label class="btn btn-primary radio-inline ${active_ok}"><input type="radio" name="agree" value="ok" autocomplete="off" ${checked_ok}> 수신 </label> <label class="btn btn-primary radio-inline ${active_no}"><input type="radio" name="agree" value="no" autocomplete="off" ${checked_no}> 거부 </label>
		</div>
	</div>
	<div class="form-group">
		<div class="col-xs-offset-4 col-xs-8">
			<button class="btn btn-default updateInfo" type="submit">수정</button>
			<button type="button" class="btn btn-default" data-dismiss="modal" aria-hidden="true">취소</button>
		</div>
	</div>
</form>
<script>
	// 비밀번호 변경
	$("#myInfo .infopwch").on("click", function() {
		$("#myInfo .myinfo_pw").removeClass("hid");
		$("#myinfopassword2").val("");
		$(this).hide()
	});

	//submit 클릭시
	$(".updateInfo").on("click", function() {
		var nm = $("#myinfonicknm").val().length;
		var pw1 = $("#myinfopassword1").val().length;
		var pw2 = $("#myinfopassword2").val().length;
		var ph = $("#myinfophone").val().length;
		console.log("nm:"+nm);
		console.log("pw1:"+pw1);
		console.log("pw2:"+pw2);
		console.log("ph:"+ph);
1		if ($("#myInfo .myinfo_pw").hasClass("hid")){
			if (pw1 == 0) {
				$(".myinfo_pw1msg").text("비밀번호를 입력하세요");
				var msg = $(".myinfo_pw1msg");
				msg.animate({opacity : '1'}, "slow");
				msg.animate({opacity : '0'}, "slow");
				msg.animate({opacity : '1'}, "slow");
				return false;
			}else if (pw2 == 0) {
				$(".myinfo_pw2msg").text("비밀번호를 한번 더 입력하세요");
				var msg = $(".myinfo_pw2msg");
				msg.animate({opacity : '1'}, "slow");
				msg.animate({opacity : '0'}, "slow");
				msg.animate({opacity : '1'}, "slow");
				return false;
			}
		}
		if ($(".myinfo_pw1msg").text() != "") {
			var msg = $(".myinfo_pw1msg");
			msg.animate({opacity : '1'}, "slow");
			msg.animate({opacity : '0'}, "slow");
			msg.animate({opacity : '1'}, "slow");
			return false;
		}
		if ($(".myinfo_pw2msg").text() != "") {
			var msg = $(".myinfo_pw2msg");
			msg.animate({opacity : '1'}, "slow");
			msg.animate({opacity : '0'}, "slow");
			msg.animate({opacity : '1'}, "slow");
			return false;
		}
		if ($("#myinfopassword1").text() != $("#myinfopassword2").text()) {
			$(".myinfo_pw2msg").text("비밀번호가 일치하지 않습니다");
			var msg = $(".myinfo_pw2msg");
			msg.animate({opacity : '1'}, "slow");
			msg.animate({opacity : '0'}, "slow");
			msg.animate({opacity : '1'}, "slow");
			return false;
		}
		if (nm == 1) {
			alert("한개");
			$(".myinfo_nmmsg").text("닉네임을 입력하세요");
			var msg = $(".myinfo_nmmsg");
			msg.animate({opacity : '1'}, "slow");
			msg.animate({opacity : '0'}, "slow");
			msg.animate({opacity : '1'}, "slow");
			return false;
		}
		if (ph == 0) {
			$(".phmsg").text("번호를 입력하세요");
			var msg = $(".phmsg");
			msg.animate({opacity : '1'}, "slow");
			msg.animate({opacity : '0'}, "slow");
			msg.animate({opacity : '1'}, "slow");
			return false;
		}
		if ($(".phmsg").text() != "") {
			var msg = $(".phmsg");
			msg.animate({opacity : '1'}, "slow");
			msg.animate({opacity : '0'}, "slow");
			msg.animate({opacity : '1'}, "slow");
			return false;
		}
	});
	// 닉네임 중복체크
	$('.myinfo_nmcheck').on('click', function() {
		var idval = $('#myinfonicknm').val();
		var leng = idval.length;

		if (leng == 0) {
			$('.myinfo_nmmsg').text("사용하실 닉네임을 입력해주세요");
			var msg = $(".myinfo_nmmsg")
			msg.animate({opacity : '1'}, "slow");
			msg.animate({opacity : '0'}, "slow");
			msg.animate({opacity : '1'}, "slow");
		}

		else if (leng != 0) {
			var em = $('#myinfonicknm').serialize();
			$.ajax({
				url : "nicknmchk",
				type : "post",
				data : em,
				dataType : "xml",
				error : function() {
					alert("Ajax error!!")
				},
				success : function(result) {
					success = $(result).find("success").text();
					success = parseInt(success);
					if (success > 0) {
						$('.myinfo_nmmsg').text("이미 사용중인 닉네임 입니다");
						var msg = $(".myinfo_nmmsg");
						msg.animate({opacity : '1'}, "slow");
						msg.animate({opacity : '0'}, "slow");
						msg.animate({opacity : '1'}, "slow");
						$('#nicknamelinput').val('');
					} else {
						$('.myinfo_nmmsg').text("사용가능한 닉네임 입니다");	
						var msg = $(".myinfo_nmmsg");
						msg.animate({opacity : '1'}, "slow");
						msg.animate({opacity : '0'}, "slow");
						msg.animate({opacity : '1'}, "slow");
						nmok = 1;
						nmchk = idval;
					}
				}//통신완료
			});//ajax끝
		}

	});
</script>