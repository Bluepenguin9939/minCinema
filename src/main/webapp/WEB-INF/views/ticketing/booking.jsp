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
	height: 85%;
}

.send{
	height: 15%;
}


.next{

	background-color:#AAAAAA;
	width: 930px;
}

#go{
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
    width: 360px; /*영화파트 너비*/
}

/*.theater-part {
    width: 264px; 극장파트
}*/

.day-part {
   /* width: 91px; /*날짜파트*/
    width: 210px; /*날짜파트*/
}

.time-part {
    width: 360px; /*영화 시작시간*/
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

.sort-wrapper { /* 예매율순/가나다순 부분*/
    margin: 10px 6px 6px 10px;
    /* padding: 3px; */
    display: flex;
    border-bottom: 1px solid #dddddd;
    font-size: 12px;
}

.sort-wrapper>div {
    padding: 3px;
}

.sort-wrapper>div:hover { /*hover -> 마우스 커서를 올렸을때 적용하는 스타일*/
    border-bottom: 1px solid #111111; /*아래에 굵은 하단선 보이게함*/
}

.sort-selected { /*예매율순 부분: 기본선택시*/
    font-weight: bold;
    border-bottom: 1px solid #111111;
}

.sort-korean { /*가나다순 부분 영역*/
    margin-left: 6px;
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
	font-size: 22px;
	text-align: center;
}

.movie-list:hover{
	/*border-bottom: 1px solid #111111;*/
	background-color: #444444;
	
    color: #dddddd;/*글자 색*/
    cursor: pointer;
}

.date-month{
	height: 7%;
	display: flex;
    justify-content: center;
    align-items: center;
    
   	font-weight: bold;
	background-color: #123499;
	color: white;
	font-size:25px;
	text-align: center;
}

.reserve-date { /*날짜 부분*/
    padding-top: 5px;
    /*display: flex;
    flex-direction: column;  /*아이템을 배치하리 세로열로*/
    align-items: center;
    /*height: 630px;*/
    height: 88%;
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

.days{
	font-weight: bold;
	font-size:32px;
	text-align: center;
	
	cursor: pointer;
}

.days:hover{
	/*border-bottom: 1px solid #111111;*/
	background-color: #444444;
	
    color: #dddddd;/*글자 색*/
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
	width: 39%;
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
	var year = now.getFullYear();
	var todayMonth = now.getMonth()+1;
	var dates = new Date(year,todayMonth,0).getDate();
	
	var monthdayMap = new Map();
	
	$("#date-month").text(year+"."+ (todayMonth <=9 ? "0"+todayMonth : todayMonth) );

	
	function getDayAndWeekday(year,month){
		monthdayMap.clear();
		$(".reserve-date").empty();
		var dates = new Date(year,month,0).getDate(); /*month 는 +1한 상태 기록상 현재달 임(1~12)*/

		for(var i=1;i<=dates;i++){
			
			var day = weekday[new Date(year,month-1,i).getDay()]//년, 기준달-1(0~11), 일
			monthdayMap.set(i,day);
			$(".reserve-date").append("<div class='days'>"
										+"<span class='rounded-circle bg-light weekday' style='font-size:24px;'>"+day+"</span>"+"&nbsp&nbsp&nbsp&nbsp&nbsp"
										+"<span class='bg-danger day' style='font-weight:normal;'>"+( i <= 9 ? "0" + i : i )+"</span>"
										+"</div>");
		}
		console.log("monthdayMap:",monthdayMap);
	}
	
	
	$(document).on("click",".movie-list",function(){
	//$(".movie-list").click(function(){
		
		var that = $(this);
		//기존선택사항 삭제
		var find = that.parent().find("[data-select='select']");
		
		find.removeAttr("data-select");
		find.css("background-color","#AAAAAA");
		find.css("color","black");
		
		$("#dateText").text("");
		$("#timesText").text("");
		
		//신규 선택사항
		console.log("find:", find);
		
		that.attr("data-select","select");
		that.addClass("")
		that.css("background-color","#444444");
		that.css("color","#dddddd");
		
		//var seat = that.attr("data-seat");
		var text = that.text();
		
		$("#movieTitleText").text(text);
		//console.log("tt:",$("[name=sendMovie]").val());
		
		getDayAndWeekday(year,todayMonth);
		
	});
	
	//$(".day").click(function(){
	$(document).on("click",".days",function(){
		
		
		$(".times").remove();
		$("#timesText").text("");
		
		var that = $(this);
		//console.log("클릭:",that.find(".day").text());
		//console.log("클릭:",that.find(".weekday").text());
		//console.log("클릭");
		
		var find = that.parent().find("[data-select='select']");
		
		find.removeAttr("data-select");
		find.css("background-color","#AAAAAA");
		find.css("color","black");
		
		//신규 선택사항
		//console.log("find:", find);
		
		that.attr("data-select","select");
		that.addClass("")
		that.css("background-color","#444444");
		that.css("color","#dddddd");
		
		/////////
		var text1 = $("#date-month").text();
		var text2 = that.find(".day").text();
		
		var text3 = text1+"."+text2+"("+that.find(".weekday").text()+")";
		
		$("#dateText").text(text3);
		
		var testArray = ["05:30","11:00","12:00","13:00","14:30","17:00","19:30","21:00"];
		console.log("testArray:",testArray);
		
		$.each(testArray, function (index, testI) {
			var nightAndDay;
			var am_pm;
			var timeHS = testI.split(":");	
			
			if(timeHS[0] >= 6 && timeHS[0]<18){ /*낮밤 구분*/
				nightAndDay = "clear_day";
			}else{
				nightAndDay = "clear_night";
				
			}
			
			if(timeHS[0] >= 12 && timeHS[0]<24){ /*am,pm 구분*/
				am_pm = "pm";
			}else{
				am_pm = "am";
			}
		
			$(".time-part").append("<div class='times' data-select='unselect'>"
	            	+"<span class='material-symbols-outlined'>"
						+nightAndDay
					+"</span>"
					+"<span id='time'>"+testI+"("+am_pm+")"+"</span>"
   			+"</div>");
		});
		
		/*for(var i=1;i<=ㅇㅇㅇ;i++){
			
			$(".time-part").append("<div class='times' data-select='unselect'>"
						            	+"<span class='material-symbols-outlined'>"
											+"clear_day"
										+"</span>"
										+"<span id='time'>"+"11:00(am)"+"</span>"
					   			+"</div>");
		//}*/
		
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
		that.addClass("")
		that.css("background-color","#444444");
		that.css("color","#dddddd");
		
		//////
		var text = that.text();
		var text2 = that.find("#time").text();
		
		$("#timesText").text(text2);
		
	});
	
	var currentMonth = todayMonth;
	var currentYear = year;
	
	/**다음달*/
	$("#next_month").click(function(){
		if(currentMonth==12){
			currentMonth = 1;
			currentYear++;
		}else{
			currentMonth++;
		}
		
		$("#date-month").text(currentYear+"."+ (currentMonth <=9 ? "0"+currentMonth : currentMonth) );
		getDayAndWeekday(currentYear,currentMonth);
		console.log("다음");
	});
	/*이전달*/
	$("#prev_month").click(function(){
		if(currentMonth=1){
			currentMonth = 12;
			currentYear--;
		}else{
			currentMonth--;
		}
		
		$("#date-month").text(currentYear+"."+ (currentMonth <=9 ? "0"+currentMonth : currentMonth) );
		getDayAndWeekday(currentYear,currentMonth);
		console.log("이전");
	});
	
	/*폼 전송버튼*/
	$(".sendBtn").click(function() {
		
		var movieTitleText = $("#movieTitleText").text();
		
		//
		var dateText = $("#dateText").text();
		
		//
		var timesText = $("#timesText").text();
		
		
		
		if(movieTitleText=="" || dateText=="" || timesText==""){
			alert("빈값 존재");
		}
		else{
			$("[name=movieTitle]").val(movieTitleText);
			$("[name=movieDate]").val(dateText);
			$("[name=movieTime]").val(timesText);
			
			$("#go").submit();
		}
		
		
		
		
	});
	
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
	            	<div class="movie-list" data-select="select">토이스토리4</div>
		            <div class="movie-list" >캐래비안의 해적</div>
		            <div class="movie-list" >괴물</div>
		            <div class="movie-list" >인디아나 존스 1000</div>
	            </div>
	            
	            
	        </div>

	        <div class="day-part">
	            <div class="reserve-title">
	            	<span class="material-symbols-outlined">
						calendar_month
					</span>날짜
				</div>
				
	            <div class="rounded date-month">
	            	<span class="material-symbols-outlined" id="prev_month" style="font-size: 36px;">
						chevron_left
					</span>
	            	<div id="date-month"></div>
	            	<span class="material-symbols-outlined" id="next_month" style="font-size: 36px;">
						chevron_right
					</span>
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
	            <!--  
	            <div class="times" data-select="unselect">
	            	<span class="material-symbols-outlined">
						clear_day
					</span>
					<span id="time">11:00(am)</span>
	            </div>
	            
	            <div class="times" data-select="unselect">
	            	<span class="material-symbols-outlined">
						clear_day
					</span>
					<span id="time">13:30(pm)</span>
	            </div>
	           
	           	<div class="times" data-select="unselect">
	            	<span class="material-symbols-outlined">
						clear_day
					</span>
					<span id="time">17:30(pm)</span>
	            </div>
	           	
	            <div class="times" data-select="unselect">
	            	<span class="material-symbols-outlined">
						clear_night
					</span>
					<span id="time">20:30(pm)</span>
				</div>
				
				<div class="times" data-select="unselect">
	            	<span class="material-symbols-outlined">
						clear_night
					</span>
					<span id="time">24:00(am)</span>
				</div>
	           
	           	<div class="times" data-select="unselect">
	            	<span class="material-symbols-outlined">
						clear_night
					</span>
					<span id="time">02:30(am)</span>
				</div>
				-->
	        </div>

    	</div>
    	
    	<div class="d-flex justify-content-center send">
	    	<div class="next">
				<form id="go" name="go" action="/ticketing/seat" method="get">
					<div style="flex-grow: 1; font-weight: bold;">
						<div style="font-size: 24px;">영화 : <span id="movieTitleText"></span></div>
						<div style="font-size: 24px;">날짜 : <span id="dateText"></span></div>
						<div style="font-size: 24px;">시간 : <span id="timesText"></span> </div>
					</div>
					<input type="hidden" name="movieTitle">
					<input type="hidden" name="movieDate">
					<input type="hidden" name="movieTime">
					<button class="sendBtn btn btn-success" type="button">좌석배치</button>
				</form>
			</div>
    	</div>
    	
    	
    </div><!-- reverseContainer -->
    
</div>



<%@ include file="/WEB-INF/views/include/bottom.jsp" %>
