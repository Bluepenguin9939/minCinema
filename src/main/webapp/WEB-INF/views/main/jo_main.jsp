<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@ include file="/WEB-INF/views/include/top.jsp" %>

<link href="/resources/css/main/main.css?after" rel="stylesheet">

<script>
$(function() {
	$(".slide-movie-image").click(function() {
		location.href="/main/heo_details";
	});
});
</script>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-12" style="padding: 0px;">
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
					    	<a href="#">
						    	<img src="/resources/img/mov01.jpg" alt="영화1" 
						    		height="500" class="slide-movie-image" id="test">
				    		</a>
					    	<a href="#">
						    	<img src="/resources/img/mov02.jpg" alt="영화2" 
						    		height="500" class="slide-movie-image">
				    		</a>
					    	<a href="#">
						    	<img src="/resources/img/mov03.jpg" alt="영화3" 
						    		height="500" class="slide-movie-image">
				    		</a>
					    	<a href="#">
						    	<img src="/resources/img/mov03.jpg" alt="영화3" 
						    		height="500" class="slide-movie-image">
				    		</a>
				    	</div>
				  	</div>
				  	<div class="carousel-item">
				  		<div class="d-flex align-items-center justify-content-center">
					    	<a href="#">
						    	<img src="/resources/img/mov04.jpg" alt="영화4" 
						    		height="500" class="slide-movie-image">
				    		</a>
					    	<a href="#">
						    	<img src="/resources/img/mov05.jpg" alt="영화5" 
						    		height="500" class="slide-movie-image">
				    		</a>
					    	<a href="#">
						    	<img src="/resources/img/mov06.jpg" alt="영화6" 
						    		height="500" class="slide-movie-image">
					    			</a>
					    	<a href="#">
						    	<img src="/resources/img/mov06.jpg" alt="영화6" 
						    		height="500" class="slide-movie-image">
			    			</a>
				    	</div>
				  	</div>
				  	<div class="carousel-item">
				  		<div class="d-flex align-items-center justify-content-center">
					    	<a href="#">
						    	<img src="/resources/img/mov07.jpg" alt="영화7" 
						    		height="500" class="slide-movie-image">
				    		</a>
					    	<a href="#">
						    	<img src="/resources/img/mov08.jpg" alt="영화8" 
						    		height="500" class="slide-movie-image">
				    		</a>
					    	<a href="#">
						    	<img src="/resources/img/mov09.jpg" alt="영화9" 
						    		height="500" class="slide-movie-image">
				    		</a>
					    	<a href="#">
						    	<img src="/resources/img/mov09.jpg" alt="영화9" 
						    		height="500" class="slide-movie-image">
				    		</a>
				    	</div>
				  	</div>
				</div>
				<!-- Left and right controls -->
				<a class="carousel-control-prev" href="#slide-movie" data-slide="prev">
				  	<span class="carousel-control-prev-icon"></span>
				</a>
				<a class="carousel-control-next" href="#slide-movie" data-slide="next">
				  	<span class="carousel-control-next-icon"></span>
				</a>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
			<nav class="navbar navbar-expand-sm bg-dark" id="main-nav">
				<div class="container" style="padding: 0px;">
					<div class="d-flex justify-content-between mr-auto" style="width: 20%;">
						<div class="dropdown main-dropdown">
				        	<a class="dropdown main-nav-dropdown" data-toggle="dropdown">정렬</a>
				        	<div class="dropdown-menu">
						   		<a class="dropdown-item" href="#">최신순</a>
							    <a class="dropdown-item" href="#">인기순</a>
							    <a class="dropdown-item" href="#">순</a>
						  	</div>
					  	</div>  
						<div class="dropdown main-dropdown">
				        	<a class="dropdown main-nav-dropdown" data-toggle="dropdown">장르</a>
				        	<div class="dropdown-menu">
						   		<a class="dropdown-item" href="#">전체보기</a>
							    <a class="dropdown-item" href="#">로맨스</a>
							    <a class="dropdown-item" href="#">공포</a>
							    <a class="dropdown-item" href="#">액션</a>
							    <a class="dropdown-item" href="#">코미디</a>
						  	</div>
					  	</div>
					</div>
					<div style="width: 30%;">
					  	<form class="d-none d-sm-inline-block form-inline navbar-search" style="margin: 0px;">
					  		<div class="d-flex justify-content-between">
								<select id="search" name="search">
									<option value="title">타이틀</option>
									<option value="director">감독</option>
								</select>
		                        <div class="input-group">
		                            <input type="text" class="form-control bg-light border-0 small" 
		                            	placeholder="검색어를 입력해주세요" name="movie-search"
		                                aria-label="Search" aria-describedby="basic-addon2">
		                            <div class="input-group-append">
		                                <button class="btn btn-secondary" type="button">
		                                    <i class="fas fa-search fa-sm"></i>
		                                </button>
		                            </div>
		                        </div>
	                        </div>
	                    </form>
                    </div>
				</div>
			</nav>
			
			<!-- 메인 리스트 -->
			<div class="main-movie-list">
			<c:forEach var="vo" items="${movieList}" begin="0" end="4">
				<div>
					<div class="test-div">
						<a href="#">
							<div class="card-movie-image">
								<img src="/resources/img/mov01.jpg" alt="영화1"
									class="main-movie">
							</div>
<!-- 							<div class="user-rate"> -->
<!-- 								<span><i class="fa fa-star"></i>9.6</span> -->
<!-- 							</div> -->
						</a>
						<button type="button" class="bookmark"><i class="far fa-heart"></i></button>
					</div>
					<c:choose>
						<c:when test="${fn:length(vo.mov_title) > 10}">
							<span class="movie-name">${fn:substring(vo.mov_title, 0, 10)}...</span><br>
						</c:when>
						<c:otherwise>
							<span class="movie-name">${vo.mov_title}</span><br>
						</c:otherwise>
					</c:choose>
					<span class="info">${fn:substring(vo.mov_releaseDate, 0, 4)} | ${vo.mov_genre} | ${vo.mov_runtime}분</span>
				</div>
			</c:forEach>
			</div>
			<div class="main-movie-list">
			<c:forEach var="vo" items="${movieList}" begin="5" end="9">
				<div>
					<div class="test-div">
						<a href="#">
							<div class="card-movie-image">
								<img src="/resources/img/mov01.jpg" alt="영화1"
									class="main-movie">
							</div>
<!-- 							<div class="user-rate"> -->
<!-- 								<span><i class="fa fa-star"></i>9.6</span> -->
<!-- 							</div> -->
						</a>
						<button type="button" class="bookmark"><i class="far fa-heart"></i></button>
					</div>
					<c:choose>
						<c:when test="${fn:length(vo.mov_title) > 10}">
							<span class="movie-name">${fn:substring(vo.mov_title, 0, 10)}...</span><br>
						</c:when>
						<c:otherwise>
							<span class="movie-name">${vo.mov_title}</span><br>
						</c:otherwise>
					</c:choose>
					<span class="info">${fn:substring(vo.mov_releaseDate, 0, 4)} | ${vo.mov_genre} | ${vo.mov_runtime}분</span>
				</div>
			</c:forEach>
			</div>
			<!-- // 메인 리스트 -->
			
			<hr style="border: 0; border-bottom: 2px solid #555555;">
			
			<!-- 이벤트 -->
			<h3 style="margin-bottom: 10px;">이벤트</h3>
			<div>
				<div>
					<a href="/main/jo_event">
						<!-- 이미지 출처 : <a href="https://kr.freepik.com/free-photo/calendar-with-checklist-date-schedule-3d-icon_33062239.htm#query=%EC%B6%9C%EC%84%9D%EC%B2%B4%ED%81%AC&position=1&from_view=keyword&track=sph&uuid=2a4d4c31-c698-4c74-a6d3-855a2527015a">작가 upklyak</a> 출처 Freepik -->
						<img src="/resources/img/event/attendance_check.png" alt="출석체크"
							style="width: 500px; height: 400px; border: 2px solid #000000"> 
				 	</a>
				</div>
			</div>
			<!-- // 이벤트 -->
			
		</div>
		<div class="col-md-2">
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/include/bottom.jsp" %>
