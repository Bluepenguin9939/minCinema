<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="/WEB-INF/views/include/ad_sidebar.jsp" %>
<%@ include file="/WEB-INF/views/include/ad_topbar.jsp" %>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/resources/css/admin/addpoint.css?after" type="text/css">
    <title>Point</title>
<script>

</script>
</head>
<body>
<!-- 테스트 모달-생성 -->
<div class="d-flex justify-content-center">
		<a id="modal-474701" href="#modal-container-474701" role="button"
			class="btn modalPoint" data-toggle="modal">테스트 포인트 생성 </a>

		<div class="modal fade" id="modal-container-474701" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="myModalLabel">테스트 포인트 생성창 입니다</h5>
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body">
						<input type="text" class="form-control" placeholder="테스트 아이디">
					</div>
					<div class="modal-body">
						<input type="text" class="form-control" placeholder="테스트 닉네임">
					</div>
					<div class="modal-body">
						<input type="text" class="form-control" placeholder="테스트 포인트">
					</div>
					<div class="modal-body">
						<input type="text" class="form-control" placeholder="테스트 포인트종류">
					</div>
					<div class="modal-body">
						<input type="text" class="form-control" placeholder="테스트 포인트 적립일">
					</div>
					<div class="modal-footer">

						<button type="button" class="btn btn-primary">생성</button>
						<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
		<!-- 테스트 모달-수정 -->
	<div class="d-flex">
		<a id="modal-474701" href="#modal-container-474702" role="button"
			class="btn modalPoint" data-toggle="modal">테스트 포인트 수정 </a>

		<div class="modal fade" id="modal-container-474702" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="myModalLabel">테스트 포인트 수정창 입니다</h5>
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body">
						<input type="text" class="form-control" placeholder="테스트 아이디">
					</div>
					<div class="modal-body">
						<input type="text" class="form-control" placeholder="테스트 닉네임">
					</div>
					<div class="modal-body">
						<input type="text" class="form-control" placeholder="테스트 포인트">
					</div>
					<div class="modal-body">
						<input type="text" class="form-control" placeholder="테스트 포인트종류">
					</div>
					<div class="modal-body">
						<input type="text" class="form-control" placeholder="테스트 포인트 적립일">
					</div>
					<div class="modal-footer">

						<button type="button" class="btn btn-primary">생성</button>
						<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
		<!-- 테스트 모달-삭제 -->
	<div class="d-flex">
		<a id="modal-474701" href="#modal-container-474703" role="button"
			class="btn modalPoint" data-toggle="modal">테스트 포인트 삭제 </a>

		<div class="modal fade" id="modal-container-474703" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="myModalLabel">테스트 포인트 삭제창 입니다</h5>
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span>
						</button>
					</div>
						<div class="modal-body">
						<input type="text" class="form-control" placeholder="테스트 아이디">
					</div>
					<div class="modal-body">
						<input type="text" class="form-control" placeholder="테스트 닉네임">
					</div>
					<div class="modal-body">
						<input type="text" class="form-control" placeholder="테스트 포인트">
					</div>
					<div class="modal-body">
						<input type="text" class="form-control" placeholder="테스트 포인트종류">
					</div>
					<div class="modal-body">
						<input type="text" class="form-control" placeholder="테스트 포인트 적립일">
					</div>
					<div class="modal-footer">

						<button type="button" class="btn btn-primary">생성</button>
						<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div> <!-- 수정 끝  -->
	</div> <!-- 입력 끝 -->


<!-- 관리자용 포인트 관리 게시판 -->
<div class="notice d-flex justify-content-center" > 
		<div class="admin-top" >
			<h2 class="admin-body" title="" >포인트 관리</h2>
			<div class="search">
            <div class="search-field">
					<select name="target" title="검색선택">
						<option value="">전체</option>
						<option value="title">아이디</option>
						<option value="content">닉네임</option>
						<option value="">포인트</option>
						<option value="">포인트종류</option>
						<option value="">포인트 적립일</option>
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
						<th>포인트</th>
						<th>포인트종류</th> <!--  -->
						<th>포인트 적립일</th>
					</tr>
				</thead>
				<!-- 임시 -->
				<tbody>
				
					<tr>
						<td>1</td>
						<td>apple</td>
						<td>황금올리브</td>
						<td>100000000</td>
						<td>충전 포인트</td>
						<td>2024.01.24</td>
					</tr>
					<tr>
						<td>1</td>
						<td>apple</td>
						<td>황금올리브</td>
						<td>0.005</td>
						<td>리뷰 포인트</td>
						<td>2024.01.24</td>
					</tr>
					<tr>
						<td>1</td>
						<td>apple</td>
						<td>황금올리브</td>
						<td>0.005</td>
						<td>리뷰 포인트</td>
						<td>2024.01.24</td>
					</tr>
					<tr>
						<td>1</td>
						<td>apple</td>
						<td>황금올리브</td>
						<td>500000</td>
						<td>충전 포인트</td>
						<td>2024.01.24</td>
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
