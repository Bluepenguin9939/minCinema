<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/WEB-INF/views/include/top.jsp" %>

<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@40,600,0,0" />

<script>
	
	
</script>
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
	width: 1016px; 
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
    width: 284px; /*영화파트 너비*/
}

.theater-part {
    width: 264px; /*극장파트*/
}

.day-part {
   /* width: 91px; /*날짜파트*/
    width: 350px; /*날짜파트*/
}

.time-part {
    width: 384px; /*영화 시작시간*/
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
	/*justify-content: center;*/
	font-size: 20px;
	text-align: center;
}

.movie-list:hover{
	/*border-bottom: 1px solid #111111;*/
	background-color: #444444;
	
    color: #dddddd;/*글자 색*/
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
	font-size:18px;
	text-align: center;

}

.day:hover{
	/*border-bottom: 1px solid #111111;*/
	background-color: #444444;
	
    color: #dddddd;/*글자 색*/
}

.times{
	/*justify-content: center;*/
	font-size: 30px;
	text-align: center;
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
<div>
	<div class="reserve-container">
		
		<div>
	        <div class="movie-part">
	            <div class="reserve-title">영화</div>
	           <!--  <div class="sort-wrapper">
	                <div class="sort-rate sort-selected">예매율순</div>
	                <div class="sort-korean">가나다순</div>
	            </div> -->
	           
	            <div class="movie-datas">
	            	<div class="movie-list">토이스토리4</div>
		            <div class="movie-list">캐래비안의 해적</div>
		            <div class="movie-list">괴물</div>
		            <div class="movie-list">인디아나 존스 1000</div>
	            </div>
	            
	            
	        </div>
	        <!--  <div class="theater-part">
	            <div class="reserve-title">극장</div>
	            <div>사용안함</div>
	        </div>-->
	        <div class="day-part">
	            <div class="reserve-title">날짜</div>
	            <div style="font-weight: bold;
	            			background-color: #123499;
	            			font-size:25px;
	            			text-align: center;">2024.02</div>
	            <div class="reserve-date">
	            	
	            	<div class="day">01</div>
	            	<div class="day">02</div>
	            	<div class="day">03</div>
	            	<div class="day">04</div>
	            	<div class="day">05</div>
	            	<div class="day">06</div>
	            	<div class="day">07</div>
	            	<div class="day">08</div>
	            	<div class="day">09</div>
	            	<div class="day">10</div>
	            </div>
	        </div>
	        <div class="time-part">
	            <div class="reserve-title">시간</div>
	            
	            <div class="times">
	            	<span class="material-symbols-outlined">
						clear_day
					</span> 11:00(am)
	            </div>
	            
	            <div class="times">
	            	<span class="material-symbols-outlined">
						clear_day
					</span> 13:30(am)
	            </div>
	           
	           	<div class="times">
	            	<span class="material-symbols-outlined">
						clear_day
					</span> 17:30(am)
	            </div>
	           	
	            <div class="times">
	            	<span class="material-symbols-outlined">
						clear_night
					</span> 20:30(pm)
				</div>
				
				<div class="times">
	            	<span class="material-symbols-outlined">
						clear_night
					</span> 24:00(am)
				</div>
	           
	           	<div class="times">
	            	<span class="material-symbols-outlined">
						clear_night
					</span> 02:30(pm)
				</div>

	        </div>

    	</div>
    	
    	<div class="d-flex justify-content-center">
	    	<div class="next">
				<form id="go" name="go" action="/ticketing/seat" method="get">
					<div style="flex-grow: 1;">
						<div style="font-size: 20px;">영화 : 12345</div>
						<div style="font-size: 20px;">날짜 : </div>
						<div style="font-size: 20px;">시간 : </div>
					</div>
						
					<button class="btn btn-success" style="font-size:64px; 
										width: 383px">좌석배치</button>
				</form>
			</div>
    	</div>
    	
    	
    </div><!-- reverseContainer -->
    
</div>



<%@ include file="/WEB-INF/views/include/bottom.jsp" %>
