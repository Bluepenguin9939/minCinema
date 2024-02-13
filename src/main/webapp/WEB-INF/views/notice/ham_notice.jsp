<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="/WEB-INF/views/include/top.jsp"%>

<head>
<link rel="stylesheet" href="/resources/css/notice.css?after"
	type="text/css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<script type="text/javascript" src="/resources/js/notice.js?after"></script>
<link href="/resources/css/myPage/pointPagination.css" rel="stylesheet">

<!-- <meta name="viewport" content="width=device-width,initial-scale=1.0"> -->
</head>
<!-- list(게시판) 양식 -->
<body>
	<div class="notice d-flex justify-content-center">
		<div class="notice-top">
			<h2 class="notice-body" title="공지사항">
				<i class="fa fa-bullhorn"></i>공지사항
			</h2>
			<section>
				<ul class="nav transfrom-scale" title="공지사항그룹">
					<li class="nav-item"><a class="nav-link"
						href="/notice/ham_notice">공지사항</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/notice/ham_often">자주묻는질문</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/notice/ham_inquiry">1대1문의</a></li>
				</ul>
			</section>
			<div id="notice-list">
			</div>	
		</div>
	</div>
</body>
<%@ include file="/WEB-INF/views/include/bottom.jsp"%>