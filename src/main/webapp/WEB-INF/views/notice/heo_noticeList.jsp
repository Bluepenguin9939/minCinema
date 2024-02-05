<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
		<li><a onclick="changePages(this); return false;" href="${pageMaker.startPage}" class="first pages">처음
				페이지</a></li>
		<c:if test="${pageMaker.prev == true}">
			<li><a href="${pageMaker.startPage - 1}"
				class="arrow left pages">&laquo;</a></li>
		</c:if>
		<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
			var="v">
			<li><a onclick="changePages(this); return false;" href="${v}"
				class="${(pageMaker.heo_NoticeCriteria.pageNum == v)? 'active' : ''} num pages">${v}</a></li>
		</c:forEach>
		<c:if test="${pageMaker.next == true}">
			<li><a href="${pageMaker.endPage + 1}" class="arrow right pages">&raquo;</a></li>
		</c:if>
		<li><a onclick="changePages(this); return false;" href="${pageMaker.endPage}" class="last pages">끝 페이지</a></li>
	</ul>
</div>