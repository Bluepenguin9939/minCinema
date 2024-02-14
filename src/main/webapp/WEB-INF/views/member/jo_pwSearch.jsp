<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/jpg" href="/resources/img/minfavicon.jpg"/>
<meta charset="UTF-8">
<title>패스워드 찾기</title>
<%@ include file="/WEB-INF/views/include/bs.jsp" %>
<link href="/resources/css/member/pwSearch.css?after" rel="stylesheet">
<script>
$(function() {
	$("#btnSearchPw").click(function() {
		var uid = $("#uid").val();
		var uemail_head = $("#uemail-head").val();
		var uemail_domain = $("#uemail-domain").val();
		var uemail = uemail_head + "@" + uemail_domain;
		
		var url = "/member/equalEmail";
		var sData = {
				"memail" : uemail,
				"mid" : uid
		}
		
		$.post(url, sData, function(rData) {
			if (rData) {
				alert("입력하신 이메일로 메일이 발송되었습니다.");
				$("#uemail").val(uemail);
				$("#searchPw").submit();
			} else {
				alert("이메일이 일치하지 않습니다.\n이메일을 확인해 주세요.");
				$("#uemail").focus();
			}
		});
	});
	$("#domain").change(function() {
		var domain = $("#domain").val();
		if (domain != "") {
			$("#uemail-domain").prop("readonly", "true");
		} else {
			$("#uemail-domain").prop("readonly", false);
		}
		$("#uemail-domain").val(domain);
	});
});
</script>
</head>
<body>
	<div class="row d-flex justify-content-center align-content-center" style="height: 100vh; margin: 0px;">
		<div id="pwSearch-main-div">
			<div class="text-center" id="logo-div">
				<a href="/" id="logo">
					<span>Min<i><sub>cinema</sub></i></span>
				</a>
			</div>
			<div class="d-flex justify-content-center info-div">
				<span id="info">정보를 입력하시면 <br>새로운 패스워드를 보내드립니다.</span>
			</div>
			<form id="searchPw" class="user" action="/member/searchPw" method="post">
				<input type="hidden" id="uemail" name="uemail">
			    <div class="form-group">
			        <input type="text" class="form-control form-control-user"
			            id="uid" name="uid" placeholder="아이디를 입력하세요">
			    </div>
				<div class="form-group d-flex justify-content-between">
					<input type="text" class="form-control form-control-user"
						id="uemail-head" placeholder="이메일">
					<span style="align-self: center; color: #999999;">@</span>
					<input type="text" class="form-control form-control-user"
						id="uemail-domain">
					<select id="domain">
						<option value="">직접 입력</option>
						<option value="gmail.com">gmail.com</option>
						<option value="naver.com">naver.com</option>
						<option value="daum.net">daum.net</option>
						<option value="nate.com">nate.com</option>
					</select>
			    </div>
			    <button type="button" id="btnSearchPw" class="btn btn-dark btn-block">
			        패스워드 찾기
			    </button>
			    <hr style="border-bottom: 2px solid #333333;">
			    <div class="d-flex justify-content-between">
				    <a href="/member/jo_login" id="goLogin">
				    	로그인창으로
				    </a>
				    <a href="/member/jo_register" id="register">
				    	회원가입
				    </a>
			    </div>
			</form>
		</div>
	</div>
</body>
</html>