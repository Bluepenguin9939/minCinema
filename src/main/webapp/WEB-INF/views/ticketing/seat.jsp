<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/WEB-INF/views/include/top.jsp" %>

<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@40,400,0,0" />
<link rel="stylesheet" href="/resources/css/ticketing/seat.css?after" type="text/css">

<style>




</style>
<script>
/*
 * 
 date-select: select => 내가 선택한 좌석
 date-select: unselect => 비어있는 좌석
 date-select: noselect => 이미 예약된 좌석
 */

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
					
					if(thatNT_text == "" || thatNT_attr=="select" || thatNT_attr == "noselect"){
					
						thatPV2.css("background-color",bgColor);
						thatPV2.css("color",color);
						if(method=="on-click"){
							thatPV2.attr("data-select","select");
							seatArray.push( thatPV2.attr("data-seat") );
						}
					}
					else{

						thatPV.css("background-color",bgColor);
						thatPV.css("color",color);
						if(method=="on-click"){
							thatPV.attr("data-select","select");
							seatArray.push( thatPV.attr("data-seat") );
						}
					}
				
				} 
				else if(thatNT2_text != "" && thatNT2_attr == "unselect"){
					
						
					if(thatNT_text=="" || thatNT_attr=="select" || thatNT_attr=="noselect"){
						
						thatPV2.css("background-color",bgColor);
						thatPV2.css("color",color);
						if(method=="on-click"){
							thatPV2.attr("data-select","select");
							seatArray.push( thatPV2.attr("data-seat") );
						}
					}
					else{
						
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
	

	if(method=="on-click"){
		$.each(seatArray, function (index, seat) {
			seatMap.set(seat,seatArray);
		});
		
		return seatArray;
	}
	
}
	
$(function(){
	
	//쿠폰 유무
	var coupon5 = "${loginInfo.coupon5}";
	var coupon10 = "${loginInfo.coupon10}";
	var coupon15 = "${loginInfo.coupon15}";
	if(coupon5 == "" || coupon5 == null || coupon5 == "0"){
		$("select option[value='5']").prop('disabled',true);
		$("select option[value='5']").text(' 5% 할인쿠폰 (0)');
		$("select option[value='5']").css("color","red");
	}
	
	if(coupon10 == "" || coupon10 == null || coupon10 == "0"){
		$("select option[value='10']").prop('disabled',true);
		$("select option[value='10']").text('10% 할인쿠폰 (0)');
		$("select option[value='10']").css("color","red");
	}
	
	if(coupon15 == "" || coupon15 == null || coupon15 == "0"){
		$("select option[value='15']").prop('disabled',true);
		$("select option[value='15']").text('15% 할인쿠폰 (0)');
		$("select option[value='15']").css("color","red");
	}
	///////////////////////////////////////////////////////
	
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
		
		
		that.attr("data-select","select");
		that.css("background-color","blue");
		that.css("color","white");
		
		
		$("#hid-pCount").val(pCount);
		console.log("pCount:", $("#hid-pCount").val() );
		
	});///////////////////
	
	
	
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
		$("#disCount").val("0").prop("selected",true); //세일 없음으로 선택
		
		//성인 , 청소년 비용
		var adultCost =  parseInt( $("#adultCost").text() );		
		var teenCost =  parseInt( $("#teenCost").text() );		
		
		
		if(select=="unselect"){
			var currentSeat = parseInt( $(".currentSeat").text() );
			
			
			var age;
			
			switch (pCount) {
			case "1":
				var seatArray = mouseHoverOronClick(that,pCount,"black","white","on-click");
				var appendId;
				if(ageCheck=="성인"){
					ticketCost = ticketCost + adultCost * parseInt(pCount);
					age = "adult";
					appendId = "#"+age;
				}
				else if(ageCheck="청소년"){
					ticketCost = ticketCost + teenCost * parseInt(pCount);
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
						ticketCost = ticketCost + adultCost * parseInt(pCount);
						age = "adult";
						appendId = "#"+age;
					}
					else if(ageCheck="청소년"){
						ticketCost = ticketCost + teenCost * parseInt(pCount);
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
							ticketCost = ticketCost + adultCost * parseInt(pCount);
							age = "adult";
							appendId = "#"+age;
						}
						else if(ageCheck="청소년"){
							ticketCost = ticketCost + teenCost * parseInt(pCount);
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
			
			$.each(seatArray, function (index, seat) { /*div 정리*/
				  	$("#id-"+seat).css("background-color","white");
					$("#id-"+seat).css("color","black");
					$("#id-"+seat).attr("data-select","unselect");
					
					var id = "#"+seat;
					age = $(id).attr("data-age");
					$(id).remove();
			});
			
			
			if(age == "adult"){ ticketCost = ticketCost - adultCost * seatArray.length }
			else if(age == "teen"){ ticketCost = ticketCost - teenCost * seatArray.length }
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
		
		
	});//할인적용
	
	
	
	$(".payButton").click(function() {  //////계산부분
		var check = confirm("예매하시겠습니까?");
		if (check) {
			var reservedSeat = [];
			var ageMap = {};
			var ticketListArray = $(".seatMember");
			
			var resultCost = parseInt( $("#resultCost").text() );
			var payCost = parseInt( $("#subCost").text() );
			payCost = (payCost * (-1));
			
			var discount = $("#disCount").val();
			
			
			if(resultCost>=0){
				
				$.each(ticketListArray, function (index, seat) { 
					reservedSeat.push(seat.id);
					ageMap[seat.id] = seat.getAttribute("data-age"); // 연관 배열
					
				});
				
				var mid = "${loginInfo.mid}";
				
				var data = {
						"movieTitle" :  movieTitle,//영화제목
						"movieDate" : movieDate ,//영화상영일
						"movieTime" :  movieTime,//영화 시작시간,
						"movieTheater" : movieTheater,	//영화 상영관,
						"reservedSeat" : reservedSeat,   //예약한좌석번호들
						"age" : ageMap,//연령
						"mid" : mid,		//아이디
						"payCost" : payCost,	//지불금액
						"resultCost" : resultCost,	//현재 금액
						"discount" : discount 	// 사용한 쿠폰
				};
				
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
				var pointCharge = confirm("포인트가 부족합니다!!!!\n포인트를 충전하시겠습니까?");
				if (pointCharge) {
					$("#modal-payment").modal("show");
				}
			}
		}
		
		
	});
	
	
});
	
</script>
<%@ include file="/WEB-INF/views/include/heo_pointChargeModal.jsp" %>
<div>
	<div class="reserve-container">
		<div class="seat-part">
			<div class="reserve-title">
				<span>좌석배정</span>
			</div>
	        
	        <div class="seatSelector">
	        	<div class="seatLoc" >
	        		<div class="seatLoc-top bg-light rounded">
	        			
	        			<div style="background-color: #F6E3CE;">
	        				<div style="font-weight: bold;" class="bg-danger text-center">이용자 선택</div>
	        				
	        				<div>
	        					<span class="pCount rounded-circle m-2" id="first" data-select="select" data-pCount="1">1인</span>
	        					<span class="pCount rounded-circle m-2" data-select="unselect" data-pCount="2">2인</span>
	        					<span class="pCount rounded-circle m-2" data-select="unselect" data-pCount="3">3인</span>
	        					<input type="hidden" id="hid-pCount" value="1">
	        					성인 : <span id="adultCost">10000</span>원
	        					<span>-</span>
	        					청소년 : <span id="teenCost">8000</span>원
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
		        	<div class="revInfo">
		        		<ul style="font-size: 24px">
			        		<li>영화 : ${Je_ReservationInfoVO.movieTitle}</li>
			        		<li>날짜 : ${Je_ReservationInfoVO.movieDate}</li>
			        		<li>시간 : ${Je_ReservationInfoVO.movieTime}</li>
			        		<li>상영관 : ${Je_ReservationInfoVO.movieTheater}</li>
		        		</ul>
		        	</div>
		        	
		        	
		        	
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
