<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/WEB-INF/views/include/top.jsp" %>

<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@40,400,0,0" />
<style>

body {
  -webkit-user-select:none;
  -moz-user-select:none;
  -ms-user-select:none;
  user-select:none
} /*드래그 방지*/



.reserve-container {
    /*margin-top: 20px; /*마진달기*/
    display: flex; /**flex 적용**/
    justify-content: center; /* 가운데 정렬 */
    flex-wrap: nowrap;
    height: 850px; /*높이 800px*/
    /* border: 1px solid #dddddd; */
    background-color: gray;
}

.reserve-container>div {
    border: 1px solid #dddddd;
    /*외각선 굵게만들어 구분하기*/
    background-color: white;
} 

.reserve-title { /*타이틀 상단제목 css*/
	text-align: center;
	width: 100%;
	height: 5%;
    border-bottom: 1px solid #dddddd;
    background-color: #444444;
    color: #dddddd;/*글자 색*/
    padding: 5px;
    font-size: 18px;
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
	height: 85%
}

.seatLoc{
	
	
	background-color:#AAAAAA;
	/*height: 675px; */
	height: 100%; 
 	width: 70%; 
 	border-left: 1px solid #dddddd;
   	border-right: 3px solid #dddddd;
}


.seatLoc-top{
	width: 100%;
	font-size: 22px;
}

.seatLoc-top >div >div{
	border: 2px solid #dddddd;
}

.scroll{
	overflow: scroll; 
	overflow-y: hidden;
}

.scroll::-webkit-scrollbar{
    width: 15px;
}

.scroll::-webkit-scrollbar-thumb{
    background-color: #9b54ba;
    /* 스크롤바 둥글게 설정    */
    border-radius: 10px;
}

.scroll::-webkit-scrollbar-track{
    background-color: #e4e4f8;
}

.seatRow{
	width: 100%;
	/*height: 20%;*/
	display: flex;
  	justify-content: center;
  	/*align-items: center;*/
   	flex-direction: row;
   	flex-wrap: wrap;
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
	width: 8%;
	/*height : 5%;*/
	font-size:28px;
	padding:15px;
}

.fourSeat{
	width: 30%;
	/*height: 500px;*/
	font-size : 28px;
	padding:15px;
}

.sixSeat{
	width: 45%;
	/*height: 500px;*/
	font-size : 28px;
	padding:15px;
}

.twoSeat{
	width: 17%;
	/*height: 500px;*/
	font-size : 28px;
	padding:15px;
}

#first{
	background-color:blue;
	color: white;
}


.count{
	width: 30%;
	height: 100%; 
	background-color:#AAAAAA;
}

.countText{
	text-align: center; 
	/*background-color: red;*/
	font-size:40px;
}

.pCount{
	/*border: 5px solid #dddddd;*/
	background: red;
	cursor: pointer;
}

.seatMember{
	white-space: nowrap;
}

span[data-select='noselect'] {
  background-color: #f2e2cd;
  color: white;
}


</style>
<script>
/*
 * 
 date-select: select => 내가 선택한 좌석
 date-select: unselect => 비어있는 좌석
 date-select: noselect => 이미 예약된 좌석
 */
 //console.log("info:","${loginInfo.mpoint}");

 
 

var seatMap = new Map();

function mouseHoverOronClick(that , pCount, bgColor, color , method){ 
	
	var thatNT = that.next();
	var thatNT_text = that.next().text();
	var thatNT_attr = that.next().attr("data-select");
	
	var thatNT2 = that.next().next();
	var thatNT2_text = that.next().next().text();
	var thatNT2_attr = that.next().next().attr("data-select");
	
	var thatPV = that.prev();
	var thatPV2 = that.prev().prev();
	
	var seatArray = new Array();
	
	if(pCount >= 1){
		
		that.css("background-color",bgColor);
		that.css("color",color);
		if(method=="on-click"){ 
			that.attr("data-select","select"); 
			seatArray.push( that.attr("data-seat") );
		}
		
		if(pCount >= 2){
		
			if(thatNT_text == "" || thatNT_attr == "select" || thatNT_attr == "noselect"){
				//console.log("적용테스트");
					//console.log("끝")
				thatPV.css("background-color",bgColor);
				thatPV.css("color",color);
				if(method=="on-click"){
						thatPV.attr("data-select","select");
						seatArray.push( thatPV.attr("data-seat") );
				}
					
			}
			else{
				thatNT.css("background-color",bgColor);
				thatNT.css("color",color);
				if(method=="on-click"){
					thatNT.attr("data-select","select");
					seatArray.push( thatNT.attr("data-seat") );
				}
			}
			
			
			if(pCount == 3){
			
				if(thatNT2_text == "" || thatNT2_attr == "select" || thatNT2_attr == "noselect"){
					//console.log("check1");
					if(thatNT_text == "" || thatNT_attr=="select" || thatNT_attr == "noselect"){
							//console.log("check1-2");
						thatPV2.css("background-color",bgColor);
						thatPV2.css("color",color);
						if(method=="on-click"){
							thatPV2.attr("data-select","select");
							seatArray.push( thatPV2.attr("data-seat") );
						}
					}
					else{
						//console.log("check1-3");
						thatPV.css("background-color",bgColor);
						thatPV.css("color",color);
						if(method=="on-click"){
							thatPV.attr("data-select","select");
							seatArray.push( thatPV.attr("data-seat") );
						}
					}
				
				} 
				else if(thatNT2_text != "" && thatNT2_attr == "unselect"){
					//console.log("check2");	
						
						
					if(thatNT_text=="" || thatNT_attr=="select" || thatNT_attr=="noselect"){
						//console.log("check2-1");
						thatPV2.css("background-color",bgColor);
						thatPV2.css("color",color);
						if(method=="on-click"){
							thatPV2.attr("data-select","select");
							seatArray.push( thatPV2.attr("data-seat") );
						}
					}
					else{
						//console.log("check2-2");
						thatNT2.css("background-color",bgColor);
						thatNT2.css("color",color);
						if(method=="on-click"){
							thatNT2.attr("data-select","select");
							seatArray.push( thatNT2.attr("data-seat") );
						}
					}
						
				}
					
			}//(if==3)
		}//(if>=2)
	}//(if>=1)
	
	//console.log("array:",array);
	if(method=="on-click"){
		$.each(seatArray, function (index, seat) {
			seatMap.set(seat,seatArray);
		});
		
		return seatArray;
	}
	
}
	
$(function(){
	
	
	var movieTitle = "${Je_ReservationInfoVO.movieTitle}";
	var movieDate =  "${Je_ReservationInfoVO.movieDate}";
	var movieTime = "${Je_ReservationInfoVO.movieTime}".substring(0, 5);
	var movieTheater = "${Je_ReservationInfoVO.movieTheater}";
	
	var sendData = { 
					"mov_screen_date" : movieDate,  //영화상영일
					"mov_start_time" : movieTime,  //영화 시작시간
					"mov_theater" :  movieTheater//영화 상영관
					};
	
	
	//시작시 데이터베이스에서 이미 예약된 좌석정보 가져오기
	$.post("/ticketing/reservedSeats",sendData,function(rData){
		
		$.each(rData, function(index, value){
			
			$("#id-"+value).attr("data-select","noselect");
		});
		
		var bookSeat = rData.length;

		var currentSeat = 72 - bookSeat;
		$(".currentSeat").text(currentSeat);
		
	});
	////////////////////////
	
	
	
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
		
		if(select == "unselect"){
			switch (pCount) {
			case "1":
				mouseHoverOronClick(that,pCount,"black","white",null);
				
				break;
			case "2":
				
				if( !( (thatNT.text() == "" || thatNT.attr("data-select") == "select" || thatNT.attr("data-select") == "noselect") 
						&& 
						(thatPV.text() == "" || thatPV.attr("data-select") == "select" || thatPV.attr("data-select") == "select") 
					) ){mouseHoverOronClick(that,pCount,"black","white",null);}
				
				break;
				
			case "3":
				if(!(that.text() == "11" || that.text() == "12") ){
					if(
						 !(	
							((thatNT.text() == "" || thatNT.attr("data-select") == "select" || thatNT.attr("data-select") == "noselect") && (thatPV.text() == "" || thatPV.attr("data-select") == "select" || thatPV.attr("data-select") == "noselect") ) 
							|| 
						  	((thatNT.text() == "" || thatNT.attr("data-select") == "select" || thatNT.attr("data-select") == "noselect") && (thatPV2.text() == "" || thatPV2.attr("data-select") == "select" || thatPV2.attr("data-select") == "noselect") )
							||
							((thatNT2.text() == "" || thatNT2.attr("data-select") == "select" || thatNT2.attr("data-select") == "noselect") && (thatPV.text() == "" || thatPV.attr("data-select") == "select" || thatPV.attr("data-select") == "noselect") )
						 )
						){
						mouseHoverOronClick(that,pCount,"black","white",null);
					}
				}
				break;
	
			default:
				break;
			}
			
		}
		
	},
	function() {/*마우스 아웃시*/
		var that = $(this);
		var select = that.attr("data-select");
		var pCount = $("#hid-pCount").val();
		
		var thatNT = that.next();
		var thatNT2 = that.next().next();
		
		var thatPV = that.prev();
		var thatPV2 = that.prev().prev();
		
		if(select == "unselect"){
			
			switch (pCount) {
			case "1":
				mouseHoverOronClick(that,pCount,"white","black",null);
				break;
				
			case "2":
				if( !( (thatNT.text() == "" || thatNT.attr("data-select") == "select" || thatNT.attr("data-select") == "noselect") 
						&& 
						(thatPV.text() == "" || thatPV.attr("data-select") == "select" || thatPV.attr("data-select") == "select") 
					) ){ mouseHoverOronClick(that,pCount,"white","black",null); }
				
				break;
				
			case "3":
				if(!(that.text() == "11" || that.text() == "12") ){
					if(
						 !(	
							((thatNT.text() == "" || thatNT.attr("data-select") == "select" || thatNT.attr("data-select") == "noselect") && (thatPV.text() == "" || thatPV.attr("data-select") == "select" || thatPV.attr("data-select") == "noselect") ) 
							|| 
						  	((thatNT.text() == "" || thatNT.attr("data-select") == "select" || thatNT.attr("data-select") == "noselect") && (thatPV2.text() == "" || thatPV2.attr("data-select") == "select" || thatPV2.attr("data-select") == "noselect") )
							||
							((thatNT2.text() == "" || thatNT2.attr("data-select") == "select" || thatNT2.attr("data-select") == "noselect") && (thatPV.text() == "" || thatPV.attr("data-select") == "select" || thatPV.attr("data-select") == "noselect") )
						 )
						){
						mouseHoverOronClick(that,pCount,"white","black",null);
					}
				}
				break;

			default:
				break;
			}
			
		}

	});
	
	
	
	/*seat 클릭 이벤트*/
	$(".seat").click(function() {
		var that = $(this);
		var seat;
		var select = that.attr("data-select");
		var ageCheck = $('input[name=age]:checked').val();
		var pCount = $("#hid-pCount").val();

		var thatNT = that.next();
		var thatNT2 = that.next().next();
		
		var thatPV = that.prev();
		var thatPV2 = that.prev().prev();
		
		var ticketCost = parseInt($("#ticketCost").text());
		//console.log("ticketCost:",ticketCost);
		$("#disCount").val("0").prop("selected",true);
		
		if(select=="unselect"){
			var currentSeat = parseInt( $(".currentSeat").text() );
			
			
			var age;
			
			switch (pCount) {
			case "1":
				var seatArray = mouseHoverOronClick(that,pCount,"black","white","on-click");
				var appendId;
				if(ageCheck=="성인"){
					ticketCost = ticketCost + 10000*parseInt(pCount);
					age = "adult";
					appendId = "#"+age;
				}
				else if(ageCheck="청소년"){
					ticketCost = ticketCost + 8000*parseInt(pCount);
					age = "teen";
					appendId = "#"+age;
				}
			
				$.each(seatArray, function (index, seat) {
					$("<div id="+seat+" data-age='"+age+"' class='seatMember pl-2 d-flex flex-nowrap'>"+seat+"("+ageCheck+")</div>").appendTo(appendId);
				});
				
				currentSeat = currentSeat - parseInt(pCount);
				$(".currentSeat").text(currentSeat);
				
				break;
			case "2":
				if(!( (thatNT.text() == "" || thatNT.attr("data-select") == "select" || thatNT.attr("data-select") == "noselect") && (thatPV.text() == "" || thatPV.attr("data-select") == "select" || thatPV.attr("data-select") == "noselect") ) )
				{
					
					var seatArray = mouseHoverOronClick(that ,pCount, "black", "white","on-click");
					
					var appendId;
					if(ageCheck=="성인"){
						ticketCost = ticketCost + 10000*parseInt(pCount);
						age = "adult";
						appendId = "#"+age;
					}
					else if(ageCheck="청소년"){
						ticketCost = ticketCost + 8000*parseInt(pCount);
						age = "teen";
						appendId = "#"+age;
					}
				
					$.each(seatArray, function (index, seat) {
						$("<div id="+seat+" data-age='"+age+"' class='seatMember pl-2 d-flex flex-nowrap'>"+seat+"("+ageCheck+")</div>").appendTo(appendId);
					});
					
					currentSeat = currentSeat - parseInt(pCount);
					$(".currentSeat").text(currentSeat);
				}
				break;
				
			case "3":
				if(!(that.text() == "11" || that.text() == "12")){
					if(
						!(	
							((thatNT.text() == "" || thatNT.attr("data-select")== "select" || thatNT.attr("data-select")== "noselect") && (thatPV.text() == "" || thatPV.attr("data-select")== "select" || thatPV.attr("data-select")== "noselect") ) 
							|| 
							((thatNT.text() == "" || thatNT.attr("data-select")== "select" || thatNT.attr("data-select")== "noselect") && (thatPV2.text() == "" || thatPV2.attr("data-select")== "select" || thatPV2.attr("data-select")== "noselect") )
							||
							((thatNT2.text() == "" || thatNT2.attr("data-select")== "select" || thatNT2.attr("data-select")== "noselect") && (thatPV.text() == "" || thatPV.attr("data-select")== "select" || thatPV.attr("data-select")== "noselect") )
						 )
					){
						var seatArray = mouseHoverOronClick(that ,pCount, "black", "white","on-click");
					
						var appendId;
						if(ageCheck=="성인"){
							ticketCost = ticketCost + 10000*parseInt(pCount);
							age = "adult";
							appendId = "#"+age;
						}
						else if(ageCheck="청소년"){
							ticketCost = ticketCost + 8000*parseInt(pCount);
							age = "teen";
							appendId = "#"+age;
						}
					
						$.each(seatArray, function (index, seat) {
							$("<div id="+seat+" data-age='"+age+"' class='seatMember pl-2 d-flex flex-nowrap'>"+seat+"("+ageCheck+")</div>").appendTo(appendId);
						});
					
						currentSeat = currentSeat - parseInt(pCount);
						$(".currentSeat").text(currentSeat);
					}

				}
				break;

			default:
				break;
			}
			
			$("#ticketCost").text(ticketCost);
			$("#subCost").text(ticketCost);
		}
		/*선택취소 클릭*/
		else if(select=="select"){
			$("#disCount").val("0").prop("selected",true);
			
			var thatSeat = that.attr("data-seat");
			var seatArray = seatMap.get(thatSeat);
			var age;
			
			var currentSeat = parseInt( $(".currentSeat").text() );
			currentSeat = currentSeat + parseInt(seatArray.length);
			$(".currentSeat").text(currentSeat); //좌석개수 설정
			
			$.each(seatArray, function (index, seat) { /*ㅇdiv 정리*/
				  	$("#id-"+seat).css("background-color","white");
					$("#id-"+seat).css("color","black");
					$("#id-"+seat).attr("data-select","unselect");
					
					var id = "#"+seat;
					age = $(id).attr("data-age");
					$(id).remove();
			});
			
			
			if(age == "adult"){ ticketCost = ticketCost - 10000 * seatArray.length }
			else if(age == "teen"){ ticketCost = ticketCost - 8000 * seatArray.length }
			$("#ticketCost").text(ticketCost);
			
			$.each(seatArray, function (index, seat) { /*map 정리*/
				seatMap.delete(seat);
			});
			
		}
		$("#subCost").text(ticketCost);
		var point = parseInt( $("#myPoint").text() );
		var result = point - ticketCost;
		
		$("#resultCost").text(result);
		
	});//////////////////////////////// seat-click
	
	$("#disCount").on("change",function(){
		var that = $(this);
		var value = $(this).val();
		var point = parseInt( $("#myPoint").text() );
		var ticketCost = parseInt( $("#ticketCost").text() );
		if(ticketCost > 0){
			if(value > 0){
				var disCountCost = ticketCost * value / 100 ;
				var subCost = ticketCost-disCountCost;
				
				var resultCost = point - subCost;			
				$("#disCountText").text("(할인)");
				$("#subCost").text(subCost);
				$("#resultCost").text(resultCost);
			}
			else{
				var subCost = ticketCost;
				
				var resultCost = point - subCost;			
				
				$("#disCountText").text("");
				$("#subCost").text(subCost);
				$("#resultCost").text(resultCost);
			}
		}
		//console.log("that.val:",value);
		
		
	});//할인적용
	
	
	
	$(".payButton").click(function() {  //////계산부분
		//console.log("빼꼼?");
		var reservedSeat = [];
		var ageMap = {};
		var ticketListArray = $(".seatMember");
		
		var resultCost = parseInt( $("#resultCost").text() );
		var payCost = parseInt( $("#subCost").text() );
		
		
		if(resultCost>=0){
			
			$.each(ticketListArray, function (index, seat) { 
				reservedSeat.push(seat.id);
				ageMap[seat.id] = seat.getAttribute("data-age"); // 연관 배열
				
			});
			
			var mid = "${loginInfo.mid}";
			//console.log("mid:",mid);
			
			var data = {
					"movieTitle" :  movieTitle,//영화제목
					"movieDate" : movieDate ,//영화상영일
					"movieTime" :  movieTime,//영화 시작시간,
					"movieTheater" : movieTheater,	//영화 상영관,
					"reservedSeat" : reservedSeat,   //예약한좌석번호들
					"age" : ageMap,//연령
					"mid" : mid,		//아이디
					"payCost" : payCost,	//지불금액
					"resultCost" : resultCost	//현재 금액
			};
			
			//console.log("data:",data);
			var url = "/ticketing/cost";
			
			
			$.ajax({
		            url: url,
		            type: "POST",
		            data: JSON.stringify(data),
		            dataType: "json",
		            contentType: "application/json; charset=utf-8",
		            success: function(rdata){

		            	if(rdata == true){
		            		alert("예약완료");
			            	window.location.replace("http://localhost/main/jo_main");
		            	}
		            	else if(rdata == false){
		            		alert("예약실패");
		            	}
		            	
		            },
		            error: function(){
		                
		            }
		     });
			
		}
		else{
			alert("포인트가 부족합니다!!!!");
			
		}
		
		
		
	});
	
	
});
	
</script>
<div>
	
	<div class="reserve-container">
		<div class="seat-part">
			<div class="reserve-title text-center">좌석배정</div>
	        
	        <div class="seatSelector">
	        	<div class="seatLoc" >
	        		<div class="seatLoc-top bg-light rounded">
	        			
	        			<div style="background-color: #AAAAAA;">
	        				<div class="bg-danger text-center">이용자 선택</div>
	        				
	        				<div>
	        					<span class="pCount rounded-circle m-2" id="first" data-select="select" data-pCount="1">1인</span>
	        					<span class="pCount rounded-circle m-2" data-select="unselect" data-pCount="2">2인</span>
	        					<span class="pCount rounded-circle m-2" data-select="unselect" data-pCount="3">3인</span>
	        					<input type="hidden" id="hid-pCount" value="1">
	        					<span>성인 : 10000원</span>
	        					<span>-</span>
	        					<span>청소년 : 8000원</span>
	        				</div>
	        				<div class="scroll">
		        				<div class="p-1 d-flex flex-nowrap" id="adult">
		        					<label class="text-nowrap" style="cursor: pointer">
		        						<input type="radio" name="age" value="성인" checked>성인:
		        					</label> 
		        				</div>
		        				
		        				<div class="p-1 d-flex flex-nowrap" id="teen">
		        					<label class="text-nowrap" style="cursor: pointer">
		        						<input type="radio" name="age" value="청소년">청소년:
		        					</label> 
		        				</div>
	        				</div> <!-- 성인 청소년 영역 -->
	        			</div>
	        		</div>
	        		<div class = "d-flex justify-content-center">
	        			<span class = "rounded bg-success text-center" style="font-size: 50px; width: 240px">
	        				<span class="material-symbols-outlined" style="font-size: 40px;">
								interactive_space
							</span>
					스크린</span>
	        		</div>
	        		<c:forEach var="count" items="<%=new char[] {'A','B','C','D','E','F'}%>">
	        		
	        			<div class="pr-5 seatRow">
			        		<div class ="ENG-Row">${count}</div>
				        	<div class ="fourSeat">
				        		<span class="seat rounded-circle" id="id-${count}01" data-seat="${count}01" data-select="unselect">01</span>
				        		<span class="seat rounded-circle" id="id-${count}02" data-seat="${count}02" data-select="unselect">02</span>
				        		<span class="seat rounded-circle" id="id-${count}03" data-seat="${count}03" data-select="unselect">03</span>
				        		<span class="seat rounded-circle" id="id-${count}04" data-seat="${count}04" data-select="unselect">04</span>
				        	</div>
				        	
				        	<div class ="sixSeat">
				        		<span class="seat rounded-circle" id="id-${count}05" data-seat="${count}05" data-select="unselect">05</span>
				        		<span class="seat rounded-circle" id="id-${count}06" data-seat="${count}06" data-select="unselect">06</span>
				        		<span class="seat rounded-circle" id="id-${count}07" data-seat="${count}07" data-select="unselect">07</span>
				        		<span class="seat rounded-circle" id="id-${count}08" data-seat="${count}08" data-select="unselect">08</span>
				        		<span class="seat rounded-circle" id="id-${count}09" data-seat="${count}09" data-select="unselect">09</span>
				        		<span class="seat rounded-circle" id="id-${count}10" data-seat="${count}10" data-select="unselect">10</span>
				        	</div>
				        	
				        	<div class ="twoSeat">
				        		<span class="seat rounded-circle" id="id-${count}11" data-seat="${count}11" data-select="unselect">11</span>
				        		<span class="seat rounded-circle" id="id-${count}12" data-seat="${count}12" data-select="unselect">12</span>
				        	</div>
				        </div> 
	        		</c:forEach>
			         
			        
		        </div>
		        <div class="count">
		        	<div class="rounded countText bg-primary">좌석 예매 결제</div>
		        	
		        	<ul style="font-size: 24px">
		        		<li>영화 : ${Je_ReservationInfoVO.movieTitle}</li>
		        		<li>날짜 : ${Je_ReservationInfoVO.movieDate}</li>
		        		<li>시간 : ${Je_ReservationInfoVO.movieTime}</li>
		        		<li>상영관 : ${Je_ReservationInfoVO.movieTheater}</li>
		        	</ul>
		        	
		        	
		        	<div style="width: 100%">=========================</div>
		        	<div class="rounded text-center" style="width: 100%; background-color: #9dff71;">
		        		<div class="rounded" style="background-color: white;font-size: 20px">포인트 현황</div>
		        		<p id="myPoint" style="font-size: 28px">${loginInfo.mpoint} 포인트</p>
		        	</div>
		        	
		        	<div class="rounded text-center" style="width: 100%; background-color: #9dff71;">
		        		<div class="rounded" style="background-color: white;font-size: 20px">결재할 금액</div>
		        		<p id="ticketCost" style="font-size: 28px">0</p>
			        	<div class="d-flex text-nowrap bg-warning mb-3">
			        		<span style="font-size: 20px">할인쿠폰 :</span>
			        		<select class="form-control" id="disCount">
								<option value="0">없음</option>
								<option value="5">&ensp;5% 할인쿠폰 &emsp;&emsp;&emsp;&nbsp;(${loginInfo.coupon5})</option>
								<option value="10">10% 할인쿠폰 &emsp;&emsp;&emsp;&nbsp;(${loginInfo.coupon10})</option>
								<option value="15">15% 할인쿠폰 &emsp;&emsp;&emsp;&nbsp;(${loginInfo.coupon15})</option>
							</select>
			        	</div>
		        	</div>
		        	
		        	<div class="rounded text-center" style="width: 100%; background-color: #9dff71;">
		        		<div class="rounded" style="background-color: white;font-size: 20px">결제내역</div>
		        		<div class="text-right" style="font-size: 28px">${loginInfo.mpoint}  &nbspP</div>
		        		<div class="text-right" style="font-size: 28px">
		        			<span id="disCountText"></span><span id="subCost">0</span>원
		        		</div>
		        		<div class="text-right" style="font-size: 20px">====================</div>
		        		<div class="text-right" style="font-size: 28px">
		        			<span id="resultCost">0</span>원
		        		</div>
		        	</div>
		        </div><!-- count -->
		        
	        </div>
	        
			<div style="height: 10%; width: 100%; display: flex; background-color:#F7FFF9;">
				<div style="flex-grow: 1;">
					<div style="font-size: 50px; text-align: center;">남은좌석 <span class="currentSeat">??</span>/72석</div>
				</div>
				<button class="payButton btn btn-success"  type="button"
							style="font-size:40px;width: 280px; height: 100%">
					<span style="font-size:36px;" class="material-symbols-outlined">
								credit_card
					</span>결제하기
				</button>
				
			</div>
		</div>
	</div>
</div>


<%@ include file="/WEB-INF/views/include/bottom.jsp" %>
