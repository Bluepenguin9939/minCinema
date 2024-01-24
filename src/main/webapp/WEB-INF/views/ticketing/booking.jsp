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
    background-color: #444444;
}

.reserve-container>div{
	justify-content: center; /* 가운데 정렬 */
	display: flex; /**flex 적용**/
}

.next{
	/*justify-content: center; /* 가운데 정렬 */
	/*height: 97px; 
	width: 1018px; 
	display: flex; */
	background-color:#F2F5A9;
}

#go{
	height: 97px; 
	width: 848px; 
	display: flex; 
}

.reserve-container>div>div {
    border: 1px solid #dddddd;
    /*외각선 굵게만들어 구분하기*/
    background-color: #F2F5A9;
} 

.reserve-title { /*타이틀 상단제목 css*/
    border-bottom: 1px solid #dddddd;
    background-color: #444444;
    text-align: center;
    color: #dddddd;/*글자 색*/
    padding: 5px;
    font-size: 13px;
    font-weight: bold;
}

.movie-part {
    width: 300px; /*영화파트 너비*/
}

.theater-part {
    width: 264px; /*극장파트*/
}

.day-part {
   /* width: 91px; /*날짜파트*/
    width: 200px; /*날짜파트*/
}

.time-part {
    width: 350px; /*영화 시작시간*/
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
    height: 670px;
    overflow: scroll; /*스크롤바 생성*/
    overflow-x: hidden; /*x축 스크롤바 숨기기*/
	*/
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


.reserve-date { /*날짜 부분*/
    padding-top: 5px;
    /*display: flex;
    flex-direction: column;  /*아이템을 배치하리 세로열로*/
    align-items: center;
    height: 630px;
    overflow: scroll; /*스크롤바 생성*/
    overflow-x: hidden; /*x축 스크롤바 숨기기*/
}

.day{
	font-weight: bold;
	font-size:32px;
	text-align: center;
	
	cursor: pointer;
}

.day:hover{
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

.button{
	height: 100px;
	width: 100px;
}

</style>

<script>
$(function(){
	
	$(".movie-list").click(function(){
		
		var that = $(this);
		//기존선택사항 삭제
		var find = that.parent().find("[data-select='select']");
		
		find.removeAttr("data-select");
		find.css("background-color","#F2F5A9");
		find.css("color","black");
		
		//신규 선택사항
		console.log("find:", find);
		
		that.attr("data-select","select");
		that.addClass("")
		that.css("background-color","#444444");
		that.css("color","#dddddd");
		
		//var seat = that.attr("data-seat");
		var text = that.text();
		
		$("#movieName").text(text);
		
	});
	
	$(".day").click(function(){
		var that = $(this);
		
		var find = that.parent().find("[data-select='select']");
		
		find.removeAttr("data-select");
		find.css("background-color","#F2F5A9");
		find.css("color","black");
		
		//신규 선택사항
		console.log("find:", find);
		
		that.attr("data-select","select");
		that.addClass("")
		that.css("background-color","#444444");
		that.css("color","#dddddd");
		
		/////////
		var text1 = $("#date-month").text();
		var text = that.text();
		
		$("#dateText").text(text1+"."+text);
		
	});
	
	$(".times").click(function(){
		var that = $(this);
		
		var find = that.parent().find("[data-select='select']");
		
		find.removeAttr("data-select");
		find.css("background-color","#F2F5A9");
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
	
});
	
</script>
<div>
	<div class="reserve-container">
		
		<div>
	        <div class="movie-part">
	            <div class="reserve-title">영화</div>
	           <!--  <div class="sort-wrapper">
	                <div class="sort-rate sort-selected">예매율순</div>
	                <div class="sort-korean">가나다순</div>
	            </div> -->
	           
	            <div id="movie" class="movie-datas">
	            	<div class="movie-list" data-select="select">토이스토리4</div>
		            <div class="movie-list" >캐래비안의 해적</div>
		            <div class="movie-list" >괴물</div>
		            <div class="movie-list" >인디아나 존스 1000</div>
	            </div>
	            
	            
	        </div>
	        <!--  <div class="theater-part">
	            <div class="reserve-title">극장</div>
	            <div>사용안함</div>
	        </div>-->
	        <div class="day-part">
	            <div class="reserve-title">날짜</div>
	            <div id="date-month" class="rounded" 
	            	 style="font-weight: bold;
	            			background-color: #123499;
	            			color: white;
	            			font-size:25px;
	            			text-align: center;">2024.02</div>
	            <div id="date" class="reserve-date">
	            	
	            	<div class="day" >01</div>
	            	<div class="day" >02</div>
	            	<div class="day" >03</div>
	            	<div class="day" >04</div>
	            	<div class="day" >05</div>
	            	<div class="day" >06</div>
	            	<div class="day" >07</div>
	            	<div class="day" >08</div>
	            	<div class="day" >09</div>
	            	<div class="day" >10</div>
	            	<div class="day" >11</div>
	            	<div class="day" >12</div>
	            	<div class="day" >13</div>
	            	<div class="day" >14</div>
	            	<div class="day" >15</div>
	            	<div class="day" >16</div>
	            	<div class="day" >17</div>
	            </div>
	        </div>
	        <div class="time-part">
	            <div class="reserve-title">시간</div>
	            
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

	        </div>

    	</div>
    	
    	<div class="d-flex justify-content-center">
	    	<div class="next">
				<form id="go" name="go" action="/ticketing/seat" method="get">
					<div style="flex-grow: 1; font-weight: bold;">
						<div style="font-size: 20px;">영화 : <span id="movieName"></span></div>
						<div style="font-size: 20px;">날짜 : <span id="dateText"></span></div>
						<div style="font-size: 20px;">시간 : <span id="timesText"></span> </div>
					</div>
						
					<button class="btn btn-success" style="font-size:64px; 
										width: 383px">좌석배치</button>
				</form>
			</div>
    	</div>
    	
    	
    </div><!-- reverseContainer -->
    
</div>



<%@ include file="/WEB-INF/views/include/bottom.jsp" %>
