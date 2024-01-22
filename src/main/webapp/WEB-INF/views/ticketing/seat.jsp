<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/WEB-INF/views/include/top.jsp" %>

<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@40,400,0,0" />
<style>



.reserve-container {
    /*margin-top: 20px; /*마진달기*/
    display: flex; /**flex 적용**/
    justify-content: center; /* 가운데 정렬 */
    height: 801px; /*높이 800px*/
    /* border: 1px solid #dddddd; */
    background-color: #444444;
}

.reserve-container>div {
    border: 1px solid #dddddd;
    /*외각선 굵게만들어 구분하기*/
    background-color: white;
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

.sheat-part{
	 width: 932px;
}

.sheat-part > div{
	display: flex; /**flex 적용**/
   /* justify-content: center; /* 가운데 정렬 */
   border: 1px solid #dddddd;
}

.sheatLoc{
	/*justify-content: center; /* 가운데 정렬 */
	
	background-color:#F2F5A9;
	height: 668px; /*높이 800px*/
 	width: 650px; /*높이 800px*/
 	border-left: 1px solid #dddddd;
   	border-right: 3px solid #dddddd;
}

.sheatLoc > div{
	/*align-items : center;*/
 	/*height: 60px; /*높이 800px*/
 	width: 650px; /*높이 800px*/
	display: flex; /**flex 적용**/
   	justify-content: center; /* 가운데 정렬 */
   	
}

.seat{
	height: 50px;
	width: 50px;
	background-color:white;
	cursor: pointer;
	
}

.seat:hover{
	background-color:black;
	color: white;
	
}

.ENG-Row{
	font-size:28px;
	padding:15px;
}

.fourSeat{
	/*height: 500px;*/
	font-size : 28px;
	padding:15px;
}

.eightSeat{
	/*height: 500px;*/
	font-size : 28px;
	padding:15px;
}

.twoSeat{
	/*height: 500px;*/
	font-size : 28px;
	padding:15px;
}


</style>
<script>
	
$(function(){
	
	var eng = ['A','B','C','D','E','F'];
	
});
	
</script>
<div>
	
	<div class="reserve-container">
		<div class="sheat-part">
			<div class="reserve-title">좌석배정</div>
	        <div class="" style="height: 670px">
	        	<div class="sheatLoc">
	        		<div>
	        			<span style="background-color: lime; 
	        					font-size: 50px">스크린</span>
	        		</div>
	        		<div style="height: 150px;width: 650px"></div>
	        		<c:forEach var="count" items="<%=new char[] {'A','B','C','D','E','F'}%>">
	        		
	        			<div>
			        		<div class ="ENG-Row">${count}</div>
				        	<div class ="fourSeat">
				        		<span class="seat rounded-circle" data-seat="${count}01">01</span>
				        		<span class="seat rounded-circle" data-seat="${count}02">02</span>
				        		<span class="seat rounded-circle" data-seat="${count}03">03</span>
				        		<span class="seat rounded-circle" data-seat="${count}04">04</span>
				        	</div>
				        	
				        	<div class ="eightSeat">
				        		<span class="seat rounded-circle" data-seat="${count}05">05</span>
				        		<span class="seat rounded-circle" data-seat="${count}06">06</span>
				        		<span class="seat rounded-circle" data-seat="${count}07">07</span>
				        		<span class="seat rounded-circle" data-seat="${count}08">08</span>
				        		<span class="seat rounded-circle" data-seat="${count}09">09</span>
				        		<span class="seat rounded-circle" data-seat="${count}10">10</span>
				        	</div>
				        	
				        	<div class ="twoSeat">
				        		<span class="seat rounded-circle" data-seat="${count}11">11</span>
				        		<span class="seat rounded-circle" data-seat="${count}12">12</span>
				        	</div>
				        </div> 
	        		</c:forEach>
			         
			        
		        </div>
		        <div class="count" style="width: 280px; background-color:#F2F5A9;">
		        	<div style="text-align: center; 
		        				background-color: red;
		        				font-size:40px">좌석 예매 결제</div>
		        	
		        	<div>영화 : 토이스토리4</div>
		        	<div>날짜 : 2024.02.01</div>
		        	<div>시간 : 11:00(am)</div>
		        	<div>?????원 X ?명 </div>
		        	<div>?????원</div>
		        	<div>포인트:</div>
		        	<div>==================</div>
		        	<div style="width: 100%; background-color: silver;">결제할 금액합계: 12000원</div>
		        </div><!-- count -->
		        
	        </div>
	        
			<div style="height: 97px; width: 930px; display: flex; background-color:#F2F5A9;">
				<div style="flex-grow: 1;">
					<div style="font-size: 50px; text-align: center;">남은좌석 ??/72석</div>
				</div>
			
				<button class="btn btn-success" 
						style="font-size:40px;width: 280px;">
					<span style="font-size:36px;" class="material-symbols-outlined">
							credit_card
					</span>결제하기
				</button>
			</div>
		</div>
	</div>
</div>


<%@ include file="/WEB-INF/views/include/bottom.jsp" %>
