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
$(function(){
	var begin = 0;
	var end = 5;
	var bStep = $(".wrap>tr");
	var eStep = bStep.slice(begin,end);
	bStep.hide();
	eStep.show();
	
	$("#load-more").click(function(){
		var that = $(this);
		console.log("that:",that);
		end +=5;
		bStep.slice(begin,end).show();
	});
  });	
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
					<form action="">
					<select name="type" title="검색선택">
						<option value="M" ${param.type == 'M' ? 'selected' : ''}>아이디</option>
						<option value="P" ${param.type == 'P' ? 'selected' : ''}>포인트</option>
					</select> 
					<input type="text" value="${param.keyword}" name="keyword" class="keyword" title="검색어 입력" placeholder="검색 ..." />
                <button value="검색" type="submit" class="btn btn-sm btn-outline-dark">검색</button>
            </form>
            </div>
        </div>
    
			<table class="table table-hover">
				<thead>
				<!-- 관리자용과 게시판 공용 사용하되 이름(컬럼명은 변경해야함)  -->
					<tr>
						<th>#</th>
						<th>아이디</th> <!--  -->
						<th>포인트</th>
						<th>포인트 충전 및 차감</th>
						<th>포인트 적립일</th>
					</tr>
				</thead>
				<!-- 임시 -->
				<tbody class="wrap">
					<c:forEach var="vo" items="${list}">
					<tr>
						<td>${vo.pid}</td>
						<td>${vo.mid}</td>
						<td>${vo.ppoint}</td>
						<td>
						<c:if test="${vo.pcode eq 'PC'}">포인트 충전</c:if>
						<c:if test="${vo.pcode eq 'PU'}">포인트 차감</c:if>
						</td>
						<td>${vo.pdate}</td>
					</tr>
					</c:forEach>					
				</tbody>
			</table>
			<div style="display:flex ; justify-content: center; text-align: center;">	
			<button id="load-more">+더보기</button>
			</div>			
			<!-- 하단 게시판 번호(Pagination) -->
<!-- 	<div class="pageBottom" style="margin-bottom: 100px"> -->
<!-- 		<div class="col-md-12"> -->
<!-- 			<nav> -->
			
<!-- 				<ul class="pagination d-flex align-items-center justify-content-center"> -->
<!-- 						<select name="target" title="검색선택"> -->
<!-- 						<option value="1">10</option> -->
<!-- 						<option value="2">20</option> -->
<!-- 						<option value="3">30</option> -->
<!-- 						<option value="4">40</option> -->
<!-- 						<option value="5">50</option> -->
<!-- 					</select>  -->
<!-- 					<li class="page-item"> -->
<!-- 						<a class="page-link" href="#">&laquo;</a> -->
<!-- 					</li> -->
<!-- 					<li class="page-item"> -->
<!-- 						<a class="page-link" href="#">1</a> -->
<!-- 					</li> -->
<!-- 					<li class="page-item"> -->
<!-- 						<a class="page-link" href="#">2</a> -->
<!-- 					</li> -->
<!-- 					<li class="page-item"> -->
<!-- 						<a class="page-link" href="#">3</a> -->
<!-- 					</li> -->
<!-- 					<li class="page-item"> -->
<!-- 						<a class="page-link" href="#">4</a> -->
<!-- 					</li> -->
<!-- 					<li class="page-item"> -->
<!-- 						<a class="page-link" href="#">5</a> -->
<!-- 					</li> -->
<!-- 					<li class="page-item"> -->
<!-- 						<a class="page-link" href="#">...</a> -->
<!-- 					</li> -->
<!-- 					<li class="page-item"> -->
<!-- 						<a class="page-link" href="#">10</a> -->
<!-- 					</li> -->
<!-- 					<li class="page-item"> -->
<!-- 						<a class="page-link" href="#">&raquo;</a> -->
<!-- 					</li> -->
<!-- 					<li class="page">현재 1 page 10 page entries </li> -->
<!-- 				</ul> -->
<!-- 			</nav> -->
<!-- 		</div> -->
<!-- 	</div> -->
	</div>
	</div>
</body>
