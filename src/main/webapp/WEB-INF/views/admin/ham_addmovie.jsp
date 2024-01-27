<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="/WEB-INF/views/include/ad_sidebar.jsp" %>
<%@ include file="/WEB-INF/views/include/ad_topbar.jsp" %>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="stylesheet" href="/resources/css/admin/addmovie.css" type="text/css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Image Upload Example</title>



<!-- // $(function(){ -->
<!-- // 	$("#chooseFile").on("dragenter dragover", function (e){ -->
<!-- // 		e.preventDefault(); -->
<!-- // 	}); -->
	
<!-- // 	$("#chooseFile").on("drop", function (e){ -->
<!-- // 		e.preventDefault(); -->
<!-- // 		console.log(e.originalEvent.dataTransfer.files); -->
<!-- // 		var files = e.originalEvent.dataTransfer.files; -->
<!-- // 		console.log("파일즈:",files); -->
<!-- // 		// UploadController에 파일 보내고, 처리결과(rData) -> [] 확인 -->
<!-- // 		// <form> -->
<!-- // 		//    <input name="uploadFile"> : files의 갯수 만큼 -->
<!-- // 		//    <input name="uploadFile"> : files의 갯수 만큼 -->
<!-- // 		//    <input name="uploadFile"> : files의 갯수 만큼 -->
<!-- // 		//      -> ajax 요청 -->
<!-- // 		//          -> 응답 데이터 출력 -->
		
<!-- // 		var formData = new FormData(); // <form> -->
<!-- // 		for (var v = 0; v < files.length; v++) { -->
<!-- // 			formData.append("uploadFile", files[v]); -->
<!-- // 		} -->
<!-- // }); -->
<!-- // });	 -->

<!-- // $(function(){ -->
<!-- // 	var fileClone = $("#fileMove > input").clone(); -->
<!-- // 	var maxSize = 999999999; -->
<!-- // 	var regex = new RegExp("(.*?)\.(exe|sh|zip|alz$)"); -->
<!-- // 	function checkExtension(fileName, fileSize){ -->
<!-- // 		if(fileSize >= maxSize){ -->
<!-- // 			alert("파일 용량 초과"); -->
<!-- // 			return false; -->
<!-- // 		} -->
<!-- // 		if(regex.test(fileName)){ -->
<!-- // 			alert("해당 종류의 파일은 업로드 불가") -->
<!-- // 			return false; -->
<!-- // 		} -->
<!-- // 		return true; -->
<!-- // 	} -->
<!-- // }); -->

</head>

<body>
	<div class="notice d-flex justify-content-center" style="height: 280px;"> 
		<div style="width: 80%; display: flex; justify-content: space-between;"
			class="flex-column">
			<div class="align-self-start">
				<button type="button" id="btnGetWeekMovie"class="btn btn-sm btn-secondary">
					지난주 박스오피스 TOP10 가져오기
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
<!--  		칸나누기 -->
 	<form action="/admin/addMovie" method="post">
		<div class="col-md-12" style="margin-left: 10%;" >
			<div class="fileMove-card">
				<div class="profile-images" >
					<img alt="" src="/resources/img/moviedefault.jpg" id="upload-img">
				</div>
				<div class="custom-file">
					<label class="main_image_text" id="te" for="fileupload">영화 사진 추가</label>
	  				<input type="file" id="fileupload" name="image" accept="image/*">
  				</div>
				<div class="col-md-10 si">
					<input type="text" id="movieTitle" name="mov_title" placeholder="영화 제목" size="100px;">
					<div>
						<textarea id="moviePlot" name="mov_plot" rows="3" cols="100" placeholder="상세 내용"></textarea>
					</div>
					<div class="quarter">
						<input class="" id="movieReleaseDate" name="mov_releaseDate" type="text" placeholder="개봉일" >
						<input class="movieText" id="movieRating" name="mov_rating" type="text" placeholder="연령" >
						<input class="movieText" id="movieRuntime" name="mov_runtime" type="text" placeholder="시간" >
						<input class="movieText" id="movieGenre" name="mov_genre" type="text" placeholder="장르" >
						<input class="movieText" id="movieCd" name="mov_code" type="text" placeholder="영화 코드" > 
						<input class="movieText" id="movieDirector" name="mov_director" type="text" placeholder="영화 감독" > 
						<input class="movieText" id="movieActor" name="mov_actor" type="text" placeholder="영화 배우" > 
					</div>
					<div>
						<i class="fa fa-video"></i><label for="chooseVideo" style="cursor: pointer;">동영상 업로드</label>
					</div>
					<input type="file" id="chooseVideo" name="chooseVideo" accept="video/*" onchange="loadFile(this)" style="visibility: hidden;">
				</div>
				<div>
					<i class="fa fa-link"></i> <input type="text" placeholder="동영상 URI 등록"> <input type="submit">
					<button type="submit" id="btnAddMovie">영화 등록하기</button>
				</div>
			</div>
		</div>
	</form>
<script>
$(function(){
	$("#fileupload").change(function(event){
		var x = URL.createObjectURL(event.target.files[0]);
		console.log(x);
		$("#upload-img").attr("src",x);
// 		var x = event.target.files[0].name; 이미지 이름 가져오기
// 		console.log(x);
// 			$(".filename").text(x);
	});
	$("#te").click(function(){
		var that = $(this);
		console.log(that);
		that.show();
	})
	
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
});
</script>
</body>
