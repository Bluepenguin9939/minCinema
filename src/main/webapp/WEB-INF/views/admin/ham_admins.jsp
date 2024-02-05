<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/ad_sidebar.jsp" %>
<%@ include file="/WEB-INF/views/include/ad_topbar.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link href="/resources/css/admin/adminmain.css?after" rel="stylesheet" type="text/css"> 
                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4 mana">
                        <label class="h3 mb-0 text-black-800" id="mainManage">관리자 메인 페이지</label>
                    </div>
                 </div>
                 
                 <!-- 관리자 메인 대시보드 -->
                 <div class="col-md-12">
						<div class="row">
							<!-- 막대차트-장르별 등록 영화수 -->
							<div class="col-md-6">
								<div class="chartBox">
								<h3 class="d-flex justify-content-center"><span class="material-symbols-outlined">movie</span>장르별 등록 영화수</h3>
									<div><canvas id="myChart"></canvas></div>
								</div>
							</div>
							<!-- 듀얼 막대차트-고객 문의사항 답변 -->
						
							<div class="col-md-6">
							<h3 class="d-flex justify-content-center"><i class="fa fa-headset"></i>고객 문의사항 답변</h3>
									<div><canvas id="myChart2"></canvas></div>
							</div>
							<div id="sisi" >
								 <c:forEach  var="vo" items="${list}"  >
<%-- 								  <c:out escapeXml="false"  value="${item.id}"/> --%>
<%-- 								  <c:out escapeXml="false" value="${item.name}"/> --%>
								 	<div  class="send-date" data-send_date="${vo.send_date}"></div>
								 	<div  class="month-Count" data-monthCount="${vo.monthCount}"></div>
								 </c:forEach>
							</div>
							<div id="sisi2" >
								 <c:forEach  var="vo" items="${oList}" >
								 	<div  class="open-date" data-open_date="${vo.open_date}"></div>
								 	<div class="reply-Count" data-replyCount="${vo.replyCount}"></div>
								 </c:forEach>
							</div>
						</div>
				</div>
				
				<!-- 파이 차트-연령별 회원 수 -->
                 <div class="col-md-12" >
                 	<div class="row">
                 		<div class="col-md-6">
						<h3 class="" id="ageView"><span class="material-symbols-outlined">family_restroom</span>연령별 회원 수</h3>
							<div class="d-flex justify-content-center" style=" width: 80%; height: 80%; resize: none; "><canvas id="myChart3"></canvas></div>
                 		</div>
                 		<!-- 선형 차트-매출액 -->
                 		<div class="col-md-6" >
                 		<h3 class="d-flex justify-content-center" id="monthPoint"><i class="fa fa-calculator"></i> 월별 매출액</h3>
                 			<div><canvas id="myChart4"></canvas></div>
                 		</div>
               		</div>
               	</div>

    <!-- 스크롤 많이 내려갈시 한번에 올리기-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

<script>
$(function(){
	var send_date = $(".send-date").attr("data-send_date");
	var monthCount = $(".month-Count").attr("data-monthCount");
	var monthCount2 = parseInt(monthCount);
	console.log("send_date:",send_date);
	
	
	//듀얼 막대 차트 -유저
	var asd ="";
	var count="";
	var co="";
	var aaa="";
	//듀얼 막대 차트 - 관리자
	var rOp ="";
	var rCount="";
	var rOsplit="";
	var rCsplit="";

	
	var ctx = document.getElementById("myChart");
	var ctx1 = document.getElementById("myChart2").getContext('2d');
	var ctx2 = document.getElementById("myChart3");
	var ctx3 = document.getElementById("myChart4"); 
	var arr = [];

// 	var data = {};
	var labels = {};
	var bb = ["1","2","3","4","5","6","7","8","9","10","11","12"]
	var cc = ["1","2","3","4","5","6","7","8","9","10","11","12"]
	var aa = [1,2,3,4,5,6]
	
	for(var v=0; v < 12; v++){//유저측
		if (v == 11) {
  			asd += $(".send-date").eq(v).attr("data-send_date");
  			count += $(".month-Count").eq(v).attr("data-monthCount");
		} 
		else {
			asd += $(".send-date").eq(v).attr("data-send_date") + ",";
			count += $(".month-Count").eq(v).attr("data-monthCount") + ",";
		}
		 
  	}//
		  aaa = count.split(',');
		  co = asd.split(',');
		  console.log("co:",co);
		  console.log("aaa:",aaa);
  	for(var v=0; v < 12; v++){//관리자측
  		if (v == 11) {
  			rOp += $(".open-date").eq(v).attr("data-open_date");
  			rCount += $(".reply-Count").eq(v).attr("data-replyCount");
		} 
		else {
			rOp += $(".open-date").eq(v).attr("data-open_date") + ",";
			rCount += $(".reply-Count").eq(v).attr("data-replyCount") + ",";
		}	
  	console.log("rCount:",rCount);
  	}//
  		 rOsplit = rOp.split(',');
		 rCsplit = rCount.split(','); 	
		 
		 console.log("rOsplit:",rOsplit);
		 console.log("rCsplit:",rCsplit);
	

var myChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: ["Red", "Blue", "Yellow", "Green", "Purple", "Orange"],
        datasets: [{
            label: '# of Votes',
            data: aaa,
            borderColor: [
                'rgba(255,99,132,1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
            ],
            borderWidth: 1
        }]
    },  
});//
	myChart = new Chart(ctx1, {//듀얼막대
    type: 'bar',
    data: {
        labels: co,
        datasets: [
        	{
            label: '고객문의',
            data: aaa,
            backgroundColor: [
                'rgba(255,99,132,0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)',
                'rgba(255,99,132,0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
            ],
        },{
            label: '고객문의s',
            data: rCsplit,
            backgroundColor: [
                'rgba(255,99,132,1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)',
                'rgba(255,99,132,1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
            ],
            borderWidth: 1            
        }
       ]
    }  
});//
	    myChart = new Chart(ctx2, {//파이차트
	    type: 'pie',
	    data: {
	        labels: ["Red", "Blue", "Yellow", "Green", "Purple", "Orange"],
	        datasets: [{
	            label: '# of Votes',
	            data: aa,
	            borderColor: [
	                'rgba(255,99,132,1)',
	                'rgba(54, 162, 235, 1)',
	                'rgba(255, 206, 86, 1)',
	                'rgba(75, 192, 192, 1)',
	                'rgba(153, 102, 255, 1)',
	                'rgba(255, 159, 64, 1)'
	            ],
	            borderWidth: 1
	        }]
	    },  
	});//
	
	myChart = new Chart(ctx3, {//월매출 
	    type: 'line',
	    data: {
	        labels: ["Red", "Blue", "Yellow", "Green", "Purple", "Orange"],
	        datasets: [{
	            label: '# of Votes',
	            data: aa,
	            borderColor: [
	                'rgba(255,99,132,1)',
	                'rgba(54, 162, 235, 1)',
	                'rgba(255, 206, 86, 1)',
	                'rgba(75, 192, 192, 1)',
	                'rgba(153, 102, 255, 1)',
	                'rgba(255, 159, 64, 1)'
	            ],
	            borderWidth: 1
	        }]
	    },  
	});//

});
</script>
    <!-- 차트 javaScript> -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<!--   <script src="/resources/js/moviekind.js"></script> -->
<!--   <script src="/resources/js/oneonone.js"></script> -->
<!--   <script src="/resources/js/cmanagement.js"></script> -->
<!--   <script src="/resources/js/sumpoint.js"></script> -->

    <!-- Bootstrap core JavaScript-->
    <script src="/resources/vendor/jquery/jquery.min.js"></script>
    <script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="/resources/js/sb-admin-2.js"></script>
    <script src="/resources/js/sb-admin-2.min.js"></script>

 

</body>

</html>