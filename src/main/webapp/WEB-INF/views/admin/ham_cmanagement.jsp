<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="/WEB-INF/views/include/ad_sidebar.jsp" %>
<%@ include file="/WEB-INF/views/include/ad_topbar.jsp" %>

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
		<div class="admin-top" >
			<h2 class="admin-body" title="" >회원 관리</h2>
			<div class="search">
            <div class="search-field">
					<select name="target" title="검색선택">
						<option value="">전체</option>
						<option value="title">아이디</option>
						<option value="content">닉네임</option>
						<option value="member_display">이름</option>
						<option value="member_display">이메일</option>
						<option value="member_display">전화번호</option>
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
						<th>아이디</th> <!--  -->
						<th>닉네임</th>
						<th>이름</th>
						<th>이메일</th> <!--  -->
						<th>전화번호</th>
						<th>관리</th>
					</tr>
				</thead>
				<!-- 임시 -->
				<tbody>
				
					<tr>
						<td>1</td>
						<td>apple</td>
						<td>황금올리브</td>
						<td>감감감</td>
						<td>apple@naver.com</td>
						<td>010-1111-1111</td>
						<td>
							<i class="fa fa-user-alt-slash" title="벤"></i> <i class="fa fa-trash" title="del"></i> 
						</td>
					</tr>
					<tr>
						<td>1</td>
						<td>apple</td>
						<td>황금올리브</td>
						<td>감감감</td>
						<td>apple@naver.com</td>
						<td>010-1111-1111</td>
						<td>
							<i class="fa fa-user-alt-slash" title="벤"></i> <i class="fa fa-trash" title="del"></i> 
						</td>
					</tr>
					<tr>
						<td>1</td>
						<td>apple</td>
						<td>황금올리브</td>
						<td>감감감</td>
						<td>apple@naver.com</td>
						<td>010-1111-1111</td>
						<td>
							<i class="fa fa-user-alt-slash" title="벤"></i> <i class="fa fa-trash" title="del"></i> 
						</td>
					</tr>
					<tr>
						<td>1</td>
						<td>apple</td>
						<td>황금올리브</td>
						<td>감감감</td>
						<td>apple@naver.com</td>
						<td>010-1111-1111</td>
						<td>
							<i class="fa fa-user-alt-slash" title="벤"></i> <i class="fa fa-trash" title="del"></i> 
						</td>
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

</body>
