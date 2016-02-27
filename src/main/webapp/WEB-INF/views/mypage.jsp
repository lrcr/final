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
			<label class="col-sm-2 control-label" for="myinfopw1">비밀번호</label>
			<div class="col-sm-9">
				<input type="password" class="form-control" id="myinfopw1">
				<label class="control-label myinfo_pw1msg"></label>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label" for="myinfopw2">비밀번호 확인</label>
			<div class="col-sm-9">
				<input type="password" class="form-control" id="myinfopw2" name="pw" value="${myinfo.pw}">
				<label class="control-label myinfo_pw2msg"></label>
			</div>
		</div>
	</div>
	<div class="form-group">
		<label class="col-sm-2 control-label" for="myinfonicknm">닉네임</label>
		<div class="col-sm-9">
			<input type="text" class="form-control" id="myinfonicknm" name="nicknm" value="${myinfo.nicknm}" >
			<label class="control-label myinfo_nmmsg"></label>
		</div>
	</div>
	<div class="form-group">
		<label class="col-sm-2 control-label" for="myinfoph">전화번호</label>
		<div class="col-sm-9">
			<input type="text" class="form-control" id="myinfoph" name="phone" value="${myinfo.phone}">
			<label class="control-label myinfo_phmsg"></label>
		</div>
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
		$("#myinfopw1").val("").focus();
		$("#myinfopw2").val("");
		$(this).hide()
	});

	$('#myinfonicknm').on('focusout', function() {
		var nmval = $(this).val();
		var leng = nmval.length;
		if (leng == 0) {
			$('.myinfo_nmmsg').text("변경할 닉네임을 입력하세요");
		} else if (leng != 0) {
			$('myinfo_nmmsg').text("");
		}
	});

	$('#myinfopw1').on('focusout', function() {
		var pwval = $('#myinfopw1').val();
		var leng = pwval.length;

		var sutja, munja;
		sutja = false;
		munja = false;

		for (var i = 0; i < pwval.length; i++) {
			var idx = pwval.charAt(i).charCodeAt();
			if (idx > 47 && idx < 58) {
				sutja = true;
			} else if (idx > 64 && idx < 123) {
				munja = true;
			}
		}

		if (!(munja && sutja)) {
			$(".myinfo_pw1msg").text("영문과 숫자를 조합 해야 합니다.");
			$("#myinfopw1").val("").focus();
		}

		//비밀번호 자리 수
		else if (leng<4||leng>12) {
			$(".myinfo_pw1msg").text("4자리 이상 12자리 이하로 입력 하세요");
			$("#myinfopw1").val("").focus();
			return false;
		} else {
			$(".myinfo_pw1msg").text("");
		}
	});

	$('#myinfopw2').on('focusout', function() {
		var pw1val = $('#myinfopw1').val();
		var pw2val = $('#myinfopw2').val();

		if (pw2val == "") {
			$(".myinfo_pw2msg").text("변경할 비밀번호를 입력하세요");
			$("#myinfopw1").val("").focus();
		} else if (pw1val != pw2val) {
			$(".myinfo_pw2msg").text("비밀번호가 일치하지 않습니다");
			$("#myinfopw2").val("").focus();
		} else {
			$(".myinfo_pw2msg").text("");
		}
	});

	$('#myinfoph').on('focusout', function() {
		var phnmval = $(this).val();
		var leng = phnmval.length;

		if (leng == 0) {
			$(".myinfo_phmsg").text("변경할 번호를 입력하세요");
			$("#myinfoph").focus();
		} else {
			var chksum = 0;
			for (var i = 0; i < leng; i++) {
				var idx = phnmval.charAt(i).charCodeAt();
				if (!(idx > 47 && idx < 58)) {
					chksum = chksum + 1;
				}
			}

			if (chksum == 0) {
				$(".myinfo_phmsg").text("");
			} else {
				$(".myinfo_phmsg").text("숫자 이외에는 입력이 불가합니다");
				$("#myinfoph").val("").focus();
			}
		}
	});

	//submit 클릭시
	$(".updateInfo").on("click", function() {
		var nm = $("#myinfonicknm").val().length;
		var pw1 = $("#myinfopw1").val().length;
		var pw2 = $("#myinfopw2").val().length;
		var ph = $("#myinfoph").val().length;
		console.log("nmok:" + nmok);
		console.log("nmchk:" + nmchk);
		if (!($("#myInfo .myinfo_pw").hasClass("hid"))) {
			if (pw1 == 0) {
				$(".myinfo_pw1msg").text("변경할 비밀번호를 입력하세요");
				$("#myinfopw1").val("").focus();
				var msg = $(".myinfo_pw1msg");
				msg.animate({ opacity : '1' }, "slow");
				msg.animate({ opacity : '0' }, "slow");
				msg.animate({ opacity : '1' }, "slow");
				return false;
			} else if (pw2 == 0) {
				$(".myinfo_pw2msg").text("비밀번호를 한번 더 입력하세요");
				$("#myinfopw2").val("").focus();
				var msg = $(".myinfo_pw2msg");
				msg.animate({ opacity : '1' }, "slow");
				msg.animate({ opacity : '0' }, "slow");
				msg.animate({ opacity : '1' }, "slow");
				return false;
			}else if ($("#myinfopw1").val() != $("#myinfopw2").val()) {
				$(".myinfo_pw2msg").text("비밀번호가 일치하지 않습니다");
				$("#myinfopw2").val("").focus();
				var msg = $(".myinfo_pw2msg");
				msg.animate({ opacity : '1' }, "slow");
				msg.animate({ opacity : '0' }, "slow");
				msg.animate({ opacity : '1' }, "slow");
				return false;
			}
		}
		if ($(".myinfo_pw1msg").text() != "") {
			var msg = $(".myinfo_pw1msg");
			msg.animate({ opacity : '1' }, "slow");
			msg.animate({ opacity : '0' }, "slow");
			msg.animate({ opacity : '1' }, "slow");
			return false;
		}
		if ($(".myinfo_pw2msg").text() != "") {
			var msg = $(".myinfo_pw2msg");
			msg.animate({ opacity : '1' }, "slow");
			msg.animate({ opacity : '0' }, "slow");
			msg.animate({ opacity : '1' }, "slow");
			return false;
		}
		if (nm == 0) {
			$(".myinfo_nmmsg").text("변경할 닉네임을 입력하세요");
			$("#myinfonicknm").val("").focus();
			var msg = $(".myinfo_nmmsg");
			msg.animate({ opacity : '1' }, "slow");
			msg.animate({ opacity : '0' }, "slow");
			msg.animate({ opacity : '1' }, "slow");
			return false;
		}else if (nm > 7){
			$(".myinfo_nmmsg").text("6자 이하로 입력해주세요");
			$("#myinfonicknm").val("").focus();
			var msg = $(".myinfo_nmmsg");
			msg.animate({ opacity : '1' }, "slow");
			msg.animate({ opacity : '0' }, "slow");
			msg.animate({ opacity : '1' }, "slow");
			return false;
		}
		if (ph == 0) {
			$(".myinfo_phmsg").text("변경할 번호를 입력하세요");
			$("#myinfoph").val("").focus();
			var msg = $(".myinfo_phmsg");
			msg.animate({ opacity : '1' }, "slow");
			msg.animate({ opacity : '0' }, "slow");
			msg.animate({ opacity : '1' }, "slow");
			return false;
		}
		if ($(".myinfo_phmsg").text() != "") {
			var msg = $(".myinfo_phmsg");
			msg.animate({ opacity : '1' }, "slow");
			msg.animate({ opacity : '0' }, "slow");
			msg.animate({ opacity : '1' }, "slow");
			return false;
		}
		alert("수정되었습니다");
	});
	// 닉네임 중복체크
	var nicknm = "";
	$("#myinfonicknm").on("focus",function(){
		var nicknim = $.trim($(".navnicknm").text());
			if(nicknim ==="") location.reload(true);
			for (var i=0; i<nicknim.length-1; i++){
				nicknm += nicknim.charAt(i);
			}
	}).on("blur",function(){nicknm="";});
	$("#myinfonicknm").on("keyup", function() {
		console.log(nicknm);
		var idval = $(this).val();
		if(nicknm==idval){
			$('.myinfo_nmmsg').text("지금 사용하고 계신 닉네임입니다");
		}else if (idval.length > 7){
				$(".myinfo_nmmsg").text("6자 이하로 입력해주세요");
// 				$("#myinfonicknm").val("").focus();
		}else{
		var em = $('#myinfonicknm').serialize();
		var idx;
		for (var i = 0; i < idval.length; i++) {
			idx = $(this).val().charCodeAt(i);
			if (idx == 32) {
				$(this).val("");
			}
			$.ajax({ url : "nicknmchk", type : "post", data : em, dataType : "xml", error : function() {
				alert("Ajax error!!")
			}, success : function(result) {
				success = $(result).find("success").text();
				success = parseInt(success);
				if(idx==32) {
					$('.myinfo_nmmsg').text("공백은 사용할수 없습니다");
				}else if (success > 0) {
					$('.myinfo_nmmsg').text("이미 사용중인 닉네임 입니다");
					var msg = $(".myinfo_nmmsg");
					$("#myinfonicknm").val("");
				} else {
					$('.myinfo_nmmsg').text("사용가능한 닉네임 입니다");
					var msg = $(".myinfo_nmmsg");
				}
			}//통신완료
			});//ajax끝
		}
		}
	});
</script>