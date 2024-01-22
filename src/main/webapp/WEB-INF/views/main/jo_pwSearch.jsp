<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>패스워드 찾기</title>
<%@ include file="/WEB-INF/views/include/bs.jsp" %>
<link href="/resources/css/pwSearch.css" rel="stylesheet">
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
			<form class="user">
			    <div class="form-group">
			        <input type="text" class="form-control form-control-user"
			            id="uid" name="uid" placeholder="아이디를 입력하세요">
			    </div>
				<div class="form-group">
					<input type="email" class="form-control form-control-user"
						id="uemail" name="umail" aria-describedby="emailHelp"
						placeholder="이메일을 입력하세요">
			    </div>
			    <a href="/main/jo_login" class="btn btn-dark btn-block">
			        패스워드 찾기
			    </a>
			    <hr style="border-bottom: 2px solid #333333;">
			    <div class="d-flex justify-content-between">
				    <a href="/main/jo_login" id="goLogin">
				    	로그인창으로
				    </a>
				    <a href="/main/jo_register" id="register">
				    	회원가입
				    </a>
			    </div>
			</form>
		</div>
	</div>
</body>
</html>