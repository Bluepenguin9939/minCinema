<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@ include file="/WEB-INF/views/include/top.jsp" %>

<link href="/resources/css/main/main.css?after" rel="stylesheet">
<c:set var="begin" value="10"/>
<script>
$(function() {
	var loginInfo = "${loginInfo}";
// 	누른 하트 찾기
	if (loginInfo != "") {
		var heartMovies = "${heartMovies}";
		var heartList = heartMovies.split(",");
		
		for (var v = 0; v < heartList.length; v++) {
			for (var i = 0; i < $(".card-movie-image").length; i++) {
				var main_movie = $(".card-movie-image:eq(" + i + ")");
				var movie_code = main_movie.attr("data-mov_code");
				if (heartList[v].trim() == movie_code) {
					main_movie.next().css("background-color", "red");
				}
			}
		}
	}
	
// 	하트 추가 및 제거
	$(".heart").click(function() {
		if (loginInfo != "") {
			var heart = $(this);
			var mov_code = heart.prev().attr("data-mov_code");
			var url = "";
			if (heart.css("background-color") == "rgb(153, 153, 153)") { // 하트 추가
				heart.css("background-color", "rgb(255, 0, 0)");
				url = "/heart/addHeart/" + mov_code;
			} else if (heart.css("background-color") == "rgb(255, 0, 0)") { // 하트 삭제
				heart.css("background-color", "rgb(153, 153, 153)");
				url = "/heart/removeHeart/" + mov_code;
			}
			$.post(url, function() {
				
			});
		} else {
			self.location = "/member/jo_login";
		}
	});
	
	$(document).on("click", ".card-movie-image", function() {
		var mov_code = $(this).attr("data-mov_code");
		$("#detail_mov_code").val(mov_code);
		$("#frmDetails").submit();
	});
	
	$(".a-slide-img").click(function(e) {
		e.preventDefault();
		
		var mov_code = $(this).attr("data-mov_code");
		$("#detail_mov_code").val(mov_code);
		$("#frmDetails").submit();
	});
	
	var acount = 10;
	var begin = 11;
	var end = 0;;
	
	if (${fn:length(movieList)} > acount) {
		$("#btnMoreMovie").css("display", "block")
	}
	
	$("#btnMoreMovie").click(function() {
		$(this).css("display", "none");
		
		var list_clone = $(".all-movie-list > div:eq(0)").clone();
		list_clone.empty();
		$(".all-movie-list").append(list_clone);
		
		var all_list = "${movieList}";
		end = all_list.split("Jo_MovieVO").length;
		if (end - begin > 5) {
			end = begin + 5;
			for (var i = begin; i < end; i++) {
				var mov_code = all_list.split("Jo_MovieVO")[i].split("mov_code=")[1].split(",")[0];
				var mov_title = all_list.split("Jo_MovieVO")[i].split("mov_title=")[1].split(",")[0];
				var mov_releaseDate = all_list.split("Jo_MovieVO")[11].split("mov_releaseDate=")[1].split(",")[0].substring(0, 4);
				var mov_genre = all_list.split("Jo_MovieVO")[i].split("mov_genre=")[1].split(", ")[0];
				if (mov_genre.length > 9) {
					mov_genre = mov_genre.substring(0, 9) + "...";
				}
				var mov_runtime = all_list.split("Jo_MovieVO")[i].split("mov_runtime=")[1].split(",")[0];
				var info = mov_releaseDate + " | " + mov_genre + " | " + mov_runtime;
				
				var upload_path = all_list.split("Jo_MovieVO")[i].split("upload_path=")[1].split(",")[0];
				var file_name = all_list.split("Jo_MovieVO")[i].split("file_name=")[1].split(",")[0];
				
				var moreDiv = $(".all-movie-list > div:last()");
				
				var movie_clone = $(".all-movie-list > div:eq(0) > div:eq(0)").clone();
				movie_clone.find(".main-movie-img").attr("src", "/display?fileName=" + upload_path + "/" + file_name);
				movie_clone.find(".card-movie-image").attr("data-mov_code", mov_code);
				movie_clone.find(".movie-name").text(mov_title);
				movie_clone.find(".info").text(info);
				moreDiv.append(movie_clone);
			}
		} else {
			for (var i = begin; i < end; i++) {
				var mov_code = all_list.split("Jo_MovieVO")[i].split("mov_code=")[1].split(",")[0];
				var mov_title = all_list.split("Jo_MovieVO")[i].split("mov_title=")[1].split(",")[0];
				var mov_releaseDate = all_list.split("Jo_MovieVO")[11].split("mov_releaseDate=")[1].split(",")[0].substring(0, 4);
				var mov_genre = all_list.split("Jo_MovieVO")[i].split("mov_genre=")[1].split(", ")[0];
				if (mov_genre.length > 9) {
					mov_genre = mov_genre.substring(0, 9) + "...";
				}
				var mov_runtime = all_list.split("Jo_MovieVO")[i].split("mov_runtime=")[1].split(",")[0];
				var info = mov_releaseDate + " | " + mov_genre + " | " + mov_runtime + "분";
				
				var upload_path = all_list.split("Jo_MovieVO")[i].split("upload_path=")[1].split(",")[0];
				var file_name = all_list.split("Jo_MovieVO")[i].split("file_name=")[1].split(",")[0];
				
				var moreDiv = $(".all-movie-list > div:last()");
				
				var movie_clone = $(".all-movie-list > div:eq(0) > div:eq(0)").clone();
				movie_clone.find(".main-movie-img").attr("src", "/display?fileName=" + upload_path + "/" + file_name);
				movie_clone.find(".card-movie-image").attr("data-mov_code", mov_code);
				movie_clone.find(".movie-name").text(mov_title);
				movie_clone.find(".info").text(info);
				moreDiv.append(movie_clone);
			}
		}
		acount += 5;
		MoreMovie();
		begin += 5;
	});
});
function MoreMovie(acount) {
	if (${fn:length(movieList)} > acount && ${fn:length(movieList) % 5 >= 0 && fn:length(movieList) % 5 < 5}) {
		$("#btnMoreMovie").css("display", "block");
	}
} 
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
				 		<div class="d-flex align-items-center justify-content-around">
			 			<c:forEach var="vo" items="${slideList}" begin="0" end="3">
					    	<a href="#" class="a-slide-img" data-mov_code="${vo.mov_code}">
						    	<img src="/display?fileName=${vo.upload_path}/${vo.file_name}"
						    		alt="영화1" height="500" class="slide-movie-image"> 
				    		</a>
			    		</c:forEach>
				    	</div>
				  	</div>
				  	<div class="carousel-item">
				  		<div class="d-flex align-items-center justify-content-around">
				  		<c:forEach var="vo" items="${slideList}" begin="4" end="7">
					    	<a href="#" class="a-slide-img" data-mov_code="${vo.mov_code}">
						    	<img src="/display?fileName=${vo.upload_path}/${vo.file_name}" 
						    		alt="영화4" height="500" class="slide-movie-image">
				    		</a>
			    		</c:forEach>
				    	</div>
				  	</div>
				  	<div class="carousel-item">
				  		<div class="d-flex align-items-center justify-content-around">
				  		<c:forEach var="vo" items="${slideList}" begin="8" end="11">
					    	<a href="#" class="a-slide-img" data-mov_code="${vo.mov_code}">
						    	<img src="/display?fileName=${vo.upload_path}/${vo.file_name}" 
						    		alt="영화4" height="500" class="slide-movie-image">
				    		</a>
			    		</c:forEach>
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
			<nav class="navbar navbar-expand-sm" id="main-nav">
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
						   		<a class="dropdown-item" href="/main/jo_main">전체보기</a>
							    <a class="dropdown-item" href="/main/jo_main?mov_genre=로맨스">로맨스</a>
							    <a class="dropdown-item" href="/main/jo_main?mov_genre=공포">공포</a>
							    <a class="dropdown-item" href="/main/jo_main?mov_genre=액션">액션</a>
							    <a class="dropdown-item" href="/main/jo_main?mov_genre=코미디">코미디</a>
							    <a class="dropdown-item" href="/main/jo_main?mov_genre=드라마">드라마</a>
						  	</div>
					  	</div>
					</div>
					<div style="width: 30%;">
					  	<form class="d-none d-sm-inline-block form-inline navbar-search" style="margin: 0px;"
					  		action="/main/jo_main" method="get">
					  		<div class="d-flex justify-content-between">
								<select id="search" name="search">
									<option value="T" ${param.search == 'T' ? 'selected' : ''}>타이틀</option>
									<option value="D" ${param.search == 'D' ? 'selected' : ''}>감독</option>
								</select>
		                        <div class="input-group">
		                            <input type="text" class="form-control bg-light border-0 small" 
		                            	placeholder="검색어를 입력해주세요" name="keyword" value="${param.keyword}"
		                                aria-label="Search" aria-describedby="basic-addon2">
		                            <div class="input-group-append">
		                                <button class="btn btn-secondary" type="submit">
		                                    <i class="fas fa-search fa-sm"></i>
		                                </button>
		                            </div>
		                        </div>
	                        </div>
	                    </form>
                    </div>
				</div>
			</nav>
			
			<%@ include file="/WEB-INF/views/include/jo_frmDetail.jsp" %>
			<!-- 메인 리스트 -->
			<div class="all-movie-list">
				<div class="main-movie-list">
				<c:forEach var="vo" items="${movieList}" begin="0" end="4">
					<div class="main-movie">
						<div class="card-div">
							<div class="card-movie-image" data-mov_code="${vo.mov_code}">
<%-- 							<c:choose> --%>
<%-- 								<c:when test="${vo.attachVO.mov_code == vo.mov_code}"> --%>
									<img src="/display?fileName=${vo.attachVO.upload_path}/${vo.attachVO.file_name}" alt="영화1"
										class="main-movie-img">
<%-- 								</c:when> --%>
<%-- 							</c:choose> --%>
							</div>
	<!-- 							<div class="user-rate"> -->
	<!-- 								<span><i class="fa fa-star"></i>9.6</span> -->
	<!-- 							</div> -->
							<button type="button" class="heart"><i class="far fa-heart"></i></button>
						</div>
						<c:choose>
							<c:when test="${fn:length(vo.mov_title) > 10}">
								<span class="movie-name">${fn:substring(vo.mov_title, 0, 10)}...</span><br>
							</c:when>
							<c:otherwise>
								<span class="movie-name">${vo.mov_title}</span><br>
							</c:otherwise>
						</c:choose>
						<span class="info">
							${fn:substring(vo.mov_releaseDate, 0, 4)} | 
							<c:if test="${fn:length(vo.mov_genre) > 8}">
								${fn:substring(vo.mov_genre, 0, 8)}...
							</c:if>
							<c:if test="${fn:length(vo.mov_genre) <= 8}">
								${vo.mov_genre}
							</c:if>
							 | ${vo.mov_runtime}분
						</span>
					</div>
				</c:forEach>
				</div>
				<div class="main-movie-list">
				<c:forEach var="vo" items="${movieList}" begin="5" end="9">
					<div class="main-movie">
						<div class="card-div">
							<div class="card-movie-image" data-mov_code="${vo.mov_code}">
							<c:choose>
								<c:when test="${vo.attachVO.mov_code == vo.mov_code}">
									<img src="/display?fileName=${vo.attachVO.upload_path}/${vo.attachVO.file_name}" alt="영화1"
										class="main-movie-img">
								</c:when>
							</c:choose>
							</div>
	<!-- 							<div class="user-rate"> -->
	<!-- 								<span><i class="fa fa-star"></i>9.6</span> -->
	<!-- 							</div> -->
						<button type="button" class="heart"><i class="far fa-heart"></i></button>
						</div>
						<c:choose>
							<c:when test="${fn:length(vo.mov_title) > 10}">
								<span class="movie-name">${fn:substring(vo.mov_title, 0, 10)}...</span><br>
							</c:when>
							<c:otherwise>
								<span class="movie-name">${vo.mov_title}</span><br>
							</c:otherwise>
						</c:choose>
						<span class="info">
							${fn:substring(vo.mov_releaseDate, 0, 4)} | 
							<c:if test="${fn:length(vo.mov_genre) > 8}">
								${fn:substring(vo.mov_genre, 0, 8)}...
							</c:if>
							<c:if test="${fn:length(vo.mov_genre) <= 8}">
								${vo.mov_genre}
							</c:if>
							 | ${vo.mov_runtime}분
						</span>
					</div>
				</c:forEach>
				</div>
			</div>
			<div class="d-flex justify-content-center">
				<button type="button" class="btn btn-secondary" id="btnMoreMovie">
					더보기
				</button>
			</div>
			<!-- // 메인 리스트 -->
			
			<hr style="border: 0; border-bottom: 2px solid #555555;">
			
			<!-- 이벤트 -->
			<h3 style="margin-bottom: 10px;">이벤트</h3>
			<div style="margin-bottom: 30px;">
				<div>
					<a href="/main/jo_event">
						<!-- 이미지 출처 : <a href="https://kr.freepik.com/free-photo/calendar-with-checklist-date-schedule-3d-icon_33062239.htm#query=%EC%B6%9C%EC%84%9D%EC%B2%B4%ED%81%AC&position=1&from_view=keyword&track=sph&uuid=2a4d4c31-c698-4c74-a6d3-855a2527015a">작가 upklyak</a> 출처 Freepik -->
						<img src="/resources/img/event/attendance_check.png?after" alt="출석체크"
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
