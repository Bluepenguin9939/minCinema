<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/jpg" href="/resources/img/minfavicon.jpg"/>
<meta charset="UTF-8">
<title>회원가입</title>
<%@ include file="/WEB-INF/views/include/bs.jsp" %>
<link href="/resources/css/member/register.css?after" rel="stylesheet">
<script>
$(function() {
	$("#btnDupId").click(function() {
		var that = $(this);
		var uid = $("#u-id");
		if (uid.val() == "" || uid.val().length < 4) {
			alert("아이디를 4글자 이상 입력해주세요.")
			uid.focus();
			return;
		}
		
		var url = "/member/isDupId";
		var sData = {
				"mid" : uid.val()
		}
		$.post(url, sData, function(rData) {
			if (rData == "true") {
				alert("이미 사용중인 아이디입니다.")
				uid.focus();
			} else if (rData == "false") {
				alert("사용 가능한 아이디입니다.")
				$("#u-pw").focus();
				that.prop("disabled", true);
				$("#u-id").prop("readonly", true);
				$("#btnRegister").prop("disabled", false);
			}
		});
	});
	
	$("#btnRegister").click(function() {
		var memail = $("#u-email").val();
		if (memail == "") {
			alert("이메일을 입력해주세요.");
			$("#u-email").focus();
			return;
		}
		var url = "/member/isDupEmail";
		var sData = {
				"memail" : memail
		}
		
		$.post(url, sData, function(rData) {
			if (rData) {
				alert("이미 사용중인 이메일입니다.");
				$("#u-email").focus();
			} else {
				$("#frmRegister").submit();
			}
		});
		
	});
	
	$("#frmRegister").submit(function() {
		var upw = $("#u-pw").val();
		var upw2 = $("#u-pw2").val();
		if (upw == "" || upw2 == "") {
			alert("비밀번호를 입력해주세요.");
			$("#u-pw").focus();
			return false;
		}
		if ($("#u-name").val() == "") {
			alert("이름을 입력해주세요.");
			$("#u-name").focus();
			return false;
		}
		if ($("#u-nick-name").val() == "") {
			alert("별명을 입력해주세요.");
			$("#u-nick-name").focus();
			return false;
		}
		if ($("#u-tel").val() == "") {
			alert("전화번호를 입력해주세요.");
			$("#u-tel").focus();
			return false;
		}
		if (upw != upw2) {
			alert("비밀번호가 일치하지 않습니다.");
			$("#u-pw").focus();
			return false;
		}
// 		return false;
	});
	
	var kakaoInfo = "${kakaoInfo}";
	if (kakaoInfo != "") {
		var memail = kakaoInfo.split("memail=")[1].split(",")[0];
		var mname = kakaoInfo.split("mname=")[1].split(",")[0];
		var mnick = kakaoInfo.split("mnick=")[1].split(",")[0];
		var mtel = kakaoInfo.split("mtel=")[1].split(",")[0];
		var mid = kakaoInfo.split("mid=")[1].split(",")[0];
		var mpw = kakaoInfo.split("mpw=")[1].split(",")[0];
		$("#u-id").val(mid);
		$("#u-pw").val(mpw);
		$("#u-pw2").val(mpw);
		$("#u-email").val(memail);
		$("#u-name").val(mname);
		$("#u-nick-name").val(mnick);
		$("#u-tel").val(mtel);
		$("#u-id").prop("readonly",true);
		$("#u-pw").prop("readonly",true);
		$("#u-pw2").prop("readonly",true);
		$("#u-email").prop("readonly",true);
		$("#u-name").prop("readonly",true);
		$("#u-tel").prop("readonly",true);
		$("#btnDupId").prop("disabled",true);
		$("#btnRegister").prop("disabled",false);
	}
});
</script>
</head>
<body>
	<div class="row d-flex justify-content-center align-content-center" style="height: 100vh; margin: 0px;">
		<div id="register-main-div">
			<div class="d-flex justify-content-center" id="logo-div">
				<a href="/" id="logo">
					<span>Min<i><sub>cinema</sub></i></span>
				</a>
			</div>
			<div class="d-flex justify-content-center info-div">
				<h2 id="info">회 원 가 입</h2>
			</div>
			<form class="user" action="/member/register" method="post" id="frmRegister">
				<div class="form-group d-flex" style="position: relative;">
					<input type="text" class="form-control form-control-user"
						id="u-id" name="mid" placeholder="아이디" required>
					<button type="button" class="btn btn-sm btn-dark" id="btnDupId">중복확인</button>
			    </div>
			    <div class="form-group">
			        <input type="password" class="form-control form-control-user"
			            id="u-pw" name="mpw" placeholder="패스워드" required>
			    </div>
			    <div class="form-group">
			        <input type="password" class="form-control form-control-user"
			            id="u-pw2" name="mpw2" placeholder="패스워드 확인" required>
			    </div>
			    <div class="form-group">
			        <input type="email" class="form-control form-control-user"
			            id="u-email" name="memail" placeholder="이메일" 
			            aria-describedby="emailHelp" required>
			    </div>
			    <div class="form-group">
			        <input type="text" class="form-control form-control-user"
			            id="u-name" name="mname" placeholder="이름">
			    </div>
			    <div class="form-group">
			        <input type="text" class="form-control form-control-user"
			            id="u-nick-name" name="mnick" placeholder="별명">
			    </div>
			    <div class="form-group">
			        <input type="tel" class="form-control form-control-user"
			            id="u-tel" name="mtel" placeholder="전화번호"
			            pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}">

			    </div>
			    <button type="button" id="btnRegister" class="btn btn-dark btn-block" disabled>
			        회원가입
			    </button>
			    <hr style="border-bottom: 2px solid #333333;">
			    <div class="d-flex justify-content-center">
				    <a href="/member/jo_login" id="goLogin">
				    	계정이 이미 있습니까?
				    </a>
			    </div>
			</form>
		</div>
	</div>
</body>
</html>