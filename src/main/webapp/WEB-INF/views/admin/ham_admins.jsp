<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/ad_sidebar.jsp" %>
<%@ include file="/WEB-INF/views/include/ad_topbar.jsp" %>
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
									<canvas class="mainChart-bar" id="myChart"></canvas>
								</div>
							</div>
							<!-- 듀얼 막대차트-고객 문의사항 답변 -->
							<div class="col-md-6">
							<h3 class="d-flex justify-content-center"><i class="fa fa-headset"></i>고객 문의사항 답변</h3>
									<canvas  class="mainChart-bar" id="myChart2"></canvas>
							</div>
						</div>
				</div>
				
				<!-- 파이 차트-연령별 회원 수 -->
                 <div class="col-md-12" >
                 	<div class="row">
                 		<div class="col-md-6">
						<h3 class="d-flex justify-content-center" id="ageView"><span class="material-symbols-outlined">family_restroom</span>연령별 회원 수</h3>
							<canvas class="mainChart" id="myChart3" ></canvas>
                 		</div>
                 		<!-- 선형 차트-매출액 -->
                 		<div class="col-md-6" >
                 		<h3 class="d-flex justify-content-center" id="monthPoint"><i class="fa fa-calculator"></i> 월별 매출액</h3>
                 			<canvas class="mainChart" id="myChart4" ></canvas>
                 		</div>
               		</div>
               	</div>

    <!-- 스크롤 많이 내려갈시 한번에 올리기-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>
    
    <!-- 차트 javaScript> -->
  <script src="/resources/js/moviekind.js"></script>
  <script src="/resources/js/oneonone.js"></script>
  <script src="/resources/js/cmanagement.js"></script>
  <script src="/resources/js/sumpoint.js"></script>

   
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