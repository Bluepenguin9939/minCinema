<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Custom fonts for this template-->
    <link href="/resources/css/admin/admin.css?after" rel="stylesheet" type="text/css">
    <link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <!-- 구글 글리피콘 -->
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
	
    <!-- Custom styles for this template-->
    <link href="/resources/css/sb-admin-2.min.css" rel="stylesheet">
	<link href="/resources/js/demo/chart-bar-demo.js?after" rel="stylesheet">
	
</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <!-- ul id 수정 절대 금지 -->
        <ul class="navbar-nav bg-gradient sidebar sidebar-dark accordion"  id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" title="ak"  href="index.html">
                <div class="sidebar-brand-icon rotate-n">
                    <i class="fa fa-film"></i>
                </div>
                <div class="sidebar-brand-text mx-3" style="background-color: black;">Min4 Admin <sup></sup></div>
            </a>
			</section><!-- Divider -->
<!--             <hr class="sidebar-divider my-0"> -->

            <!-- Nav Item - Dashboard -->
            <li class="nav-item active">
                <a class="nav-link" href="/admin/ham_admins"> 
                <span class="material-symbols-outlined"> dashboard </span> <span>Dashboard</span></a>
            </li>
			
            <!-- Divider -->
<!--             <hr class="sidebar-divider"> -->

            <!-- Heading -->
            <div class="sidebar-heading">
                Interface
            </div>

            <!-- 회원관리 벤,삭제 -->
            <li class="nav-item">
                <a class="nav-link" href="/admin/ham_cmanagement">
                   <i class="fa fa-user"></i>
                    <span>회원관리</span></a>
            </li>
            <!-- 영화 추가 -->
            <li class="nav-item">
                <a class="nav-link" href="/admin/ham_movieadd">
                    <span class="material-symbols-outlined">movie_info</span>
                    <span>Movie add</span></a>
            </li>
<!--             <li class="nav-item"> -->
<!--                 <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" -->
<!--                     aria-expanded="true" aria-controls="collapseTwo"> -->
<!--                     <i class="fa fa-user"></i> -->
<!--                     <span>회원 관리</span> -->
<!--                 </a> -->
<!--                 <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar"> -->
<!--                     <div class="bg-white py-2 collapse-inner rounded"> -->
<!--                         <h6 class="collapse-header">회원관리</h6> -->
<!--                         <a class="collapse-item" href="/admin/ham_cmanagement">기존 회원 관리</a> -->
<!--                         <a class="collapse-item" href="cards.html">불량(신고) 회원 관리</a> -->
<!--                     </div> -->
<!--                 </div> -->
            </li>

            <!-- Nav Item - Utilities Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities"
                    aria-expanded="true" aria-controls="collapseUtilities">
                    <i class="fab fa-product-hunt align-self-center"></i>
                    <span>포인트 관리</span>
                </a>
                <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">포인트관리:</h6>
                        <a class="collapse-item" href="utilities-color.html">회원 포인트 내역 관리</a>
                        <a class="collapse-item" href="utilities-border.html">포인트 내역 관리</a>
                    </div>
                </div>
            </li>

            <!-- Divider -->
<!--             <hr class="sidebar-divider"> -->

            <!-- Heading -->
            <div class="sidebar-heading">
                Addons
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" title="고객센터" data-toggle="collapse" data-target="#collapsePages"
                    aria-expanded="true" aria-controls="collapsePages">
                    <i class="fa fa-headset"></i>
                    <span>고객센터 관리</span>
                </a>
                <div id="collapsePages" class="collapse" aria-labelledby="headingThree" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">고객센터 관리</h6>
                        <a class="collapse-item" href="login.html">자주묻는 질문</a>
                        <a class="collapse-item" href="register.html">1대1 문의</a>
                    </div>
                </div>
            </li>
            <!-- 메세지관리  -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseEvent"
                    aria-expanded="true" aria-controls="collapseEvent">
                    <i class="fa fa-birthday-cake"></i>
                    <span>이벤트 관리</span>
                </a>
                <div id="collapseEvent" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">이벤트 관리</h6>
                        <a class="collapse-item" href="login.html">이벤트 당첨자</a>
                        <a class="collapse-item" href="register.html">이벤트 내역 관리 </a>
                    </div>
                </div>
            </li>


            <!-- Nav Item - Tables -->
            <li class="nav-item">
                <a class="nav-link" href="tables.html">
                    <i class="fas fa-fw fa-table"></i>
                    <span>Tables</span></a>
            </li>

            <!-- Divider -->
<!--             <hr class="sidebar-divider d-none d-md-block"> -->


        </ul>
        <!-- End of Sidebar -->