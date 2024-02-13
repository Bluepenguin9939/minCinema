<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/views/include/bs.jsp" %>
    <link href="/resources/css/include/admintop.css?after" rel="stylesheet" type="text/css">
    
 
      <!-- Content Wrapper -->
  
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav id="move-nav" class="navbar navbar-expand navbar-dark bg-black topbar ">

                    <!-- Sidebar Toggle (Topbar) -->
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>

			<!-- 글자 이동 -->
			<div class="moveText">
				<p id="neonText"> 여기는 Min4 Cinema 관리자 페이지 입니다.</p>
			</div>
<!-- 			<div class="cover"> -->
<!-- 				<p class="second-parallel"></p> -->
<!-- 			</div> -->

<!--                     <form -->
<!--                         class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search"> -->
<!--                         <div class="input-group"> -->
<!--                             <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." -->
<!--                                 aria-label="Search" aria-describedby="basic-addon2"> -->
<!--                             <div class="input-group-append"> -->
<!--                                 <button class="btn btn-primary" type="button"> -->
<!--                                     <i class="fas fa-search fa-sm"></i> -->
<!--                                 </button> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </form> -->

<!--                     Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">

                        <li class="nav-item dropdown no-arrow d-sm-none">
                            <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-search fa-fw"></i>
                            </a>
                            <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                                aria-labelledby="searchDropdown">
                                <form class="form-inline mr-auto w-100 navbar-search">
                                    <div class="input-group">
                                        <input type="text" class="form-control bg-light border-0 small"
                                            placeholder="Search for..." aria-label="Search"
                                            aria-describedby="basic-addon2">
                                        <div class="input-group-append">
                                            <button class="btn btn-primary" type="button">
                                                <i class="fas fa-search fa-sm"></i>
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </li>

			


                        <!-- Nav Item - User Information -->
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small">Admin</span>
                                <i class="fa fa-crown"></i>
                            </a>
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="userDropdown">
                                <a class="dropdown-item" href="/member/logout">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                   로그아웃  
                                </a>
                            </div>
                        </li>

                    </ul>

                </nav>
                <!-- End of Topbar -->