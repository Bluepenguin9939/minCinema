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
	width: 100%;
    border-bottom: 1px solid #dddddd;
    background-color: #444444;
    color: #dddddd;/*글자 색*/
    padding: 5px;
    font-size: 13px;
    font-weight: bold;
}

.seat-part{
	 width: 932px;
}

.seat-part > div{
	display: flex;
   border: 1px solid #dddddd;
}

.seatSelector{
	height: 677px
}

.seatLoc{
	
	
	background-color:#F2F5A9;
	/*height: 675px; */
	height: 100%; 
 	width: 650px; 
 	border-left: 1px solid #dddddd;
   	border-right: 3px solid #dddddd;
}

.seatLoc > div{
	/*align-items : center;*/
 	/*height: 60px; /*높이 800px*/
 	width: 650px; 
	display: flex;
   	justify-content: center; */
   	
}

.seat{
	height: 50px;
	width: 50px;
	background-color:white;
	cursor: pointer;
	
}

.seat:hover{
	/*background-color:black;
	color: white;*/
	
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

#first{
	background-color:blue;
	color: white;
}


.count{
	width: 280px; 
	background-color:#F2F5A9;
}

.countText{
	text-align: center; 
	/*background-color: red;*/
	font-size:40px;
}

.pCount{
	background: red;
	cursor: pointer;
}


</style>
<script>

function select_click(that,clicking){
	
}

function mouseHover(that , pCount, bgColor, color , method){
	
	var thatNT = that.next();
	var thatNT_text = that.next().text();
	var thatNT_attr = that.next().attr("data-select");
	
	var thatNT2 = that.next().next();
	var thatNT2_text = that.next().next().text();
	var thatNT2_attr = that.next().next().attr("data-select");
	
	var thatPV = that.prev();
	var thatPV2 = that.prev().prev();
	
	if(pCount >= 1){
		
		that.css("background-color",bgColor);
		that.css("color",color);
		if(method=="on-click"){ that.attr("data-select","select"); }
		
		if(pCount >= 2){
		
			if(thatNT_text == "" || thatNT_attr == "select"){
				//console.log("적용테스트");
					//console.log("끝")
				thatPV.css("background-color",bgColor);
				thatPV.css("color",color);
				if(method=="on-click"){
						thatPV.attr("data-select","select");
				}
					
			}
			else{
				thatNT.css("background-color",bgColor);
				thatNT.css("color",color);
				if(method=="on-click"){thatNT.attr("data-select","select");}
			}
			
			
			if(pCount == 3){
			
				if(thatNT2_text == "" || thatNT2_attr == "select"){
					//console.log("check1");
					if(thatNT_text == "" || thatNT_attr=="select"){
							//console.log("check1-2");
						thatPV2.css("background-color",bgColor);
						thatPV2.css("color",color);
						if(method=="on-click"){thatPV2.attr("data-select","select");}
					}
					else{
						//console.log("check1-3");
						thatPV.css("background-color",bgColor);
						thatPV.css("color",color);
						if(method=="on-click"){thatPV.attr("data-select","select");}
					}
				
				} 
				else if(thatNT2_text != "" && thatNT2_attr == "unselect"){
					//console.log("check2");	
						
						
					if(thatNT_text=="" || thatNT_attr=="select"){
						//console.log("check2-1");
						thatPV2.css("background-color",bgColor);
						thatPV2.css("color",color);
						if(method=="on-click"){thatPV2.attr("data-select","select");}
					}
					else{
						//console.log("check2-2");
						thatNT2.css("background-color",bgColor);
						thatNT2.css("color",color);
						if(method=="on-click"){thatNT2.attr("data-select","select");}
					}
						
				}
					
			}
		}
	}
}
	
$(function(){
	
	
	/*1,2,3인 선택*/
	$(".pCount").click(function(){
		var that = $(this);
		
		var pCount = that.attr("data-pCount");
		var select = that.attr("data-select");
		
		//기존 체크된 요소 제거
		var find = that.parent().find("[data-select='select']");
		
		find.attr("data-select","unselect");
		find.css("background-color","red");
		find.css("color","black");
		//
		
		that.attr("data-select","select");
		that.css("background-color","blue");
		that.css("color","white");
		
		
		$("#hid-pCount").val(pCount);
		console.log("pCount:", $("#hid-pCount").val() );
		
	});//
	
	
	
	//*좌석위에 마우스 올리기*/
	$(".seat").hover(
		function() {//*마우스 in시*/
		var that = $(this);
		var select = that.attr("data-select");
		var pCount = $("#hid-pCount").val();
		
		var thatNT = that.next();
		var thatNT2 = that.next().next();
		
		var thatPV = that.prev();
		var thatPV2 = that.prev().prev();
		
		/*if(select == "unselect"){
			switch (pCount) {
			case "1":
				mouseHover(that,pCount,"black","white",null);
				
				break;
			case "2":
				
				if( !( (thatNT.text() == "" || thatNT.attr("data-select") == "select") && (thatPV.text() == "" || thatPV.attr("data-select") == "select") ) )
				{mouseHover(that,pCount,"black","white",null);}
				
				break;
				
			case "3":
				if(!(that.text() == "11" || that.text() == "12") ){
					if(
						 !(	
							((thatNT.text() == "" || thatNT.attr("data-select") == "select") && (thatPV.text() == "" || thatPV.attr("data-select") == "select") ) 
							|| 
						  	((thatNT.text() == "" || thatNT.attr("data-select") == "select") && (thatPV2.text() == "" || thatPV2.attr("data-select") == "select") )
							||
							((thatNT2.text() == "" || thatNT2.attr("data-select") == "select") && (thatPV.text() == "" || thatPV.attr("data-select") == "select") )
						 )
						){
						mouseHover(that,pCount,"black","white",null);
					}
				}
				break;
	
			default:
				break;
			}
			
		}*/
		
	},
	function() {/*마우스 아웃시*/
		var that = $(this);
		var select = that.attr("data-select");
		var pCount = $("#hid-pCount").val();
		
		var thatNT = that.next();
		var thatNT2 = that.next().next();
		
		var thatPV = that.prev();
		var thatPV2 = that.prev().prev();
		
		/*if(select == "unselect"){
			switch (pCount) {
			case "1":
				mouseHover(that,pCount,"white","black",null);
				break;
				
			case "2":
				if(!( (thatNT.text() == "" || thatNT.attr("data-select") == "select") && (thatPV.text() == "" || thatPV.attr("data-select") == "select") ) )
				{
					mouseHover(that,pCount,"white","black",null);
				}
				break;
				
			case "3":
				if(!(that.text() == "11" || that.text() == "12")){
					if(
						!(	
							((thatNT.text() == "" || thatNT.attr("data-select")== "select") && (thatPV.text() == "" || thatPV.attr("data-select")== "select") ) 
							|| 
							((thatNT.text() == "" || thatNT.attr("data-select")== "select") && (thatPV2.text() == "" || thatPV2.attr("data-select")== "select") )
							||
							((thatNT2.text() == "" || thatNT2.attr("data-select")== "select") && (thatPV.text() == "" || thatPV.attr("data-select")== "select") )
						 )
					){
						mouseHover(that,pCount,"white","black",null);
					}

				}
				break;

			default:
				break;
			}
			
		}*/

	});
	
	
	
	
	$(".seat").click(function() {
		var that = $(this);
		var seat = that.attr("data-seat");
		var select = that.attr("data-select");
		var ageCheck = $('input[name=age]:checked').val();
		var pCount = $("#hid-pCount").val();

		
		var thatNT = that.next();
		var thatNT2 = that.next().next();
		
		var thatPV = that.prev();
		var thatPV2 = that.prev().prev();
		
		if(select=="unselect"){
			switch (pCount) {
			case "1":
				mouseHover(that,pCount,"black","white","on-click");
				
						
				/*var appendId;
				if(ageCheck=="성인"){appendId = "#adult";}
				else if(ageCheck="청소년"){appendId = "#teen"; }
				$("<div id="+seat+" class='pl-2'>"+seat+"("+ageCheck+")</div>").appendTo(appendId);
				*/
				break;
			case "2":
				if(!( (thatNT.text() == "" || thatNT.attr("data-select") == "select") && (thatPV.text() == "" || thatPV.attr("data-select") == "select") ) )
				{
					
					mouseHover(that ,pCount, "black", "white","on-click");
					
					//that.attr("data-select","select");
					
					//that.next().attr("data-select","select");
					
				}
				break;
				
			case "3":
				if(!(that.text() == "11" || that.text() == "12")){
					if(
						!(	
							((thatNT.text() == "" || thatNT.attr("data-select")== "select") && (thatPV.text() == "" || thatPV.attr("data-select")== "select") ) 
							|| 
							((thatNT.text() == "" || thatNT.attr("data-select")== "select") && (thatPV2.text() == "" || thatPV2.attr("data-select")== "select") )
							||
							((thatNT2.text() == "" || thatNT2.attr("data-select")== "select") && (thatPV.text() == "" || thatPV.attr("data-select")== "select") )
						 )
					){
						mouseHover(that ,pCount, "black", "white","on-click");
					}

				}
				break;

			default:
				break;
			}
			
		}
		
		else if(select=="select"){
			switch (pCount) {
			case "1":
				mouseHover(that, pCount,"white","black","off-click");
				that.attr("data-select","unselect");
				
				/*var id = "#"+seat;
				$(id).remove();*/
				
				break;
			case "2":
				if(!( (thatNT.text() == "" || thatNT.attr("data-select") == "select") && (thatPV.text() == "" || thatPV.attr("data-select") == "select") ) )
				{
					mouseHover(that ,pCount, "white", "black","off-click");
					
					//that.attr("data-select","unselect");
					
					//that.next().attr("data-select","unselect");
				}
				break;
				
			case "3":
				if(!(that.text() == "11" || that.text() == "12")){
					if(
						!(	
							((thatNT.text() == "" || thatNT.attr("data-select")== "select") && (thatPV.text() == "" || thatPV.attr("data-select")== "select") ) 
							|| 
							((thatNT.text() == "" || thatNT.attr("data-select")== "select") && (thatPV2.text() == "" || thatPV2.attr("data-select")== "select") )
							||
							((thatNT2.text() == "" || thatNT2.attr("data-select")== "select") && (thatPV.text() == "" || thatPV.attr("data-select")== "select") )
						 )
					){
						
					}

				}
				break;

			default:
				break;
			}
		}
		
		
		

			
	//var find = that.parent().find("[data-select='select']");
	//console.log("find:",find.attr("data-seat"));
					
		
		
		
	});/////////// seat-click
	
});
	
</script>
<div>
	
	<div class="reserve-container">
		<div class="seat-part">
			<div class="reserve-title text-center">좌석배정</div>
	        
	        <div class="seatSelector">
	        	<div class="seatLoc" >
	        		<div class="bg-light rounded" style="height: 24%;width: 100%">
	        			
	        			<div style="width: 100%;font-size: 22px">
	        				<div class="bg-danger text-center">이용자 선택</div>
	        				
	        				<div>
	        					<span class="pCount rounded-circle m-2" id="first" data-select="select" data-pCount="1">1인</span>
	        					<span class="pCount rounded-circle m-2" data-select="unselect" data-pCount="2">2인</span>
	        					<span class="pCount rounded-circle m-2" data-select="unselect" data-pCount="3">3인</span>
	        					<input type="hidden" id="hid-pCount" value="1">
	        					<%-- 
		        				<input type="radio" name="peopleCount" value="1" checked>1인 
		        				<input type="radio" name="peopleCount" value="2" checked>2인 
		        				<input type="radio" name="peopleCount" value="3" checked>3인 --%>
	        				</div>
	        				<div style="overflow: scroll; overflow-y: hidden;">
		        				<div class="p-1 d-flex flex-nowrap" id="adult">
		        					<input type="radio" name="age" value="성인" checked>성인:  
		        				</div>
		        				
		        				<div class="p-1 d-flex" id="teen">
		        					<input type="radio" name="age" value="청소년">청소년:   
		        				</div>
	        				</div>
	        			</div>
	        		</div>
	        		<div>
	        			<span class = "rounded bg-success" style="font-size: 50px;">스크린</span>
	        		</div>
	        		<c:forEach var="count" items="<%=new char[] {'A','B','C','D','E','F'}%>">
	        		
	        			<div class="pr-5">
			        		<div class ="ENG-Row">${count}</div>
				        	<div class ="fourSeat">
				        		<span class="seat rounded-circle" data-seat="${count}01" data-select="unselect">01</span>
				        		<span class="seat rounded-circle" data-seat="${count}02" data-select="unselect">02</span>
				        		<span class="seat rounded-circle" data-seat="${count}03" data-select="unselect">03</span>
				        		<span class="seat rounded-circle" data-seat="${count}04" data-select="unselect">04</span>
				        	</div>
				        	
				        	<div class ="eightSeat">
				        		<span class="seat rounded-circle" data-seat="${count}05" data-select="unselect">05</span>
				        		<span class="seat rounded-circle" data-seat="${count}06" data-select="unselect">06</span>
				        		<span class="seat rounded-circle" data-seat="${count}07" data-select="unselect">07</span>
				        		<span class="seat rounded-circle" data-seat="${count}08" data-select="unselect">08</span>
				        		<span class="seat rounded-circle" data-seat="${count}09" data-select="unselect">09</span>
				        		<span class="seat rounded-circle" data-seat="${count}10" data-select="unselect">10</span>
				        	</div>
				        	
				        	<div class ="twoSeat">
				        		<span class="seat rounded-circle" data-seat="${count}11" data-select="unselect">11</span>
				        		<span class="seat rounded-circle" data-seat="${count}12" data-select="unselect">12</span>
				        	</div>
				        </div> 
	        		</c:forEach>
			         
			        
		        </div>
		        <div class="count">
		        	<div class="rounded countText bg-primary">좌석 예매 결제</div>
		        	
		        	<ul style="font-size: 24px">
		        		<li>영화 : 토이스토리4</li>
		        		<li>날짜 : 2024.02.01</li>
		        		<li>시간 : 11:00(am)</li>
		        	</ul>
		        	
		        	
		        	
		        	<div style="width: 100%">=========================</div>
		        	<div class="rounded text-center" style="width: 100%; background-color: silver;">
		        		<div class="rounded" style="background-color: white;font-size: 20px">결제할 금액</div>
		        		<p style="font-size: 20px">24000원</p>
		        	</div>
		        	
		        	<div class="rounded text-center" style="width: 100%; background-color: silver;">
		        		<div class="rounded" style="background-color: white;font-size: 20px">포인트 현황</div>
		        		<p style="font-size: 20px">18000원</p>
		        	</div>
		        	
		        	<div class="rounded text-center" style="width: 100%; background-color: silver;">
		        		<div class="rounded" style="background-color: white;font-size: 20px">결제내역</div>
		        		<div class="text-right" style="font-size: 20px">24000원</div>
		        		<div class="text-right" style="font-size: 20px">-  18000원</div>
		        		<div class="text-right" style="font-size: 20px">==============</div>
		        		<div class="text-right" style="font-size: 20px">6000원</div>
		        	</div>
		        </div><!-- count -->
		        
	        </div>
	        
			<div style="height: 90px; width: 930px; display: flex; background-color:#F2F5A9;">
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
