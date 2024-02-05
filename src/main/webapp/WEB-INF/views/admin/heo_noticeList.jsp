<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<table class="table">
	<thead class="tblHead">
		<tr>
			<th>공지 번호</th>
			<th>공지 제목</th>
			<th>작성 일자</th>
			<th>조회 수</th>
		</tr>
	</thead>
	<tbody class="tblBody">
		<c:forEach items="${list}" var="vo">
			<tr>
				<td>${vo.nno}</td>
				<td><a href="${vo.nno}" class="titleNum"
					data-content="${vo.ncontent}">${vo.ntitle}</a></td>
				<td><fmt:formatDate value="${vo.nregdate}"
						pattern="yyyy년MM월dd일" /></td>
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