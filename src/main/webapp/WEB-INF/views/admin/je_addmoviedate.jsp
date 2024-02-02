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
<title>영화 일정 추가</title>

<style>

</style>

<script>

$(function(){
	
	$.post("/admin/movieTitleLists",function(rData){
		console.log("rData: ",rData);
		var movieList = rData;
		$.each(movieList,function(i,value){
			console.log("aa:",value.mov_title);
			$("#movieList").append("<option data-code='"+value.mov_code+"'" 
									+"data-releaseDate='"+value.mov_releaseDate+"'"
									+"value='"+value.mov_title+"'>"+value.mov_title+"</option>");
		});
		
	});
	
	$("#movieList").on("change",function(){
		var that = $(this);
		//console.log("tst:",that.find("option:selected").attr('data-code'));
		$(".screenManagements").empty(); //기존화면에 띄워져있는거 정리
		
		
	});
	
	$("#addDate").on("click",function(){
		
		$(".screenManagements").append("추가입니다.");
	});
	
});

</script>

</head>

<body>
	<div class="notice d-flex justify-content-center"> 
		<div style="width: 80%; display: flex;"
			class="flex-column">
			
			<div class="admin-top">
				<h2 class="admin-body">영화 날짜관리</h2>
			</div>
			
			<div class="d-flex">
				<div class="flex-column" style="width: 198px; height:680px; display: flex;">
					<div>
						<img alt="" src="/resources/img/moviedefault.jpg" id="">
					</div>
					<span class="text-center mt-3" style="font-size: 32px">영화 목록</span>
					
					<select class="form-control" id="movieList"></select>
					
				</div>
				
				<div class="border border-bottom-0 d-flex  flex-column" 
						style="flex-grow: 1; height:680px; display: flex;">
					
					<div class="bg-secondary text-center" 
						style="font-size: 30px; height:7%;">
						영화 상영일정
					</div>
					
					<div class="scroll_dateList" style="height:93%; ">
						<div class="screenManagements">
							<div class="d-flex flex-row justify-content-center 
											pt-1 pb-1 border border-left-0" 
												style="width: 100%; height: 8%">
								<span class="titleTexts text-center text-nowrap">날짜 : </span>
								<input type="date">
								<span class="titleTexts text-center text-nowrap">시간 : </span>
								<input type="time">
								<span class="titleTexts text-center text-nowrap">영화관 : </span>
								<select id="movieTheatherList">
									<option value="1관">1관</option>
									<option value="2관">2관</option>
									<option value="3관">3관</option>
									<option value="4관">4관</option>
									<option value="5관">5관</option>
									<option value="6관">6관</option>
									<option value="7관">7관</option>
								</select>
								
								<button class="btn btn-warning editBtn text-nowrap" type="button">수정</button>
								<button class="btn btn-danger deleteBtn text-nowrap" type="button">삭제</button>
							</div>
						</div>
						
						<div  class="d-flex justify-content-center pt-3">
							<button id="addDate" class="btn btn-primary btn-lg" type="button">추가</button>
						</div>
							
					</div>
					
				</div>
				<!-- <input type="text" id="getMovieData" placeholder="영화제목">
				<div class="profile-images" >
					<img alt="" src="/resources/img/moviedefault.jpg" id="upload-img">
				</div> -->
			</div>
			
			<div class="d-flex justify-content-end">
				<button class="mt-2 btn btn-success" style="font-size: 24px;" type="button">저장하기</button>
			</div>
			
		</div>
		
	</div>
	
	
	<!-- 칸나누기 -->
 	
	
	
</body>
