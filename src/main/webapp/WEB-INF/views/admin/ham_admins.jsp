<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/ad_sidebar.jsp" %>
<%@ include file="/WEB-INF/views/include/ad_topbar.jsp" %>
<%@ include file="/WEB-INF/views/include/bs.jsp" %>

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-black-800" style="font-family:Cursive;">관리자 메인 페이지</h1>
                    </div>
                 </div>
				<div class="col-md-6 d-flex" style="width: auto; height:auto; ">
				<div class="chartBox">
				<canvas id="myChart"></canvas>
				
				<button onclick="fChg()">여러번 눌러방</button>
				<button onclick="fChgType()">Type Mix</button>
				<!-- 차트 크기는 부모 크기를 조절하면 거기에 맞게 자동으로 맹글어짐-->
				<div  style="width: 600px; height: 300px; border: 2px solid black">
					<!-- 차트 그릴 위치 지정 canvas webGL(그래픽엔진) 사용 -->
					<canvas id="myChart2"></canvas>
				</div>
			</div>
		</div>
				
                    <!-- 관리자 메인 페이지- 막대차트   -->


    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>


  <script src="/resources/js/moviekind.js"></script> <script src="/resources/js/membership.js"></script> 
  
   
    

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