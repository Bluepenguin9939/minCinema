<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>

<link rel="icon" type="image/jpg" href="/resources/img/minfavicon.jpg"/>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Min Cinema</title>

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

<link href="/resources/css/include/top.css" rel="stylesheet">
<link href="/resources/css/include/bottom.css" rel="stylesheet">

<!-- 부트스트랩4 -->
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
	$(window).on("scroll", function() {
		var scroll = $(window).scrollTop();
		if (scroll > 0) {
			$(".scroll-to-top").fadeIn(1000);
		} else {
			$(".scroll-to-top").fadeOut(1000);
		}
	});
	
	$("#login").on("mouseenter", function() {
		$(this).find($(".fa-door-closed")).css("display", "none");
		$(this).find($(".fa-door-open")).css("display", "");
	});
	
	$("#login").on("mouseleave", function() {
		$(this).find($(".fa-door-open")).css("display", "none");
		$(this).find($(".fa-door-closed")).css("display", "");
	});
	
});
function callFaqBox() {
	if($(".faqBox").css('display')=='none') {
		$(".faqBox").show();
	} else {
		$(".faqBox").hide();
	}
}

function callFaq(items) {
	var item = $(items).attr("href");
	var questionBox = $(".questionBox");
	var faqItem = "";
	var faqAnswer = "";
	switch(item){
	case 'event':
		faqItem = "이벤트 문의";
		faqAnswer = "현재 진행중인 이벤트<br>2월 출석이벤트<br><a href='/main/event/jo_feb_attendance_check'>2월 출석이벤트</a>";
		break;
	case 'register':
		faqItem = "회원가입 문의";
		faqAnswer = "본인인증 또는 카카오로그인 그리고 필수항목 입력 후 가입완료.<br><a href='/member/jo_login'>로그인&회원가입</a>";
		break;
	case 'pay':
		faqItem = "결제 문의";
		faqAnswer = "결제는 카카오페이, 신용카드로 결제가 가능하고 포인트로 충전이됩니다. <br><a href='/myPage/jo_myPoint'>포인트 충전</a>";
		break;
	}
	var eventFaq = "<div class='speech-bubble'>" + faqItem + "</div>";
	var answerDiv = "<div class='speech-bubble-answer'>" + faqAnswer + "</div>";
	questionBox.append(eventFaq);
	questionBox.scrollTop(questionBox.prop('scrollHeight'));
	setTimeout(function(){
		questionBox.append(answerDiv);
		questionBox.scrollTop(questionBox.prop('scrollHeight'));
	}, 500);
}
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
				
				<nav class="navbar navbar-expand-sm navbar-dark d-flex justify-content-between"
					style="padding: 20px; border-bottom: 2px solid #00000021;">
					<!-- 로고 -->
					<div class="d-flex justify-content-center" style="width: 20%;">
						<a href="/main/jo_main" class="header__logo" id="logo">
							<span>Min<i><sub>cinema</sub></i></span>
						</a>
					</div>
					<!-- // 로고 -->
					
					<!-- 드롭다운 -->
					<div class="d-flex justify-content-between" style="width: 40%;">
						<div class="top-hover-dropdown">
				        	<a href="/main/jo_event" class="topbar-dropdown" style="vertical-align: middle;">
				        		<i class="fa fa-calendar-check"></i> 이벤트
				        	</a>
					  	</div>  
						<div class="dropdown top-hover-dropdown">
				        	<a class="dropdown topbar-dropdown" data-toggle="dropdown" href="#">
				        		<i class="fa fa-chalkboard"></i> 게시판
			        		</a>
				        	<div class="dropdown-menu">
						   		<a class="dropdown-item" href="/notice/ham_notice">공지사항</a>
							    <a class="dropdown-item" href="/notice/ham_often">자주 묻는 질문</a>
							    <a class="dropdown-item" href="/notice/ham_inquiry">1:1 문의</a>
						  	</div>
					  	</div>
						<div class="top-hover-dropdown">
				        	<a href="/main/jo_loadMap" class="topbar-dropdown">
				        		<i class="fa fa-map-marked-alt"></i> 오시는길
				        	</a>
					  	</div>  
				  	</div>
				  	<!-- // 드롭다운 -->
				  	
                    <!-- 로그인 -->
                    <div class="d-flex justify-content-center" style="width: 25%;">
	                   	<c:if test="${empty loginInfo}">
							<a href="/member/jo_login" id="login">
		                    	<span>로그인</span>
		                    	<i class="fa fa-door-closed"></i>
		                    	<i class="fa fa-door-open" style="display: none"></i>
		                    </a>
                    	</c:if>
                    	<c:if test="${not empty loginInfo}">
							<div class="dropdown">
								<a class="dropdown" href="#" id="myProfile" data-toggle="dropdown">
									<c:choose>
										<c:when test="${loginInfo.uuid != null}">
				                    		<img class="rounded-circle" src="/display?fileName=${loginInfo.upload_path}/${loginInfo.uuid}_${loginInfo.file_name}"
				                    			width="40" height="40">
										</c:when>
										<c:otherwise>
				                    		<img class="rounded-circle" src="/resources/img/undraw_profile_1.svg"
				                    			width="40" height="40">
										</c:otherwise>
									</c:choose>
	                    			<span id="myNickName">${loginInfo.mnick}</span>
								</a>
								<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
									 <a class="dropdown-item disabled" href="#">포인트 <fmt:formatNumber value="${loginInfo.mpoint}" pattern="#,###"/></a>
									 <c:choose>
										 <c:when test="${loginInfo.mid eq 'admin'}">
											 <a class="dropdown-item" href="/admin/ham_admins">관리자페이지</a>
										 </c:when>
										 <c:otherwise>
											 <a class="dropdown-item" href="/myPage/jo_myInfo">마이페이지</a>
										 </c:otherwise>
									 </c:choose>
									 <a class="dropdown-item" href="/myPage/jo_myInterest">관심목록</a>
									 <a class="dropdown-item" href="/member/logout">로그아웃</a>
								</div>
							</div>
                    	</c:if>
                    </div>
                    <!-- // 로그인 -->
				</nav>
				<!-- End of Topbar -->