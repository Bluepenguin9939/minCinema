<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="/WEB-INF/views/include/bs.jsp" %>
<%@ include file="/WEB-INF/views/include/top.jsp" %>

<head>
<link rel="stylesheet" href="/resources/css/notice.css?after" type="text/css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">
<!-- <meta name="viewport" content="width=device-width,initial-scale=1.0"> -->
<style>

</style>

</head>
<!-- list(게시판) 양식 -->
<body>
	<div class="notice d-flex justify-content-center" > 
		<div class="notice-top" >
		
			<h2 class="notice-body" title="공지사항"> <i class="fa fa-bullhorn"></i>공지사항</h2>
			<section>
		   	 <ul class="nav transfrom-scale" title="공지사항그룹">
					  <li class="nav-item">
					    <a class="nav-link" href="/notice/ham_notice">공지사항</a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link" href="/notice/ham_often">자주묻는질문</a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link" href="/notice/ham_inquiry">1대1문의</a>
					  </li> 
			  </ul>
			</section>
			<div class="search">
            <div class="search-field">
					<select name="target" title="검색선택">
						<option value="">전체</option>
						<option value="title">제목</option>
						<option value="">닉네임</option>
						<option value="content">내용</option>
						<option value="member_display">작성자</option>
					</select> 
					<input type="text" value="" name="s" class="s" title="검색어 입력" id="search_id" placeholder="검색 ..." />
                <input value="검색" type="submit" class="searchsubmit" />
            </div>
        </div>
    
			<table class="table table-hover">
				<thead>
				<!-- 관리자용과 게시판 공용 사용하되 이름(컬럼명은 변경해야함)  -->
					<tr>
						<th>#</th>
						<th>관리자</th> <!--  -->
						<th>제목</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
				</thead>
				<!-- 임시 -->
				<tbody>
				
					<tr>
						<td>1</td>
						<td>관리자</td>
						<td><a href="#"> 리뷰만 작성했는데 포인트가 가득...</a></td>
						<td>2024.01.24</td>
						<td>5</td>
					</tr>
					<tr>
						<td>1</td>
						<td>관리자</td>
						<td><a href="#"> 포인트를 충전하면 무려 포인트를 드립니다...</a></td>
						<td>2024.01.24</td>
						<td>5</td>
					</tr>
					<tr>
						<td>1</td>
						<td>관리자</td>
						<td><a href="#"> 포인트를 충전하면 무려 포인트를 드립니다...</a></td>
						<td>2024.01.24</td>
						<td>5</td>
					</tr>
					<tr>
						<td>1</td>
						<td>관리자</td>
						<td><a href="#"> 포인트를 충전하면 무려 포인트를 드립니다...</a></td>
						<td>2024.01.24</td>
						<td>5</td>
					</tr>
					
				</tbody>
			</table>	
		
			<!-- 하단 게시판 번호(Pagination) -->
	<div class="pageBottom" style="margin-bottom: 100px">
		<div class="col-md-12">
			<nav>
			
				<ul class="pagination d-flex align-items-center justify-content-center">
						<select name="target" title="검색선택">
						<option value="1">10</option>
						<option value="2">20</option>
						<option value="3">30</option>
						<option value="4">40</option>
						<option value="5">50</option>
					</select> 
					<li class="page-item">
						<a class="page-link" href="#">&laquo;</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="#">1</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="#">2</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="#">3</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="#">4</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="#">5</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="#">...</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="#">10</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="#">&raquo;</a>
					</li>
<!-- 					<li class="page">현재 1 page 10 page entries </li> -->
				</ul>
			</nav>
		</div>
	</div>
	</div>
	</div>

<%@ include file="/WEB-INF/views/include/bottom.jsp" %>
</body>
