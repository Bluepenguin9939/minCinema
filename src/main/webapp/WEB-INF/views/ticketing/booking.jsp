<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/WEB-INF/views/include/top.jsp" %>

<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@40,600,0,0" />


<style>
.reserve-container {
    /*margin-top: 20px; /*마진달기*/
    justify-content: center; /* 가운데 정렬 */
    height: 805px; /*높이 800px*/
    /* border: 1px solid #dddddd; */
    background-color: gray;
}

.reserve-container>div{
	justify-content: center; /* 가운데 정렬 */
	display: flex; /**flex 적용**/
	
}

.select-part{
	height: 82%;
}

.send-part{
	height: 18%;
}


.send-main{
	/*display : flex; 
	/*justify-content-center */
	background-color:#AAAAAA;
	width: 930px;
}

#send-form{
	height: 100%; 
	width: 100%; 
	display: flex; 
}

.reserve-container>div>div {
    border: 1px solid #dddddd;
    /*외각선 굵게만들어 구분하기*/
    background-color: #AAAAAA;
} 


.movie-part {
    width: 380px; /*영화파트 너비*/
}

.theater-part {
    width: 150px; 극장파트
}

.day-part {
   /* width: 91px; /*날짜파트*/
    width: 200px; /*날짜파트*/
}

.time-part {
    width: 350px; /*영화 시작시간*/
}

.reserve-title { /*타이틀 상단제목 css*/
    border-bottom: 1px solid #dddddd;
    background-color: #444444;
    text-align: center;
    color: #dddddd;/*글자 색*/
    padding: 5px;
    font-size: 22px;
    font-weight: bold;
    
    height: 5%;
    
    display: flex;
    justify-content: center;
    align-items: center;
}


.movie-datas{
	padding-top: 5px;
    /*display: flex;
    flex-direction: column;  /*아이템을 배치하리 세로열로*/
    align-items: center;
    height: 95%;
    overflow: scroll; /*스크롤바 생성*/
    overflow-x: hidden; /*x축 스크롤바 숨기기*/
}

.movie-datas::-webkit-scrollbar{
    width: 15px;
}

.movie-datas::-webkit-scrollbar-thumb{
    background-color: #9b54ba;
    /* 스크롤바 둥글게 설정    */
    border-radius: 10px;
}

.movie-datas::-webkit-scrollbar-track{
    background-color: 	#e4e4f8;
}

.movie-list{
	font-weight: bold;
	/*justify-content: center;*/
	font-size: 25px;
	text-align: center;
}

.movie-list:hover{
	/*border-bottom: 1px solid #111111;*/
	background-color: #444444;
	
    color: #dddddd;/*글자 색*/
    cursor: pointer;
}


/*.date-month{
	height: 7%;
	display: flex;
    justify-content: center;
    align-items: center;
    
   	font-weight: bold;
	background-color: #123499;
	color: white;
	font-size:25px;
	text-align: center;
}*/

.reserve-date { /*날짜 부분*/
    padding-top: 5px;
    /*display: flex;
    flex-direction: column;  /*아이템을 배치하리 세로열로*/
    align-items: center;
    /*height: 630px;*/
    height: 95%;
    overflow: scroll; /*스크롤바 생성*/
    overflow-x: hidden; /*x축 스크롤바 숨기기*/
}

.reserve-date::-webkit-scrollbar{
    width: 15px;
}

.reserve-date::-webkit-scrollbar-thumb{
    background-color: #9b54ba;
    /* 스크롤바 둥글게 설정    */
    border-radius: 10px;
}

.reserve-date::-webkit-scrollbar-track{
    background-color: #e4e4f8;
}

.srceenDate{
	text-align: center;
}

.year-month{
	/*font-weight: bold;*/
	font-size:40px;
	margin-top: 5px;
}

.days{
	font-weight: bold;
	font-size:28px;
	/*text-align: center;*/
	
	cursor: pointer;
}

.days:hover{
	/*border-bottom: 1px solid #111111;*/
	background-color: #444444;
	
    color: #dddddd;/*글자 색*/
}

.time-data{
	padding-top: 5px;
    /*display: flex;
    flex-direction: column;  /*아이템을 배치하리 세로열로*/
    align-items: center;
    height: 95%;
    overflow: scroll; /*스크롤바 생성*/
    overflow-x: hidden; /*x축 스크롤바 숨기기*/
}

.time-data::-webkit-scrollbar{
    width: 15px;
}

.time-data::-webkit-scrollbar-thumb{
    background-color: #9b54ba;
    /* 스크롤바 둥글게 설정    */
    border-radius: 10px;
}

.time-data::-webkit-scrollbar-track{
    background-color: 	#e4e4f8;
}

.times{
	/*justify-content: center;*/
	font-size: 30px;
	font-weight: bold;
	text-align: center;
	cursor: pointer;
}

.times:hover{
	/*border-bottom: 1px solid #111111;*/
	background-color: #444444;
	
    color: #dddddd;/*글자 색*/
}

.sendBtn{
	font-size:64px; 
	height: 100%;
	width: 37%;
}

#prev_month,#next_month{
	cursor: pointer;
}

</style>

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
	
	
	/*$("#date-month").text(year+"."+ (todayMonth <=9 ? "0"+todayMonth : todayMonth) );*/
	/*현재월 기준*/
	
	function setMonth(year,month){
		
		//var month = startMvMonth <= 9 ? "0"+startMvMonth : startMvMonth;
		
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
			//monthdayMap.set(i,day);
			var dayStr = ( i <= 9 ? "0" + i : i );
			
			var dataDate = year+"-"+monthStr+"-"+dayStr;
			$(id).append(
					"<div class='days' id='"+i+"' data-date='"+dataDate+"'>"
						+"<span class='rounded-circle bg-light weekday' style='font-size:24px;'>"+wday+"</span>"+"&emsp;"
						+"<span class='bg-danger day' style='font-weight:normal;'>"+dayStr+"</span>"
					+"</span>"
			);
		}
	}
	
	//페이지 시작시 영화 리스트와 코드 받아와서 열 생성
	$.post("/ticketing/movieList",function(rData){
		console.log("rData: ",rData);
		if(rData != null){
			$.each(rData , function( index, value ) {
				//console.log( index + " : " + value.mov_code +":"+ value.mov_title );
				$(".movie-datas").append(
						"<div class='movie-list' data-movieCode='"+value.mov_code+"'>"+value.mov_title+"</div>"
				);
				
			});
		}
	});
	
	
	
	var mov_code;
	var dateCode;
	
	
	$(document).on("click",".movie-list",function(){//영화제목 클릭시
		
		var that = $(this);
		//기존선택사항 삭제
		var find = that.parent().find("[data-select='select']");
		
		find.removeAttr("data-select");
		find.css("background-color","#AAAAAA");
		find.css("color","black");
		
		$("#dateText").text("");
		$("#timesText").text("");
		$("#theaterText").text("");
		
		//신규 선택사항
		//console.log("find:", find);
		
		that.attr("data-select","select");
		that.css("background-color","#444444");
		that.css("color","#dddddd");
		
		//var seat = that.attr("data-seat");
		var text = that.text();
		
		$("#movieTitleText").text(text);
		
		$(".reserve-date").empty();
		$(".time-data").empty();
		
		mov_code = that.attr("data-movieCode");
		
		//
		var movieTitleData = {"mov_code" : mov_code};
		
		$.post("/ticketing/date",movieTitleData,function(rdata){
			//console.log("rData: ",rdata);
			//console.log("rData.length: ",rdata.length);
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
					//console.log("다름");	
					setMonth(startMvYear,startMvMonth);
					
					setDayandWeekday(startMvYear,startMvMonth,startMvday);
					///////
					setMonth(endMvYear,endMvMonth);
					
					setDayandWeekday(endMvYear,endMvMonth,1);
				}
				else{
					//console.log("동일");
					
					setMonth(startMvYear,startMvMonth);
					
					setDayandWeekday(startMvYear,startMvMonth,startMvday);
					
				}
				
				//var offset = $(offsetId).offset();
				//console.log("offset:",offset);
				//$("#date").animate({scrollTop: offset.top},0);
				
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
		
		//var find = that.parent().find("[data-select='select']");
		var find = $(".reserve-date").find("[data-select='select']");
		//이전 선택사항 삭제
		find.removeAttr("data-select");
		find.css("background-color","#AAAAAA");
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
		//console.log("dateData:",date);
		
		$.post("/ticketing/time",dateData,function(rdata){
			//console.log("rdata:",rdata);
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
			
				$(".time-data").append("<div class='times' data-select='unselect'>"
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
		
		find.removeAttr("data-select");
		find.css("background-color","#AAAAAA");
		find.css("color","black");
		
		//신규 선택사항
		console.log("find:", find);
		
		that.attr("data-select","select");
		that.css("background-color","#444444");
		that.css("color","#dddddd");
		
		//////
		//var text = that.text();
		var time = that.find("#time").text();
		var loc = that.find("#loc").text();
		
		$("#timesText").text(time);
		$("#theaterText").text(loc);
		
	});
	
	
	
	/*폼 전송버튼*/
	$(".sendBtn").click(function() {
		
		var movieTitleText = $("#movieTitleText").text();
		//
		var dateText = $("#dateText").text();
		//
		var timesText = $("#timesText").text();
		//
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
	        <!--  
	        <div class="theater-part">
	            <div class="reserve-title">
	            	<span class="material-symbols-outlined">
						movie
					</span>상영관
				</div>
	           	
	           	
	            <div id="theater" class="theater-datas">
	            	<div class="theater-list" >상영관A</div>
	            	<div class="theater-list" >상영관B</div>
	            	<div class="theater-list" >상영관C</div>
	            </div>
	            
	        </div>
			-->
	        <div class="day-part">
	            <div class="reserve-title">
	            	<span class="material-symbols-outlined">
						calendar_month
					</span>날짜
				</div>
				<!--  
	            <div class="rounded date-month">
	            	<span class="material-symbols-outlined" id="prev_month" style="font-size: 36px;">
						chevron_left
					</span>
	            	<div id="date-month"></div>
	            	<span class="material-symbols-outlined" id="next_month" style="font-size: 36px;">
						chevron_right
					</span>
	            </div>
	            -->
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
					<div style="flex-grow: 1; font-weight: bold;">
						<div style="font-size: 24px;">영화 : <span id="movieTitleText"></span></div>
						<div style="font-size: 24px;">날짜 : <span id="dateText"></span></div>
						<div style="font-size: 24px;">시간 : <span id="timesText"></span> </div>
						<div style="font-size: 24px;">상영관 : <span id="theaterText"></span> </div>
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
