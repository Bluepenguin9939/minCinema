<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/ad_sidebar.jsp"%>
<%@ include file="/WEB-INF/views/include/ad_topbar.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link href="/resources/css/admin/adminmain.css?after" rel="stylesheet" type="text/css">
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"> -->
<!-- Begin Page Content -->
<div class="container-fluid">


                    <!-- Page Heading -->
                    <div class="mHead">
                        <label class="h3 mb-0 text-black-800" id="mainManage"> 관리자 메인 페이지</label>
                    </div>
                 </div>
                 
                 <!-- 관리자 메인 대시보드 -->
                 <div class="col-md-12">
						<div class="row">

							<!-- 막대차트-장르별 등록 영화수 -->
							<div class="col-md-6">
								<div class="chartBox">
								<h3><span class="material-symbols-outlined">movie</span>장르별 등록 영화수</h3>
									<div><canvas id="myChart"></canvas></div>
								</div>
							</div>
							<!-- 듀얼 막대차트-고객 문의사항 답변 -->
						
							<div class="col-md-6">
							<h3><i class="fa fa-headset"></i>고객 문의사항 답변</h3>
									<div><canvas id="myChart2"></canvas></div>
							</div>
							<div id="sisi" >
								 <c:forEach  var="vo" items="${list}"  >
								 	<div  class="send-date" data-send_date="${vo.send_date}"></div>
								 	<div  class="month-Count" data-monthCount="${vo.monthCount}"></div>
								 </c:forEach>
							</div>
							<div id="sisi2" >
								 <c:forEach  var="vo" items="${oList}" >
								 	<div  class="open-date" data-open_date="${vo.open_date}"></div>
								 	<c:if test="${!empty vo.open_date}">
								 	<div class="reply-Count" data-replyCount="${vo.replyCount}"></div>
								 	</c:if>
								 </c:forEach>
							</div>

							<div id="sisi3" >
								 <c:forEach var="vo" items="${pList}" >
								 	<div class="point_pdate" data-pdate="${vo.pdate}"></div>
								 	<div class="point_ppoint" data-ppoint="${vo.ppoint}"></div>
								 </c:forEach>
							</div>
							<div id="sisi4" >
								 <c:forEach var="vo" items="${mList}" >
								 	<div class="mov-genre" data-mov_genre="${vo.mov_genre}"></div>
								 	<div class="mov-count" data-mov_count="${vo.mov_count}"></div>
								 </c:forEach>
							</div>
							
						</div>
				</div>
				

		<!-- 선형 차트-매출액 -->
		<div class="col-md-12">
		<div class="row">
		<div class="lineChart">
			<h3 id="monthPoint">
				<i class="fa fa-calculator"></i> 월별 매출액
			</h3>
			<div>
				<canvas id="myChart4"></canvas>
			</div>
		</div>
		<div class="pay">
				<div class="total-pay">
					<i class="fa fa-coins" id="icon"></i>
					<label class="text">총 매출액</label>
					<label class="totalPoint" data-total="${totalPointDTO.total}"></label>
				</div>
<!-- 				<div class="coa"> -->
<!-- 					<span class="num" data-val="400">000</span> -->
<!-- 					<span class="text">The total movies</span> -->
<!-- 				</div> -->
		</div>
		</div>
	</div>



<!-- 스크롤 많이 내려갈시 한번에 올리기-->
<a class="scroll-to-top rounded" href="#page-top"> <i
	class="fas fa-angle-up"></i>
</a>

<script>
$(function() {
	var valueDisplays = document.querySelectorAll(".totalPoint");
	
		valueDisplays.forEach((valueDisplay) => {
		var startValue = 0;
		var endValue = valueDisplay.getAttribute("data-total");
		var counter = setInterval(function(){
			startValue += 1000;
			valueDisplay.textContent = startValue.toLocaleString('ko-KR');
			if(startValue == endValue){
				clearInterval(counter);
			}
			
		}, 0.1);
	});
	
	//차트 데이터
	var send_date = $(".send-date").attr("data-send_date");
	var monthCount = $(".month-Count").attr("data-monthCount");
	var monthCount2 = parseInt(monthCount);
	var pdate = $(".point_pdate").attr("data-pdate");
	var ppoint = $(".point_ppoint").attr("data-ppoint");
	
	var mov_genre = $(".mov-genre").attr("data-mov_genre");
	console.log("mov_genre:",mov_genre);

	//막대 차트 
	var mg="";
	var mc="";
	//듀얼 막대 차트 -유저
	var dsd = "";
	var count = "";
	var dSplit = "";
	var cSplit = "";
	//듀얼 막대 차트 - 관리자
	var rOp = "";
	var rCount = "";
	var rOsplit = "";
	var rCsplit = "";
	// 선 차트 - 월 매출액 
	var pd = "";
	var pp = "";
	var pdSplit = "";
	var ppSplit = "";
	
	

	var ctx = document.getElementById("myChart");
	var ctx1 = document.getElementById("myChart2").getContext('2d');
	var ctx3 = document.getElementById("myChart4");
	var arr = [];

	// 	var data = {};
	var labels = {};

	for (var v = 0; v < 12; v++) {//유저측
		if (v == 11) {
			dsd += $(".send-date").eq(v).attr("data-send_date");
			count += $(".month-Count").eq(v).attr("data-monthCount");
		} else {
			dsd += $(".send-date").eq(v).attr("data-send_date") + ",";
			count += $(".month-Count").eq(v).attr("data-monthCount") + ",";
		}

	}//
	cSplit = count.split(',');
	dSplit = dsd.split(',');
	
	for (var v = 0; v < 12; v++) {//관리자측
		if (v == 11) {
			rOp += $(".open-date").eq(v).attr("data-open_date");
			rCount += $(".reply-Count").eq(v).attr("data-replyCount");
		} else {
			rOp += $(".open-date").eq(v).attr("data-open_date") + ",";
			rCount += $(".reply-Count").eq(v).attr("data-replyCount") + ",";
		}
	}//
	
	
	rOsplit = rOp.split(',');
	rCsplit = rCount.split(',');

	
	
	for (var v = 0; v < 12; v++) {//매출액  
		if (v == 11) {
			pd += $(".point_pdate").eq(v).attr("data-pdate");
			pp += $(".point_ppoint").eq(v).attr("data-ppoint");
		} else {
			pd += $(".point_pdate").eq(v).attr("data-pdate") + ",";
			pp += $(".point_ppoint").eq(v).attr("data-ppoint") + ",";
		}
		
	}//
	
	pdSplit = pd.split(',');
	ppSplit = pp.split(',');
	
	for (var v =0; v < 6; v++){
		if (v == 5) {
			mg += $(".mov-genre").eq(v).attr("data-mov_genre");
			mc += $(".mov-count").eq(v).attr("data-mov_count");
		} else {
			mg += $(".mov-genre").eq(v).attr("data-mov_genre") + "|";
			mc += $(".mov-count").eq(v).attr("data-mov_count") + "|";
		}
	}
	mgSplit = mg.split('|');
	mcSplit = mc.split('|');

	var myChart = new Chart(ctx,
			{
				type : 'bar',
				data : {
					labels : mgSplit,
					datasets : [ {
						label : '등록된 영화 개수',
						data : mcSplit,
						backgroundColor : [ 'rgba(255,99,132,0.2)',
								'rgba(54, 162, 235, 0.2)',
								'rgba(255, 206, 86, 0.2)',
								'rgba(75, 192, 192, 0.2)',
								'rgba(153, 102, 255, 0.2)',
								'rgba(255, 159, 64, 0.2)' ],
						borderWidth : 1
					} ]
				},
			});//
	myChart = new Chart(ctx1, {//듀얼막대
		type : 'bar',
		data : {
			labels : dSplit,
			datasets : [
					{
						label : '고객문의수',
						data : cSplit,
						backgroundColor : [ 
								'rgba(255, 99, 132, 0.4)',
								'rgba(255, 206, 86, 0.4)',
								'rgba(255, 99, 132, 0.4)',
								'rgba(255, 206, 86, 0.4)',
								'rgba(255, 99, 132, 0.4)',
								'rgba(255, 206, 86, 0.4)',
								'rgba(255, 99, 132, 0.4)',
								'rgba(255, 206, 86, 0.4)',
								'rgba(255, 99, 132, 0.4)',
								'rgba(255, 206, 86, 0.4)',
								'rgba(255, 99, 132, 0.4)',
								'rgba(255, 206, 86, 0.4)' ],
					},
					{
						label : '문의답변수',
						data : rCsplit,
						backgroundColor : [ 
								'rgba(54, 162, 235, 0.4)',
								'rgba(54, 162, 235, 0.4)',
								'rgba(54, 162, 235, 0.4)',
								'rgba(54, 162, 235, 0.4)',
								'rgba(54, 162, 235, 0.4)',
								'rgba(54, 162, 235, 0.4)',
								'rgba(54, 162, 235, 0.4)',
								'rgba(54, 162, 235, 0.4)',
								'rgba(54, 162, 235, 0.4)',
								'rgba(54, 162, 235, 0.4)',
								'rgba(54, 162, 235, 0.4)',
								'rgba(54, 162, 235, 0.4)' ],
						borderWidth : 1
					} ]
		}
	});//
	myChart = new Chart(ctx3, {//월매출 
		type : 'line',
		data : {
			labels : pdSplit,
			datasets : [ {
				label : '월별 매출액',
				data : ppSplit,
				borderColor : [ 'rgba(255,99,132,1)',
					'rgba(255,99,132,1)', 'rgba(255,99,132,1)',
					'rgba(255,99,132,1)', 'rgba(255,99,132,1)',
					'rgba(255,99,132,1)', 'rgba(255,99,132,1)',
					'rgba(255,99,132,1)','rgba(255,99,132,1)',
					'rgba(255,99,132,1)','rgba(255,99,132,1)'],
				borderWidth : 1
			} ]
		},
	});//

});
</script>


<!-- 차트 javaScript> -->


<!-- Bootstrap core JavaScript-->
<script src="/resources/vendor/jquery/jquery.min.js"></script>
<!-- <script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script> -->

<!-- Core plugin JavaScript-->
<script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="/resources/js/sb-admin-2.js"></script>
<script src="/resources/js/sb-admin-2.min.js"></script>



</body>

</html>