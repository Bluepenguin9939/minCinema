<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<%@ include file="/WEB-INF/views/include/bs.jsp" %>
<link href="/resources/css/register.css" rel="stylesheet">
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
			<form class="user">
				<div class="form-group">
					<input type="text" class="form-control form-control-user"
						id="uid" name="uid" placeholder="아이디" required>
			    </div>
			    <div class="form-group">
			        <input type="password" class="form-control form-control-user"
			            id="upw" name="upw" placeholder="패스워드" required>
			    </div>
			    <div class="form-group">
			        <input type="password" class="form-control form-control-user"
			            id="upw2" name="upw2" placeholder="패스워드 확인" required>
			    </div>
			    <div class="form-group">
			        <input type="text" class="form-control form-control-user"
			            id="uname" name="uname" placeholder="이름">
			    </div>
			    <div class="form-group">
			        <input type="text" class="form-control form-control-user"
			            id="unick-name" name="unick-name" placeholder="별명">
			    </div>
			    <div class="form-group">
			        <input type="email" class="form-control form-control-user"
			            id="uemail" name="uemail"  aria-describedby="emailHelp"
			            placeholder="이메일">
			    </div>
			    <a href="/main/jo_login" class="btn btn-dark btn-block">
			        회원가입
			    </a>
			    <hr style="border-bottom: 2px solid #333333;">
			    <div class="d-flex justify-content-center">
				    <a href="/main/jo_login" id="goLogin">
				    	계정이 이미 있습니다.
				    </a>
			    </div>
			</form>
		</div>
	</div>
</body>
</html>