<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="/WEB-INF/views/include/top.jsp"%>
<script>
$(function() {
	$("#btnWriteReview").click(function() {
		var mid = "${loginInfo.mid}";
		var mnick = "${loginInfo.mnick}";
		if (mid == "") {
			alert("로그인 후 이용 가능합니다.");
			self.location = "/member/jo_login";
		}
		$("#btnInput").attr("data-mid", mid);
		$("#btnInput").attr("data-mnick", mnick);
		$("#review-modal").modal("show");
	});
	
	$("#btnInput").click(function() {
		var mid = $(this).attr("data-mid");
		var mnick = $(this).attr("data-mnick");
		var mov_code = "${param.detail_mov_code}";
		var review_content = $("#review-content").val();
		var url = "/main/writeReview"
		var sData = {
				"mid" : mid,
				"mnick" : mnick,
				"mov_code" : mov_code,
				"r_content" : review_content
		}
		
		$.post(url, sData, function(rData) {
			console.log(rData)
			if (rData) {
				alert("등록이 완료되었습니다.");
			} else {
				alert("등록을 실패하셨습니다.");
			}
			self.location = window.location.href;
		});
	});
});
</script>
<!-- 결과창모달 -->
<%@ include file="/WEB-INF/views/include/heo_payLoginModal.jsp"%>
<link href="/resources/css/details/heo_details.css?after"
	rel="stylesheet">
<div class="container-fluid">
	<div class="row">
		<div class="col-md-3"></div>
		<div class="col-md-6">
			<br> <br>
			<div class="d-flex justify-content-center">
			<c:forEach var="list" items="${movieImage}">
				<c:if test="${fn:contains(list.upload_path, 'poster')}">
					<img class="movie-details" style="width: 300px; height: 400px;" src="/display?fileName=${list.upload_path}/${list.file_name}">
				</c:if>
			</c:forEach>
				<div class="details-logo">
					<div class="mov-details-name">${movieDetail.mov_title}</div>
					<ul class="mov-details-ul">
						<li class="mov-details-info-openDate">개봉일: ${fn:substring(movieDetail.mov_releaseDate, 0, 4)}년 ${fn:substring(movieDetail.mov_releaseDate, 4, 6)}월 ${fn:substring(movieDetail.mov_releaseDate, 6, 8)}일</li>
						<li class="mov-details-info-time"><i class="fa fa-clock">${movieDetail.mov_runtime}분</i></li>
						<li class="mov-details-info-age">${movieDetail.mov_rating}</li>
					</ul>
					<div class="mov-details-info-div">
						<textarea class="form-control mov-details-info"
							style="font-size: 20px; width: 350px; height: 200px; background-color: #fff;"
							readonly>${movieDetail.mov_plot}</textarea>
					</div>
					<br>
					<div class="mov-details-btn-div">
						<button class="btn btn-danger mov-details-btn-payment"
							type="button">예매하기</button>
					</div>
				</div>
			</div>
		</div>
		<div class="col-md-3"></div>
		<div class="col-md-2"></div>
		<div class="col-md-8 d-flex">
			<div class="container">
				<ul class="nav nav-tabs justify-content-center mov-details-info-ul">
					<li class="nav-item mov-details-info-li"><a href="#tab1"
						data-toggle="tab" class="nav-link active mov-details-info-a">상세
							정보</a></li>
					<li class="nav-item mov-details-reviews"><a href="#tab2"
						data-toggle="tab" class="nav-link mov-details-reviews-a">리뷰</a></li>
				</ul>
				<div class="tab-content py-3" style="background-color: #fff;">
					<div class="tab-pane active" id="tab1">
						<h3>영화정보</h3>
						<ul>
							<li>장르:<a style="padding-left: 10px;">${movieDetail.mov_genre}</a></li>
							<li>감독:<a style="padding-left: 10px; text-decoration: underline;">${movieDetail.mov_director}</a></li>
							<li>출연:<a style="padding-left: 10px; text-decoration: underline;">${movieDetail.mov_actor}</a></li>
						</ul>
						<br>
						<h3>트레일러</h3>
						<br>
						<div class="justify-content-center d-flex">
							<iframe src="${movieDetail.mov_trailer}"
								frameborder='no' scrolling='no' marginwidth='0' 
								marginheight='0' WIDTH='700' HEIGHT='400' allow='autoplay' 
								allowfullscreen>
							</iframe>
						</div>

						<h3 class="mov-details-stillcut">스틸컷</h3>
						<br>
						<div id="slide-movie" class="carousel slide" data-ride="carousel">
							<!-- Indicators -->
							<ul class="carousel-indicators">
								<li data-target="#slide-movie" data-slide-to="0" class="active"></li>
								<c:forEach var="i" begin="2" end="${fn:length(movieImage) - 1}">
									<li data-target="#slide-movie" data-slide-to="${i}"></li>
								</c:forEach>
							</ul>

							<!-- The slideshow -->
							<div class="carousel-inner">
								<div class="carousel-item active">
									<c:forEach var="list" items="${movieImage}" end="1">
									<div class="d-flex align-items-center justify-content-center">
										<c:if test="${fn:contains(list.upload_path, 'still_cut')}">
											<a href="#"> <img
												src="/display?fileName=${list.upload_path}/${list.file_name}"
												alt="영화1" height="500" class="slide-movie-image" id="test">
											</a>
										</c:if>
									</div>
									</c:forEach>
								</div>
								<c:forEach var="list" items="${movieImage}" begin="2">
									<div class="carousel-item">
										<div class="d-flex align-items-center justify-content-center">
										<c:if test="${fn:contains(list.upload_path, 'still_cut')}">
											<a href="#"> <img
												src="/display?fileName=${list.upload_path}/${list.file_name}"
												alt="영화1" height="500" class="slide-movie-image" id="test">
											</a>
										</c:if>
										</div>
									</div>
								</c:forEach>
							</div>
							<!-- Left and right controls -->
							<a class="carousel-control-prev" href="#slide-movie"
								data-slide="prev"> <img width="50" height="50" src="https://img.icons8.com/carbon-copy/100/double-left.png" alt="double-left"/>
							</a> <a class="carousel-control-next" href="#slide-movie"
								data-slide="next"> <img width="50" height="50" src="https://img.icons8.com/carbon-copy/100/double-right.png" alt="double-right"/>
							</a>
						</div>

					</div>
					<div class="tab-pane" id="tab2">
						<div class="container mov-details-reviews-div">
							<br>
							<div style="position: relative;">
								<h2>관람평</h2>
								<button type="button" class="btn btn-sm btn-primary"
									id="btnWriteReview"
									style="position: absolute; right: 5px; top: 5px;">
									리뷰 작성
								</button>
							</div>
							<table class="table">
								<thead class="thead-dark">
									<tr>
										<th>닉네임</th>
										<th>리뷰 내용</th>
										<th>작성날짜</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach var="vo" items="${reviewList}">
									<tr>
										<td>${vo.mnick}</td>
										<td>${vo.r_content}</td>
										<td>${vo.r_date}</td>
									</tr>
								</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<div class="modal fade" id="review-modal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="myModalLabel">
								리뷰 작성
							</h5> 
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body">
							<textarea class="form-control" rows="10"
								id="review-content" placeholder="리뷰 내용"></textarea>
						</div>
						<div class="modal-footer">
							 
							<button type="button" class="btn btn-primary" id="btnInput">
								리뷰 작성
							</button> 
							<button type="button" class="btn btn-secondary" data-dismiss="modal">
								취소
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-md-2"></div>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/bottom.jsp"%>