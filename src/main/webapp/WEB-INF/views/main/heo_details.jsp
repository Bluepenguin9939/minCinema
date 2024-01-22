<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/top.jsp"%>
<link href="/resources/css/details/heo_details.css?after"
	rel="stylesheet">
<div class="container-fluid">
	<div class="row">
		<div class="col-md-3"></div>
		<div class="col-md-6">
			<br> <br>
			<div class="d-flex">
				<img class="movie-details" src="/resources/img/mov01.jpg">
				<div class="details-logo">
					<div class="mov-details-name">토이스토리4</div>
					<ul class="mov-details-ul">
						<li class="mov-details-info-openDate">개봉일: 2019년 6월 20일</li>
						<li class="mov-details-info-time"><i class="fa fa-clock">100분</i></li>
						<li class="mov-details-info-age">전체관람가</li>
					</ul>
					<div class="mov-details-info-div">
						<textarea class="form-control mov-details-info"
							style="font-size: 20px; width: 350px; height: 200px; background-color: #999999;"
							readonly>앤디의 집을 떠나 새로운 공간에서 살게 된 우디는 장난감 친구 포키의 돌발행동으로 인해 홀로 모험 길에 오르게 된다. 그러던 중 보핍을 오랜만에 만나고 그녀에게 도움을 청한다.</textarea>
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
				<div class="tab-content py-3">
					<div class="tab-pane active" id="tab1">
						<h3>영화정보</h3>
						<ul>
							<li>장르<a style="padding-left: 10px;">애니메이션/가족</a></li>
							<li>감독<a
								style="padding-left: 10px; text-decoration: underline;">조시
									쿨리</a></li>
							<li>출연<a style="padding-left: 10px; text-decoration: underline;">톰 행크스, 팀 알렌, 애니
									포츠</a></li>
						</ul>
						<br>
						<h3>트레일러</h3>
						<iframe width="700" height="400"
							src="https://www.youtube.com/embed/u8GQibRXVHg?si=jbbvFff43Jdo1jzF&autoplay=1&mute=1"
							title="YouTube video player" frameborder="0"
							allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
							allowfullscreen></iframe>

						<h3 class="mov-details-stillcut">스틸컷</h3>
						<br>
						<div id="slide-movie" class="carousel slide" data-ride="carousel">
							<!-- Indicators -->
							<ul class="carousel-indicators">
								<li data-target="#slide-movie" data-slide-to="0" class="active"></li>
								<li data-target="#slide-movie" data-slide-to="1"></li>
								<li data-target="#slide-movie" data-slide-to="2"></li>
							</ul>

							<!-- The slideshow -->
							<div class="carousel-inner">
								<div class="carousel-item active">
									<div class="d-flex align-items-center justify-content-center">
										<a href="#"> <img
											src="/resources/img/stillcuts/toy_stillcuts/toy_stillcut1.jpeg"
											alt="영화1" height="500" class="slide-movie-image" id="test">
										</a>
									</div>
								</div>
								<c:forEach begin="2" end="15" var="i">
									<div class="carousel-item">
										<div class="d-flex align-items-center justify-content-center">
											<a href="#"> <img
												src="/resources/img/stillcuts/toy_stillcuts/toy_stillcut${i}.jpeg"
												alt="영화1" height="500" class="slide-movie-image" id="test">
											</a>
										</div>
									</div>
								</c:forEach>
							</div>
							<!-- Left and right controls -->
							<a class="carousel-control-prev" href="#slide-movie"
								data-slide="prev"> <span class="carousel-control-prev-icon"></span>
							</a> <a class="carousel-control-next" href="#slide-movie"
								data-slide="next"> <span class="carousel-control-next-icon"></span>
							</a>
						</div>

					</div>
					<div class="tab-pane" id="tab2">
						<div class="container mov-details-reviews-div">
							<br>
							<h2>관람평</h2>
							<table class="table">
								<thead class="thead-dark">
									<tr>
										<th>아이디</th>
										<th>리뷰 내용</th>
										<th>평점</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>JoMaMin</td>
										<td>재밌는지는 잘 모르겠네요</td>
										<td>넣어야함!</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-md-2"></div>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/bottom.jsp"%>