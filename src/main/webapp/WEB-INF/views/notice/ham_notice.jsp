<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="/WEB-INF/views/include/top.jsp"%>

<head>
<link rel="stylesheet" href="/resources/css/notice.css?after"
	type="text/css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<script type="text/javascript" src="/resources/js/notice.js"></script>
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
			<table class="table table-hover" style="text-align: center;">
				<thead>
					<!-- 관리자용과 게시판 공용 사용하되 이름(컬럼명은 변경해야함)  -->
					<tr>
						<th>#</th>
						<th>공지 제목</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="vo" items="${list}">
						<tr>
							<td>${vo.nno}</td>
							<td><a onclick="getContent(this)" class="viewContent"
								style="cursor: pointer;">${vo.ntitle}</a></td>
							<td><fmt:formatDate value="${vo.nregdate}"
									pattern="yyyy년MM월dd일"></fmt:formatDate></td>
							<td>${vo.ncount}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="page">
				<ul class="pagination pModal">
					<li><a href="${pageMaker.startPage}" class="first pages">처음
							페이지</a></li>
					<c:if test="${pageMaker.prev == true}">
						<li><a href="${pageMaker.startPage - 1}"
							class="arrow left pages">&laquo;</a></li>
					</c:if>
					<c:forEach begin="${pageMaker.startPage}"
						end="${pageMaker.endPage}" var="v">
						<li><a onclick="changePages(this)" href="${v}"
							class="${(pageMaker.heo_NoticeCriteria.pageNum == v)? 'active' : ''} num pages">${v}</a></li>
					</c:forEach>
					<c:if test="${pageMaker.next == true}">
						<li><a href="${pageMaker.endPage + 1}"
							class="arrow right pages">&raquo;</a></li>
					</c:if>
					<li><a href="${pageMaker.endPage}" class="last pages">끝
							페이지</a></li>
				</ul>
			</div>
		</div>
	</div>
</body>
<%@ include file="/WEB-INF/views/include/bottom.jsp"%>