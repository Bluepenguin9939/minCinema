<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/views/include/top.jsp" %>
<link href="/resources/css/myPage/mySide.css?after" rel="stylesheet">

<script>
$(function() {
	$("#btnDetail").click(function() {
		var mov_code = $(this).attr("data-mov_code");
		$("#detail_mov_code").val(mov_code);
		$("#frmDetails").submit();
	});
	
	$("#btnReservation").click(function() {
		self.location = "/ticketing/booking";
	});
});
</script>

<%@ include file="/WEB-INF/views/include/jo_frmDetail.jsp" %>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8 d-flex justify-content-center" style="height: 800px;">
		<%@ include file="/WEB-INF/views/include/myPage-side.jsp" %>
			<div style="width: 100%;">
				<div style="width: 90%; height: 90%; margin-left: 5%;">
					<div style="border-bottom: 1px solid #999999; margin-top:20px; margin-bottom: 20px;">
						<h4>관심 목록</h4>
					</div>
					<h5>내 관심 목록</h5>
					<div style="border: 3px solid #999999; padding: 10px; padding-bottom: 0px;">
						<div>
						<c:forEach var="vo" items="${movieList}">
							<div style="display: inline-flex; width: 49%; margin-bottom: 10px;">
								<div style="margin-right: 5px;">
									<c:forEach var="list" items="${attachList}">
									<c:if test="${vo.mov_code eq list.mov_code}">
										<img src="/display?fileName=${list.upload_path}/${list.file_name}" alt="영화">
									</c:if>
									</c:forEach>
								</div>
								<div class="d-flex flex-column justify-content-between" style="width: 220px;">
									<div>
										<h4>${vo.mov_title}</h4>
										<h5>${vo.mov_director}</h5>
										<span>${vo.mov_genre}</span><br>
										<span>${vo.mov_runtime}분</span>
									</div>
									<div class="d-flex flex-column justify-content-end" style="object-fit: cover;">
										<button type="button" class="btn btn-secondary" 
											id="btnDetail" data-mov_code="${vo.mov_code}">
											상세보기
										</button>
										<br>
										<button type="button" class="btn btn-secondary"
											id="btnReservation" data-mov_code="${vo.mov_code}">
											예매하기
										</button>
									</div>
								</div>
							</div>
						</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-md-2">
		</div>
	</div>
</div>


<%@ include file="/WEB-INF/views/include/bottom.jsp" %>