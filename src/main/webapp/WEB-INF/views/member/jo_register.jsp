<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<%@ include file="/WEB-INF/views/include/bs.jsp" %>
<link href="/resources/css/member/register.css?after" rel="stylesheet">
<script>
$(function() {
	
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
			<form class="user" action="/member/register" method="post">
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
			    <button type="submit" class="btn btn-dark btn-block">
			        회원가입
			    </button>
			    <hr style="border-bottom: 2px solid #333333;">
			    <div class="d-flex justify-content-center">
				    <a href="/member/jo_login" id="goLogin">
				    	계정이 이미 있습니다.
				    </a>
			    </div>
			</form>
		</div>
	</div>
</body>
</html>