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
function moreButton(acount){
	var bsl = $(".wrap>tr").length;
	if(bsl > acount && bsl % 5 >= 0 && bsl % 5 < 5){
		$("#load-more").css("display", "block");
	}
}
$(function() {
	var begin = 0;
	var end = 5;
	var acount = 5;
	var bStep = $(".wrap>tr");
	var eStep = bStep.slice(begin,end);
	bStep.hide();
	eStep.show();
	
	var bsl = bStep.length;
	if(bsl > acount && bsl % 5 >= 0){
		$("#load-more").css("display", "block");
	}
	$("#load-more").click(function(){
		$(this).css("display", "none");
		var that = $(this);
		end += 5;
		acount += 5;
		moreButton(acount);
		bStep.slice(begin,end).show();
	});
});
</script>
</head>
<body>

<!-- 관리자용 포인트 관리 게시판 -->
<div id="pointDiv" >
<div class="point d-flex justify-content-center"> 
		<div class="admin-top" >
			<h2 class="admin-body" id="pointCm" >포인트 관리</h2>
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
    
			<table class="table pointTable">
				<thead>
				<!-- 관리자용과 게시판 공용 사용하되 이름(컬럼명은 변경해야함)  -->
					<tr class="pointTr">
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
			<!-- 하단 게시판 번호(Pagination) -->
			<div class="loadMore">
				<button id="load-more" class="btn btn-sm btn-outline-dark" style="display: none;">더보기</button>
			</div>
	</div>
	</div>
	</div>
</body>
