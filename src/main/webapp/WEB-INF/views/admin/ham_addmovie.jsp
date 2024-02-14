<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="/WEB-INF/views/include/ad_sidebar.jsp" %>
<%@ include file="/WEB-INF/views/include/ad_topbar.jsp" %>

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="stylesheet" href="/resources/css/admin/addmovie.css?after" type="text/css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Image Upload Example</title>
<script>
$(function(){
	var addMovieResult = "${addResult}";
	if (addMovieResult == "true") {
		alert("영화 추가 완료");
	}
	
// 	영화 주간 박스오피스 TOP10 가져오기
	var key = "93e13fb8a551cb3daf41b1d892d75166" // 공용 키
	
	$("#btnGetWeekMovie").click(function() {
		var today = new Date();
		console.log(today);
		var day = today.getDay();
		console.log("day :", day);
		
		var year = today.getFullYear();
		var month = today.getMonth() + 1;
		if (month < 10) {
			month = "0" + month;
		}
		var date = today.getDate();
		if (date < 10) {
			date = "0" + date;
		}
		if (day != 0) {
			if (date <= day) {
				month--;
				if (month == 0) {
					year--;
					month = 12;
				}
				var lmDate = new Date(year, month, 0).getDate();
				console.log("lmDate :", lmDate);
				date = lmDate + parseInt(date) - day;
			} else {
				date = date - day;
				if (date < 10) {
					date = "0" + date;
				}
			}
		}
		var targetDt = String(year) + month + date;
		
		var movieListURL = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchWeeklyBoxOfficeList.json";
		var movieListData = {
				"key" : key,
				"weekGb" : "0",
				"targetDt" : targetDt,
				"multiMovieYn" : "N"
		}
		
		$.get(movieListURL, movieListData, function(rData) {
			console.log(rData.boxOfficeResult.weeklyBoxOfficeList);
		});
	});

// 	영화 코드로 값 가져오기
	$("#btnGetMovie").click(function() {
		var getMovieData = $("#getMovieData").val();
		if (getMovieData == "") {
			alert("영화코드를 입력해주세요.");
			return;
		}
		console.log("movieCd :",getMovieData);
		
		var movieDetailURL = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json";
		var movieDetailData = {
				"key" : key,
				"movieCd" : getMovieData
		}
		$.get(movieDetailURL, movieDetailData, function(detailrData) {
			var movieInfo = detailrData.movieInfoResult.movieInfo;
			console.log("movieInfo :", movieInfo);
			var movieGenre = "";
			var movieDirector = "";
			var movieActor = "";
			
			$("#movieCd").val(movieInfo.movieCd);
			$("#movieTitle").val(movieInfo.movieNm);
			$("#movieReleaseDate").val(movieInfo.openDt);
			$("#movieRating").val(movieInfo.audits[0].watchGradeNm);
			$("#movieRuntime").val(movieInfo.showTm);
			
			var arrGenre= new Array();
			for (var v = 0; v < movieInfo.genres.length; v++) {
				arrGenre.push(movieInfo.genres[v].genreNm);
			}
			movieGenre = arrGenre.join(",");
			$("#movieGenre").val(movieGenre);
			
			var arrDirector = new Array();
			for (var v = 0; v < movieInfo.directors.length; v++) {
				arrDirector.push(movieInfo.directors[v].peopleNm);
			}
			movieDirector = arrDirector.join(",");
			$("#movieDirector").val(movieDirector);
			
			var arrActor = new Array();
			for (var v = 0; v < movieInfo.actors.length; v++) {
				arrActor.push(movieInfo.actors[v].peopleNm);
			}
			movieActor = arrActor.join(",");
			$("#movieActor").val(movieActor);
		});
	});
	
// 	포스터 이미지 추가
	$("#poster-upload").change(function(e) {
		var upload_image = e.target.files;
		
		var formData = new FormData();
		formData.append("uploadFile", upload_image[0]);
		
		$.ajax({
			"url" : "/uploadPosterImage",
			"type" : "post",
			"processData" : false,
			"contentType" : false,
			"data" : formData,
			"success" : function(rData) {
				var attachVO = rData.attachVO;
				var upload_path = attachVO.upload_path;
				var file_name = attachVO.file_name;
				
				var file_path = upload_path + "/" + file_name;
				var url = "/display?fileName=" + file_path
				$("#upload-img").attr("src", url);
				$("#upload-img").attr("data-upload_path", upload_path);
				$("#upload-img").attr("data-file_name", file_name);
			}
		});
	});
	
// 	스틸컷 드래그 & 드랍
	$("#dropDiv").on("dragenter dragover", function (e){
		e.preventDefault();
	});

	$("#dropDiv").on("drop", function(e) {
		e.preventDefault();
		var upload_image = e.originalEvent.dataTransfer.files;
		
		var formData = new FormData();
		for (var v = 0; v < upload_image.length; v++) {
			formData.append("uploadFile", upload_image[v]);
		}
		
		$.ajax({
			"url" : "/uploadStillCutImage",
			"type" : "post",
			"processData" : false,
			"contentType" : false,
			"data" : formData,
			"success" : function(rData) {
				$(rData).each(function(i, obj) {
					var cloneStillCutDiv = $("#stillCutDiv > div:eq(0)").clone();
					
					var url = "/display?fileName=" + obj.upload_path + "/" + obj.file_name;
					cloneStillCutDiv.find("img").attr("src", url);
					
					$("#stillCutDiv").append(cloneStillCutDiv);
					cloneStillCutDiv.fadeIn(1000);
					
					cloneStillCutDiv.attr("data-upload_path", obj.upload_path);
					cloneStillCutDiv.attr("data-file_name", obj.file_name);
				});
			}
		});
	});
	
// 	div 클릭 시 업로드
	$("#dropDiv").click(function() {
		$("#stillcut-upload").click();
	});
	
	$("#stillcut-upload").change(function(e) {
		var upload_image = e.originalEvent.target.files;
		
		var formData = new FormData();
		for (var v = 0; v < upload_image.length; v++) {
			formData.append("uploadFile", upload_image[v]);
		}
		
		$.ajax({
			"url" : "/uploadStillCutImage",
			"type" : "post",
			"processData" : false,
			"contentType" : false,
			"data" : formData,
			"success" : function(rData) {
				$(rData).each(function(i, obj) {
					var cloneStillCutDiv = $("#stillCutDiv > div:eq(0)").clone();
					
					var url = "/display?fileName=" + obj.upload_path + "/" + obj.file_name;
					cloneStillCutDiv.find("img").attr("src", url);
					
					$("#stillCutDiv").append(cloneStillCutDiv);
					cloneStillCutDiv.fadeIn(1000);
					
					cloneStillCutDiv.attr("data-upload_path", obj.upload_path);
					cloneStillCutDiv.attr("data-file_name", obj.file_name);
				});
			}
		});
	});
	
// 	폼 전송 시
	$("#frmAddMovie").submit(function() {
		var that = $(this);
		
		if ($("#movieTitle").val() == "") {
			alert("영화 제목을 입력해주세요.");
			return false;
		}
		if ($("#moviePlot").val() == "") {
			alert("시놉시스를 입력해주세요.");
			return false;
		}
		if ($("#movieReleaseDate").val() == "") {
			alert("영화 개봉일을 입력해주세요.");
			return false;
		}
		if ($("#movieRating").val() == "") {
			alert("영화 관람등급을 입력해주세요.");
			return false;
		}
		if ($("#movieRuntime").val() == "") {
			alert("영화 러닝타임을 입력해주세요.");
			return false;
		}
		if ($("#movieGenre").val() == "") {
			alert("영화 장르를 입력해주세요.");
			return false;
		}
		if ($("#movieCd").val() == "") {
			alert("영화 코드를 입력해주세요.");
			return false;
		}
		if ($("#movieDirector").val() == "") {
			alert("영화 감독을 입력해주세요.");
			return false;
		}
		if ($("#movieActor").val() == "") {
			alert("영화 배우를 입력해주세요.");
			return false;
		}
		if ($("#mov_trailer").val() == "") {
			alert("영화 트레일러를 입력해주세요.");
			return false;
		}
// 		포스터 이미지
		var upload_path = $("#upload-img").attr("data-upload_path");
		var file_name = $("#upload-img").attr("data-file_name");
		
		if (upload_path == null || file_name == null) {
			alert("포스터 이미지를 확인해 주세요.")
			return false;
		}
		
		$("#upload_path").val(upload_path);
		$("#file_name").val(file_name);
		
// 		스틸컷 이미지
		var stillCut = $(".stillCutImage:gt(0)");
		
		if (stillCut.length == 0) {
			alert("스틸컷 이미지를 확인해 주세요.")
			return false;
		}
		
		stillCut.each(function(i) {
			var mov_code = $("#movieCd").val();
			var still_upload_path = $(this).attr("data-upload_path");
			var still_file_name = $(this).attr("data-file_name");
			var inputPath = "<input type='hidden' name='list[" + i + "].upload_path' value='" + still_upload_path + "'>"
			var inputFile = "<input type='hidden' name='list[" + i + "].file_name' value='" + still_file_name + "'>"
			var inputCode = "<input type='hidden' name='list[" + i + "].mov_code' value='" + mov_code + "'>"
			that.prepend(inputPath);
			that.prepend(inputFile);
			that.prepend(inputCode);
		});
		return false;
	});
	
// 	영화 DB 검색 창
	$("#btnSearchMovieDB").click(function() {
		var url = "https://www.kobis.or.kr/kobis/business/mast/mvie/searchMovieList.do"
		window.open(url);
	});
	
// 	트레일러 버튼
	$("#btnGetTrailer").click(function() {
		var mov_name = $("#movieTitle").val()
		var url = "https://tv.naver.com/search?query=" + mov_name + "%20예고편";
		window.open(url);
	});
});
</script>
</head>

<body>
	<div class="notice d-flex justify-content-center" style="height: 280px;"> 
		<div style="width: 80%; display: flex; justify-content: space-between;"
			class="flex-column">
			<div class="align-self-start">
				<button type="button" id="btnGetWeekMovie"class="btn btn-sm btn-secondary">
					지난주 박스오피스 TOP10 가져오기
				</button>
				<button type="button" class="btn btn-sm btn-secondary" 
					id="btnSearchMovieDB">
					영화DB 검색하러 가기
				</button>
			</div>
			<div class="align-self-start">
				<input type="text" id="getMovieData" placeholder="영화코드">
				<button type="button" id="btnGetMovie" class="btn btn-sm btn-secondary">
					영화 가져오기
				</button>
			</div>
			<div class="admin-top">
				<h2 class="admin-body" title="" >영화 추가</h2>
			</div>
		</div>
	</div>
	<!-- 칸나누기 -->
	<div class="d-flex justify-content-center" style="height: 40%;">
	 	<form id="frmAddMovie" action="/admin/addMovie" method="post">
	 		<input type="hidden" id="upload_path" name="uploadPath">
	 		<input type="hidden" id="file_name" name="fileName">
			<div style="height: 100%;">
				<div class="fileMove-card d-flex" style="height: 100%;">
					<div class="d-flex flex-column">
						<div class="profile-images">
							<img alt="" src="/resources/img/moviedefault.jpg" id="upload-img">
						</div>
						<div class="custom-file">
							<label class="main_image_text" id="te" for="poster-upload">영화 사진 추가</label>
			  				<input type="file" id="poster-upload" name="image" accept="image/*"
			  					style="display: none;">
		  				</div>
	  				</div>
					<div class="d-flex flex-column justify-content-between" style="margin-left: 10px; width: 60%;">
						<div id="mov_title_div">
							<input type="text" id="movieTitle" name="mov_title" placeholder="영화 제목" size="40px;">
							
						</div>
						<div>
							<textarea id="moviePlot" name="mov_plot" rows="3" placeholder="상세 내용"
								style="width: 100%;"></textarea>
						</div>
						<div class="d-flex justify-content-around">
							<input class="" id="movieReleaseDate" name="mov_releaseDate" type="text" placeholder="개봉일" >
							<input class="movieText" id="movieRating" name="mov_rating" type="text" placeholder="연령" >
							<input class="movieText" id="movieRuntime" name="mov_runtime" type="text" placeholder="시간" >
						</div>
						<div class="d-flex justify-content-between">
							<input class="movieText" id="movieGenre" name="mov_genre" type="text" placeholder="장르" >
							<input class="movieText" id="movieCd" name="mov_code" type="text" placeholder="영화 코드" > 
							<input class="movieText" id="movieDirector" name="mov_director" type="text" placeholder="영화 감독" > 
							<input class="movieText" id="movieActor" name="mov_actor" type="text" placeholder="영화 배우" > 
						</div>
						<!-- 드래그 & 드롭 -->
						<div>
							<div id="dropDiv">등록할 스틸컷을 드래그 &amp; 드롭해주세요</div>
							<input type="file" id="stillcut-upload" name="image" accept="image/*"
			  					multiple style="display: none;">
						</div>
						<!-- 드롭된 스틸컷 목록 -->
						<div id="stillCutDiv" class="d-flex">
							<div class="stillCutImage" style="display: none; margin-right: 5px;">
								<img src="/resources/img/default.png" width="100" height="100" alt="스틸컷">
							</div>
						</div>
	<!-- 					<div> -->
	<!-- 						<i class="fa fa-video"></i><label for="chooseVideo" style="cursor: pointer;">동영상 업로드</label> -->
	<!-- 					</div> -->
	<!-- 					<input type="file" id="chooseVideo" name="chooseVideo" accept="video/*" onchange="loadFile(this)" style="visibility: hidden;"> -->
						<div>
							<i class="fa fa-link"></i>
							<input type="text" id="mov_trailer" 
								name="mov_trailer" placeholder="동영상 URL 등록"
								style="width: 350px;">
							<button type="button" id="btnGetTrailer"
								class="btn btn-sm btn-secondary" style="margin-left: 10px;">
								영화 트레일러 찾으러 가기
							</button>
						</div>
						<div>
							<button type="submit" id="btnAddMovie" class="btn btn-secondary">
								영화 등록하기
							</button>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
</body>
