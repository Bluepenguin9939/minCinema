<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Board Test</title>

<!-- Custom fonts for this template-->
<link href="/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="/resources/css/sb-admin-2.min.css" rel="stylesheet">

<!-- 글리피콘 -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	crossorigin="anonymous">
	
<!-- 구글 글리피콘 -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
	
<link href="/resources/css/top.css?after" rel="stylesheet">
<link href="/resources/css/bottom.css?after" rel="stylesheet">

<%@ include file="/WEB-INF/views/include/bs.jsp" %>
<!-- Bootstrap core JavaScript-->
<!-- <script src="/resources/vendor/jquery/jquery.min.js"></script> -->
<!-- <script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script> -->

<!-- <!-- Core plugin JavaScript-->
<!-- <script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script> -->

<!-- <!-- Custom scripts for all pages-->
<!-- <script src="/resources/js/sb-admin-2.min.js"></script> -->

<script>
$(function() {

});
</script>
</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">
				
				<!-- Topbar -->
				<nav class="navbar navbar-expand-sm bg-dark navbar-dark"
					style="padding: 20px;">
					<div class="d-flex justify-content-center" style="width: 25%;">
						<a href="/main/jo_main" class="header__logo" id="logo">
							<span>Min<i><sub>cinema</sub></i></span>
						</a>
					</div>
					<div class="d-flex justify-content-around" style="width: 40%;">
						<div class="dropdown top-hover-dropdown">
				        	<a class="dropdown topbar-dropdown" data-toggle="dropdown">영화목록</a>
				        	<div class="dropdown-menu">
						   		<a class="dropdown-item" href="#">전체보기</a>
							    <a class="dropdown-item" href="#">로맨스</a>
							    <a class="dropdown-item" href="#">공포</a>
							    <a class="dropdown-item" href="#">액션</a>
							    <a class="dropdown-item" href="#">코미디</a>
						  	</div>
					  	</div>  
						<div class="dropdown top-hover-dropdown">
				        	<a class="dropdown topbar-dropdown" data-toggle="dropdown">게시판</a>
				        	<div class="dropdown-menu">
						   		<a class="dropdown-item" href="#">자유 게시판</a>
							    <a class="dropdown-item" href="#">리뷰 게시판</a>
							    <a class="dropdown-item" href="#">게시판</a>
						  	</div>
					  	</div>
						<div class="top-hover-dropdown">
				        	<a href="/main/jo_loadMap" class="topbar-dropdown">오시는길</a>
					  	</div>  
				  	</div>
				  	<div class="d-flex justify-content-center" style="width: 20%;">
					  	<form class="d-none d-sm-inline-block form-inline navbar-search" style="margin: 0px;">
	                        <div class="input-group">
	                            <input type="text" class="form-control bg-light border-0 small" 
	                            	placeholder="검색어를 입력해주세요" name="movie-search"
	                                aria-label="Search" aria-describedby="basic-addon2">
	                            <div class="input-group-append">
	                                <button class="btn btn-secondary" type="button">
	                                    <i class="fas fa-search fa-sm"></i>
	                                </button>
	                            </div>
	                        </div>
	                    </form>
                    </div>
                    <div class="d-flex justify-content-center" style="width: 15%;">
	                    <a href="/main/jo_login" id="login">
	                    	<span>로그인</span>
	                    	<i class="fa fa-door-closed"></i>
	                    	<i class="fa fa-door-open" style="display: none"></i>
	                    </a>
                    </div>
				</nav>
				<!-- End of Topbar -->