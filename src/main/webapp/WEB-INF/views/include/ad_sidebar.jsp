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
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,500,0,0" />
    <!-- Custom styles for this template-->
    <link href="/resources/css/sb-admin-2.min.css" rel="stylesheet">
	<!-- 관리자 차트 절대 지우지말기 -->
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	<!-- D3 차트 -->
	<script src="https://d3js.org/d3.v7.min.js"></script>
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
                <a class="nav-link" href="/admin/ham_addmovie">
                    <span class="material-symbols-outlined">movie_info</span>
                    <span>영화 관리</span></a>
            </li>
			<!-- 포인트 관리 - 일반  -->
            <li class="nav-item">
                <a class="nav-link" href="/admin/ham_addpoint">
<!--                    <span class="material-symbols-outlined">point_info</span> -->
					<i class="fab fa-product-hunt align-self-center"></i>
                   <span>포인트 관리</span></a>
            </li>

			<!-- 고객센터 관리/일반 -->
			<li class="nav-item">
                <a class="nav-link" href="/admin/ham_oneonone">
					<i class="fa fa-headset"></i>
                   <span>고객센터 관리</span></a>
            </li>
			<!-- 이벤트 관리/일반 -->
			<li class="nav-item">
                <a class="nav-link" href="/admin/ham_addevent">
					<i class="fab fa-product-hunt align-self-center"></i>
                   <span>이벤트 관리</span></a>
            </li>


        </ul>
        <!-- End of Sidebar -->