<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/WEB-INF/views/include/top.jsp" %>

<script>
$(function() {
	$(".slide-movie-image").hover(function() {
		$(this).animate({
			opacity: '0.5'
		});
	}, function() {
		$(this).animate({
			opacity: '1'
		});
	});
	
	$(".slide-movie-image").click(function() {
		console.log("click");
	});
	
	$(".test-div").hover(function() {
		$(this).animate({
			opacity: '0.5'
		});
		$(this).find("div:last").fadeIn(400);
		$(this).find("button").fadeIn(400);
		$(this).next().css("color", "#6666fe");
	}, function() {
		$(this).animate({
			opacity: '1'
		});
		$(this).find("div:last").fadeOut(400);
		$(this).find("button").fadeOut(400);
		$(this).next().css("color", "inherit");
	});
	
	$(window).on("scroll", function() {
		var scroll = $(window).scrollTop();
		if (scroll > 0) {
			$(".scroll-to-top").fadeIn(1000);
		} else {
			$(".scroll-to-top").fadeOut(1000);
		}
	});
	
	$("#login").on("mouseenter", function() {
		$(this).find($(".fa-door-closed")).css("display", "none");
		$(this).find($(".fa-door-open")).css("display", "");
	});
	
	$("#login").on("mouseleave", function() {
		$(this).find($(".fa-door-open")).css("display", "none");
		$(this).find($(".fa-door-closed")).css("display", "");
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
				<div class="container">
					<div class="d-flex justify-content-between" style="width: 20%;">
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
						  	</div>
					  	</div>
					</div>
					<!-- Links -->
					<div class="d-flex justify-content-end">
						<ul class="navbar-nav">
							<li class="nav-item">
								<a class="nav-link" href="#">Link 1</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="#">Link 2</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="#">Link 3</a>
							</li>
						</ul>
					</div>
				</div>
			</nav>
			
			<!-- 메인 리스트 -->
			<div class="d-flex justify-content-center main-movie-list">
				<div>
					<div class="test-div">
						<a href="#">
							<div class="card-movie-image">
								<img src="/resources/img/mov01.jpg" alt="영화1"
									class="main-movie">
							</div>
							<div class="user-rate"><span><i class="fa fa-star"></i>9.6</span></div>
						</a>
						<button type="button" class="bookmark"><i class="fa fa-bookmark"></i></button>
					</div>
					<span class="movie-name">토이스토리</span><br>
					<span class="info">2014 | 애니메이션, 가족 | 100분</span>
				</div>
				<div>
					<div class="test-div">
					<a href="#">
						<div class="card-movie-image">
							<img src="/resources/img/mov02.jpg" alt="영화1"
								class="main-movie">
						</div>
						<div class="user-rate"><span><i class="fa fa-star"></i>9.6</span></div>
					</a>
					<button type="button" class="bookmark"><i class="fa fa-bookmark"></i></button>
					</div>
					<span class="movie-name">호빗</span><br>
					<span class="info">2014 | 판타지, 모험, 액션 | 144분</span>
				</div>
				<div>
					<div class="test-div">
					<a href="#">
						<div class="card-movie-image">
							<img src="/resources/img/mov03.jpg" alt="영화1"
								class="main-movie">
						</div>
						<div class="user-rate"><span><i class="fa fa-star"></i>9.6</span></div>
					</a>
					<button type="button" class="bookmark"><i class="fa fa-bookmark"></i></button>
					</div>
					<span class="movie-name">토이스토리</span><br>
					<span class="info">2014 | 애니메이션, 가족 | 100분</span>
				</div>
				<div>
					<div class="test-div">
					<a href="#">
						<div class="card-movie-image">
							<img src="/resources/img/mov04.jpg" alt="영화1"
								class="main-movie">
						</div>
						<div class="user-rate"><span><i class="fa fa-star"></i>9.6</span></div>
					</a>
					<button type="button" class="bookmark"><i class="fa fa-bookmark"></i></button>
					</div>
					<span class="movie-name">호빗</span><br>
					<span class="info">2014 | 판타지, 모험, 액션 | 144분</span>
				</div>
				<div>
					<div class="test-div">
					<a href="#">
						<div class="card-movie-image">
							<img src="/resources/img/mov05.jpg" alt="영화1"
								class="main-movie">
						</div>
						<div class="user-rate"><span><i class="fa fa-star"></i>9.6</span></div>
					</a>
					<button type="button" class="bookmark"><i class="fa fa-bookmark"></i></button>
					</div>
					<span class="movie-name">토이스토리</span><br>
					<span class="info">2014 | 애니메이션, 가족 | 100분</span>
				</div>
				<div>
					<div class="test-div">
					<a href="#">
						<div class="card-movie-image">
							<img src="/resources/img/mov06.jpg" alt="영화1"
								class="main-movie">
						</div>
						<div class="user-rate"><span><i class="fa fa-star"></i>9.6</span></div>
					</a>
					<button type="button" class="bookmark"><i class="fa fa-bookmark"></i></button>
					</div>
					<span class="movie-name">호빗</span><br>
					<span class="info">2014 | 판타지, 모험, 액션 | 144분</span>
				</div>
			</div>
		</div>
		<div class="col-md-2">
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/include/bottom.jsp" %>
