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
		var movieList = rData;
		$.each(movieList,function(i,value){
			$("#movieList").append("<option data-code='"+value.mov_code+"'" 
									+"data-releaseDate='"+value.mov_releaseDate+"'"
									+"data-runtime='"+value.mov_runtime+"'"
									+"value='"+value.mov_title+"'>"+value.mov_title+"</option>");
		});
		
		//시작시 맨처음목록 강제적용
		$("#movieList").val(movieList[0].mov_title).trigger("change");
		
	});
	
	$("#movieList").on("change",function(){
		var that = $(this);
		
		$(".screenManagements").empty(); //기존화면에 띄워져있는거 정리
		
		var insertCode = $("#movieList").find("option:selected").attr("data-code");
		
		var codeData = {"mov_code" : insertCode};
		
		$.post("/admin/movieDates",codeData,function(rData){
			
			$.each(rData, function(index, value) {
				
					$(".screenManagements").append(
						"<div data-dateCode = '"+value.mov_date_code+"' class='d-flex flex-row pt-1 pb-1 border border-left-0' style='width: 100%; height: 8%'>"
							+"<span class='titleTexts text-center text-nowrap'>날짜 : </span>"
							+"<input type='date' class='movieDate' value='"+value.mov_screen_date+"'>"
							+"<span class='titleTexts text-center text-nowrap'>시간 : </span>"
							+"<input type='time' class='movieTime' value='"+value.mov_start_time+"'>"
							+"<span class='titleTexts text-center text-nowrap'>영화관 : </span>"
							+"<select id='movieTheatherList' class='movieTheatherLists'>"
								+"<option value='1관'>1관</option>"
								+"<option value='2관'>2관</option>"
								+"<option value='3관'>3관</option>"
								+"<option value='4관'>4관</option>"
								+"<option value='5관'>5관</option>"
								+"<option value='6관'>6관</option>"
								+"<option value='7관'>7관</option>"
							+"</select>"
									
							+"<button class='btn btn-warning editBtn text-nowrap' type='button'>수정</button>"
							+"<button class='btn btn-danger deleteBtn text-nowrap' type='button'>삭제</button>"
						+"</div>");
					
				var lastDate = $(".screenManagements > div").last();
			
				lastDate.find(".movieTheatherLists")
						.val(value.mov_theater).prop("selected",true);

			});
			
			
		});
		
		
		$.post("/admin/movieImage",codeData,function(rData){//이미지 적용
			
			var url = rData;
			$.each(rData,function(i,value){
				//var upload_path = rData.upload_path;
				if( value.upload_path.indexOf("/upload/poster/") != -1  ){
					var src="/display?fileName="+value.upload_path+"/"+value.file_name;
					$("#poster").attr("src", src);
				}
				
			});
		});
		
		
	});/////////////////////////////////////
	
	$("#addDate").on("click",function(){
		
		//$(".screenManagements").append("추가입니다.");
		$(".screenManagements").append(
			"<div class='d-flex flex-row pt-1 pb-1 border border-left-0' style='width: 100%; height: 8%'>"
				+"<span class='titleTexts text-center text-nowrap'>날짜 : </span>"
				+"<input type='date' class='movieDate'>"
				+"<span class='titleTexts text-center text-nowrap'>시간 : </span>"
				+"<input type='time' class='movieTime' >"
				+"<span class='titleTexts text-center text-nowrap'>영화관 : </span>"
				+"<select id='movieTheatherList' class='movieTheatherLists'>"
					+"<option value='1관'>1관</option>"
					+"<option value='2관'>2관</option>"
					+"<option value='3관'>3관</option>"
					+"<option value='4관'>4관</option>"
					+"<option value='5관'>5관</option>"
					+"<option value='6관'>6관</option>"
					+"<option value='7관'>7관</option>"
				+"</select>"
						
				+"<button class='btn btn-warning editBtn text-nowrap' type='button'>수정</button>"
				+"<button class='btn btn-danger deleteBtn text-nowrap' type='button'>삭제</button>"
				+"<button class='btn btn-success insertBtn text-nowrap' type='button'>저장하기</button>"
			+"</div>");
		
	}); ///////////////////
	
	$(document).on("click",".editBtn",function(){//수정버튼 클릭시
		
		var that = $(this);
		var that_p = that.parent();
		
		var updateDate = that_p.find(".movieDate").val();
		var updateTime = that_p.find(".movieTime").val();
		
		var updateTheater = that_p.find(".movieTheatherLists option:selected").val();
		var updateTitle = $("#movieList").find("option:selected").text();
		var updateCode = $("#movieList").find("option:selected").attr("data-code");
		
		var updateDateCode = that_p.attr("data-dateCode");
		
		//////상영일 과 비교
        var updateDateArr = updateDate.split('-');
        //console.log("tst:",that.find("option:selected").attr('data-releasedate'));
        var releaseDate = $("#movieList").find("option:selected").attr('data-releasedate'); //2017-12-09
        var releaseDateArr = releaseDate.split('-');
                 
        var updateDateCompare = new Date(updateDateArr[0], parseInt(updateDateArr[1])-1, updateDateArr[2]);
        var releaseDateCompare = new Date(releaseDateArr[0], parseInt(releaseDateArr[1])-1, releaseDateArr[2]);
         
        if(updateDateCompare.getTime() < releaseDateCompare.getTime()) {
             
            alert("상영일은 "+releaseDate+" 이후입니다.");
             
            return;
        }
		
		/////엔드타임 구하기
		var runtime = $("#movieList").find("option:selected").attr("data-runtime");
		//var runtime = 53; test
		
		var hour = parseInt(runtime / 60);
		var min = runtime % 60;
	
		 
		var update_hour_min = updateTime.split(":");
		var endHour = parseInt(update_hour_min[0])+hour;
		var endMin = parseInt(update_hour_min[1])+min;
		
		if(endMin >= 60){
			endMin = endMin-60;
			endHour++;
		}
		
		var updateEndTime = (endHour < 10 ? "0"+endHour : endHour) + ":" + (endMin < 10 ? "0"+endMin : endMin);
		
		var movieDateInfoData = {
				"mov_date_code" : updateDateCode,
				"mov_code" :  updateCode,
				"mov_title" : updateTitle,
				"mov_screen_date" : updateDate, 
				"mov_start_time" : updateTime,
				"mov_end_time" : updateEndTime,
				"mov_theater" : updateTheater
		};
		
		$.post("/admin/editMovieDate",movieDateInfoData,function(rData){
			
			if(rData == "true"){
				alert("수정완료");
			}
			else if(rData == "false"){
				alert("해당시간에 다른 영화가 이미 상영중입니다.");
			}
			
		});
		
		
	});//////////////////////////////////////////
	
	$(document).on("click",".deleteBtn",function(){//삭제버튼 클릭시
		
		var that = $(this);
		var that_p = that.parent();
		//console.log("이건 삭제:",that.parent());
		var dateCode = that_p.attr("data-dateCode");
		var deleteData = {"mov_date_code" : dateCode}
		
		if(dateCode == "" || dateCode==null){ //아무것도 입력하지 않았을때
			
			that.parent().remove();
		}
		else{
			$.post("/admin/removeMovieDate",deleteData,function(rData){
				if(rData == "true"){
					alert("삭제성공");
					that.parent().remove();
				}
				else if(rData = "false"){
					alert("삭제실패");
				}
				
			});
		}
			
		
		
	});////////////////////////////////////////////
	
	$(document).on("click",".insertBtn",function(){//저장버튼
		
		var that = $(this);
		var that_p = that.parent();
		//console.log("이건 삭제:",that.parent());
		
		var insertDate = that_p.find(".movieDate").val();
		var insertTime = that_p.find(".movieTime").val();
		//console.log(insertDate);
		//console.log(insertTime);
		
		var insertTheater = that_p.find(".movieTheatherLists option:selected").val();
		//console.log(insertTheater);
		var insertTitle = $("#movieList").find("option:selected").text();
		var insertCode = $("#movieList").find("option:selected").attr("data-code");
		
		//////상영일 과 비교
        var insertDateArr = insertDate.split('-');
        var releaseDate = $("#movieList").find("option:selected").attr('data-releasedate'); //2017-12-09
        var releaseDateArr = releaseDate.split('-');
                 
        var insertDateCompare = new Date(insertDateArr[0], parseInt(insertDateArr[1])-1, insertDateArr[2]);
        var releaseDateCompare = new Date(releaseDateArr[0], parseInt(releaseDateArr[1])-1, releaseDateArr[2]);
         
        if(insertDateCompare.getTime() < releaseDateCompare.getTime()) {
             
            alert("상영일은 "+releaseDate+" 이후입니다.");
             
            return;
        }
		///////////////
		
		
		var runtime = $("#movieList").find("option:selected").attr("data-runtime");
		
		//var runtime = 53; test
		
		var hour = parseInt(runtime / 60);
		var min = runtime % 60;
	
		var insert_hour_min = insertTime.split(":");
		var endHour = parseInt(insert_hour_min[0])+hour;
		var endMin = parseInt(insert_hour_min[1])+min;
		
		if(endMin >= 60){
			endMin = endMin-60;
			endHour++;
		}
		
		var insertEndTime = (endHour < 10 ? "0"+endHour : endHour) + ":" + (endMin < 10 ? "0"+endMin : endMin);
		
		var movieDateInfoData = {
				"mov_code" :  insertCode,
				"mov_title" : insertTitle,
				"mov_screen_date" : insertDate, 
				"mov_start_time" : insertTime,
				"mov_end_time" : insertEndTime,
				"mov_theater" : insertTheater
		};
		
		
		$.post("/admin/addMovieDate",movieDateInfoData,function(rData){
			
			
			if(rData == "false0"){
				alert("해당시간때에 다른 영화가 이미 상영중입니다.");
			}
			else if(rData == "false1"){
				alert("저장실패");
			}
			else{
				that.remove();
				that_p.attr("dateCode",rData);
				alert("저장완료");
			}
			
		});
		

	});////////////////////////////////////////////////////
	
});

</script>

</head>

<body>
	<div class="pt-5 notice d-flex justify-content-center"> 
		<div style="width: 70%; display: flex;"
			class="flex-column">
			
			<div class="admin-top">
				<h2 class="admin-body">영화 날짜관리</h2>
			</div>
			
			<div class="d-flex">
				<div class="flex-column border " style="width: 198px; height:680px; display: flex;">
					<div>
						<img alt="" src="/resources/img/moviedefault.jpg" id="poster">
					</div>
					<span class="text-center mt-3" style="font-size: 32px">영화 목록</span>
					
					<select class="form-control" id="movieList"></select>
					
				</div>
				
				<div class="border  d-flex  flex-column" 
						style="flex-grow: 1; height:680px; display: flex;">
					
					<div class="bg-secondary text-center" 
						style="font-size: 30px; height:7%;">
						영화 상영일정
					</div>
					
					<div class="scroll_dateList" style="height:93%; ">
						<div class="screenManagements">
							<!--  
							<div class="d-flex flex-row 
											pt-1 pb-1 border border-left-0 " 
												style="width: 100%; height: 8%">
								<span class="titleTexts text-center text-nowrap">날짜 : </span>
								<input type="date" class="movieDate">
								<span class="titleTexts text-center text-nowrap">시간 : </span>
								<input type="time" class="movieTime" >
								<span class="titleTexts text-center text-nowrap">영화관 : </span>
								<select id="movieTheatherList" class="movieTheatherLists">
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
							-->
						</div>
						
						<div  class="d-flex justify-content-center pt-3">
							<button id="addDate" class="btn btn-primary" type="button">추가</button>
						</div>
							
					</div>
					
				</div>
				
			</div>
			
			<div class="d-flex justify-content-end">
				
			</div>
			
		</div>
		
	</div>
	
	
	<!-- 칸나누기 -->
 	
	
	
</body>
