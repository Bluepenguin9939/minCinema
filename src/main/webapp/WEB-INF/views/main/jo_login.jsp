<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<%@ include file="/WEB-INF/views/include/bs.jsp" %>
<link href="/resources/css/login.css" rel="stylesheet">
</head>
<body>
	<div class="row d-flex justify-content-center align-content-center" style="height: 100vh; margin: 0px;">
		<div id="login-main-div">
			<div class="text-center" id="logo-div">
				<a href="/" id="logo">
					<span>Min<i><sub>cinema</sub></i></span>
				</a>
			</div>
			<form class="user">
				<div class="form-group">
					<input type="text" class="form-control form-control-user"
						id="uid" name="uid" placeholder="아이디">
			    </div>
			    <div class="form-group">
			        <input type="password" class="form-control form-control-user"
			            id="upw" name="upw" placeholder="패스워드">
			    </div>
			    <div class="form-group">
			        <div class="custom-control custom-checkbox small">
			            <input type="checkbox" class="custom-control-input"  
			            	id="customCheck">
			            <label class="custom-control-label" for="customCheck" 
			            	style="color: #999999;">아이디 저장</label>
			        </div>
			    </div>
			    <a href="/" class="btn btn-dark btn-block">
			        로그인
			    </a>
			    <hr style="border-bottom: 2px solid #333333;">
			    <div class="d-flex justify-content-between">
				    <a href="/main/jo_pwSearch" id="pwSearch">
				    	패스워드 찾기
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