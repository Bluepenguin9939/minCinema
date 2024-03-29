<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/WEB-INF/views/include/top.jsp" %>

<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@40,600,0,0" />
<link rel="stylesheet" href="/resources/css/ticketing/booking.css?after" type="text/css">

<script>
$(function(){
	
	var weekday = new Array(7);
		weekday[0] = "일";
		weekday[1] = "월";
		weekday[2] = "화";
		weekday[3] = "수";
		weekday[4] = "목";
		weekday[5] = "금";
		weekday[6] = "토";

	var now = new Date();
	var todayYear = now.getFullYear();
	var todayMonth = now.getMonth()+1;
	var todayDate = now.getDate();
	var dates = new Date(todayYear,todayMonth,0).getDate();
	
	
	/*현재월 기준*/
	
	function setMonth(year,month){
		
		$(".reserve-date").append(
				"<div class = 'srceenDate'>"
					+"<div id='"+year+(month <= 9 ? "0"+month : month)+"' class='year-month'>"
						+"<span class='bg-info border border-dark'>"+year+"-"+(month <= 9 ? "0"+month : month)+"</span>"
					+"</div>"
				+"</div>"
		);
		
	}	
	
	function setDayandWeekday(year,month,startMvday){
		
		var monthStr = (month <= 9 ? "0"+month : month);
		var id = "#"+year+monthStr;
		var dates = new Date(year , month , 0).getDate(); //month 는 +1한 상태 기록상 현재달 임(1~12)
		
		
		for(var i=startMvday; i<=dates; i++){
			
			//해당 일의 요일 구하기
			var wday = weekday[new Date(year,month-1,i).getDay()];//년, 기준달-1(0~11), 일
			var dayStr = ( i <= 9 ? "0" + i : i );
			
			var dataDate = year+"-"+monthStr+"-"+dayStr;
			$(id).append(
					"<div class='days' id='"+i+"' data-select='unselect' data-date='"+dataDate+"'>"
						+"<span class='rounded-circle bg-light weekday' style='font-size:24px;'>"+wday+"</span>"+"&emsp;"
						+"<span class='rounded-circle bg-danger day' style='font-weight:normal;'>"+dayStr+"</span>"
					+"</span>"
			);
		}
	}
	
	//페이지 시작시 영화 리스트와 코드 받아와서 열 생성
	$.post("/ticketing/movieList",function(rData){

		if(rData != null){
			$.each(rData , function( index, value ) {
				$(".movie-datas").append(
						"<div class='movie-list' data-select='unselect' data-movieCode='"+value.mov_code+"'>"+value.mov_title+"</div>"
				);
				
			});
			
			var url = new URL(window.location.href);
			var moviecode = url.searchParams.get("mov_code");
			
			if(moviecode != null){
				$(".movie-datas").find("[data-moviecode='"+moviecode+"']").trigger("click");
			}
			
		}
	});
	
	/////////마우스 호버 이벤트
	$(document).on("mouseenter","[data-select='unselect']",function(){
		var that = $(this);
    	that.css("background-color","#444444");
    	that.css("color","#dddddd");
	});
	$(document).on("mouseleave","[data-select='unselect']",function(){
		var that = $(this);
    	that.css("background-color","#F6E3CE");
    	that.css("color","black");
		
	});
	    
	
	var mov_code;
	var dateCode;
	
	
	$(document).on("click",".movie-list",function(){//영화제목 클릭시
		
		var that = $(this);
		//기존선택사항 삭제
		var find = that.parent().find("[data-select='select']");
		
		find.attr("data-select","unselect");
		find.css("background-color","#F6E3CE");
		find.css("color","black");
		
		$("#dateText").text("");
		$("#timesText").text("");
		$("#theaterText").text("");
		
		//신규 선택사항
		that.attr("data-select","select");
		that.css("background-color","#444444");
		that.css("color","#dddddd");
		
		var text = that.text();
		
		$("#movieTitleText").text(text);
		
		$(".reserve-date").empty();
		$(".time-data").empty();
		
		mov_code = that.attr("data-movieCode");
		
		var movieTitleData = {"mov_code" : mov_code};
		
		$.post("/ticketing/date",movieTitleData,function(rdata){

			if(rdata.length != 0 ){
				var startDate = rdata[0].split("-");
				var startMvYear = parseInt(startDate[0]);
				var startMvMonth = parseInt(startDate[1]);
				var startMvday = parseInt(startDate[2]);
				
				var endDate = rdata[rdata.length-1].split("-");
				var endMvYear = parseInt(endDate[0]);
				var endMvMonth = parseInt(endDate[1]);
				var endMvday = parseInt(endDate[2]);

				
				if(startMvYear != endMvYear || startMvMonth != endMvMonth){

					setMonth(startMvYear,startMvMonth);
					
					setDayandWeekday(startMvYear,startMvMonth,startMvday);

					setMonth(endMvYear,endMvMonth);
					
					setDayandWeekday(endMvYear,endMvMonth,1);
				}
				else{
					
					setMonth(startMvYear,startMvMonth);
					
					setDayandWeekday(startMvYear,startMvMonth,startMvday);
					
				}
				
				
			}
			
			
		});
		
		
		
	});/////////////////////////////////////////////////////
	
	$(document).on("click",".days",function(){//날짜 클릭시
		
		$(".times").remove();
		//이전 시간파트 삭제
		
		$("#timesText").text("");
		$("#theaterText").text("");
		//밑 텍스트 삭제
		
		var that = $(this);
		
		var find = $(".reserve-date").find("[data-select='select']");
		//이전 선택사항 삭제
		find.attr("data-select","unselect");
		find.css("background-color","#F6E3CE");
		find.css("color","black");
		
		//신규 선택사항
		
		that.attr("data-select","select");
		that.css("background-color","#444444");
		that.css("color","#dddddd");
		
		/////////하단 텍스트
		var date = that.attr("data-date");
		$("#dateText").text(date);
		
		var dateData = {"mov_screen_date": date,
						"mov_code": mov_code};
		
		$.post("/ticketing/time",dateData,function(rdata){

			$.each(rdata, function (index, je_MovieDateInfoDTO) {
				var nightAndDay;
				var am_pm;
				var timeHS = je_MovieDateInfoDTO.mov_start_time.split(":");	
				
				if(timeHS[0] >= 6 && timeHS[0]<18){ //낮밤 구분
					nightAndDay = "clear_day";
				}else{
					nightAndDay = "clear_night";
				}
				
				if(timeHS[0] >= 12 && timeHS[0]<24){ //am,pm 구분
					am_pm = "pm";
				}else{
					am_pm = "am";
				}
			
				$(".time-data").append("<div data-select='unselect' class='times' data-select='unselect'>"
		            	+"<span class='material-symbols-outlined'>"
							+nightAndDay
						+"</span>"
						+"<span id='time'>"+je_MovieDateInfoDTO.mov_start_time+"("+am_pm+")"+"</span>"
						+"&nbsp;"
						+"<span id='loc'>"+je_MovieDateInfoDTO.mov_theater+"</span>"
	   			+"</div>");
			});
			
		});
		
		
	});
	
	$(document).on("click",".times",function(){
	
		var that = $(this);
		
		var find = that.parent().find("[data-select='select']");
		
		find.attr("data-select","unselect");
		find.css("background-color","#F6E3CE");
		find.css("color","black");
		
		//신규 선택사항
		
		that.attr("data-select","select");
		that.css("background-color","#444444");
		that.css("color","#dddddd");
		
		//////
		var time = that.find("#time").text();
		var loc = that.find("#loc").text();
		
		$("#timesText").text(time);
		$("#theaterText").text(loc);
		
	});
	
	
	
	/*폼 전송버튼*/
	$(".sendBtn").click(function() {
		
		var movieTitleText = $("#movieTitleText").text();
		var dateText = $("#dateText").text();
		var timesText = $("#timesText").text();
		var theaterText = $("#theaterText").text();
		
		if(movieTitleText=="" || dateText=="" || timesText=="" || theaterText==""){
			alert("빈값 존재");
		}
		else{
			$("[name=movieTitle]").val(movieTitleText);
			$("[name=movieDate]").val(dateText);
			$("[name=movieTime]").val(timesText);
			$("[name=movieTheater]").val(theaterText);
			
			$("#send-form").submit();
		}

	});/////send
	
});
	
</script>

<div>
	<div class="reserve-container">
		
		<div class="select-part">
	        <div class="movie-part">
	            <div class="reserve-title">
	            	<span class="material-symbols-outlined">
						movie
					</span>영화
				</div>
	           
	            <div id="movie" class="movie-datas">
	            	
	            </div>
	            
	            
	        </div>
	        
	        <div class="day-part">
	            <div class="reserve-title">
	            	<span class="material-symbols-outlined">
						calendar_month
					</span>날짜
				</div>
				
	            <div id="date" class="reserve-date">
					
					
					
	            </div>
	        </div>
	        
	        
	        <div class="time-part">
	            <div class="reserve-title">
	            	<span class="material-symbols-outlined">
						schedule
					</span>시간
				</div>
	            <div class="time-data">
	            	
	            </div>
	        </div>

    	</div>
    	
    	<div class="send-part">
	    	<div class="send-main">
				<form id="send-form" name="send-form" action="/ticketing/seat" method="get">
					<div class="book-info">
						<div class="text-nowrap" style="font-size: 24px;">영화 : <span id="movieTitleText"></span></div>
						<div class="text-nowrap" style="font-size: 24px;">날짜 : <span id="dateText"></span></div>
						<div class="text-nowrap" style="font-size: 24px;">시간 : <span id="timesText"></span> </div>
						<div class="text-nowrap" style="font-size: 24px;">상영관 : <span id="theaterText"></span> </div>
					</div>
					<input type="hidden" name="movieTitle">
					<input type="hidden" name="movieDate">
					<input type="hidden" name="movieTime">
					<input type="hidden" name="movieTheater">
					<button class="sendBtn btn btn-success" type="button">좌석배치</button>
				</form>
			</div>
    	</div>
    	
    	
    </div><!-- reverseContainer -->
    
</div>



<%@ include file="/WEB-INF/views/include/bottom.jsp" %>
