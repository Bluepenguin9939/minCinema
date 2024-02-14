<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/jpg" href="/resources/img/minfavicon.jpg"/>
<script src="/resources/js/certification.js?after"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script src="/resources/js/loginCheck.js?after"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="/resources/js/kakaoLogin.js"></script>
<meta charset="UTF-8">
<title>로그인</title>
<%@ include file="/WEB-INF/views/include/bs.jsp" %>
<link href="/resources/css/member/login.css" rel="stylesheet">

</head>
<body>
	<div class="row d-flex justify-content-center align-content-center" style="height: 100vh; margin: 0px;">
		<div id="login-main-div">
			<div class="text-center" id="logo-div">
				<a href="/" id="logo">
					<span>Min<i><sub>cinema</sub></i></span>
				</a>
			</div>
			<form action="/member/checkInfo" method="post" id="checkInfo">
				<input type="hidden" name="memail">
				<input type="hidden" name="mname">
				<input type="hidden" name="mtel">
				<input type="hidden" name="mnick">
			</form>
			<form class="user" action="/member/login" method="post" id="loginCheck">
				<div class="form-group">
					<input type="text" class="form-control form-control-user"
						id="uid" name="mid" placeholder="아이디" onkeyup="loginEnter(event);">
			    </div>
			    <div class="form-group">
			        <input type="password" class="form-control form-control-user"
			            id="upw" name="mpw" onkeyup="loginEnter(event);" placeholder="패스워드">
			    </div>
			    <div class="form-group">
			        <div class="custom-control custom-checkbox small">
			            <input type="checkbox" class="custom-control-input"  
			            	id="customCheck" name="useCookie">
			            <label class="custom-control-label" for="customCheck" 
			            	style="color: #999999;">아이디 저장</label>
			        </div>
			    </div>
			    <button type="button" id="btnLogin" onclick="loginCheck();" class="btn btn-dark btn-block" style="width: 320px; height: 48px;">
			        로그인
			    </button>
			    <br>
			    <img onclick="kakaoLogin();" src="/resources/img/kakao_login_medium_wide.png" style="width: 320px; height: 48px; cursor: pointer;">
			    <hr style="border-bottom: 2px solid #333333;">
			    <div class="d-flex justify-content-between">
				    <a href="/member/jo_pwSearch" id="pwSearch">
				    	패스워드 찾기
				    </a>
				    <a href="" onclick="checkMyInfo(); return false;" id="register">
				    	회원가입
				    </a>
			    </div>
			</form>
		</div>
	</div>
</body>
<script>
$(function(){
	var registerResult = "${registerResult}";
	console.log(registerResult);
	if (registerResult) {
		alert("회원가입 성공!");
	}
	
	var cookie = document.cookie;
	var cookies = cookie.split(";");
	for (var v = 0; v < cookies.length; v++) {
		var aCookie = cookies[v].split("=");
		if (aCookie[0].trim() == "savedId") {
			var savedId = aCookie[1].trim();
			$("#uid").val(savedId);
			if (savedId == ""){
				$("#customCheck").prop("checked", false);
			} else {
				$("#customCheck").prop("checked", true);				
				$("#upw").focus();
			}
			break;
		}
	}
});
</script>
</html>