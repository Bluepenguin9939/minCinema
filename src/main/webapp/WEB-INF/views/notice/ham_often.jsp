<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="/WEB-INF/views/include/top.jsp" %>

<head>
<link rel="stylesheet" href="/resources/css/notice.css?after" type="text/css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">
<!-- <meta name="viewport" content="width=device-width,initial-scale=1.0"> -->
<style>

</style>

</head>
<!-- list(게시판) 양식 -->
<body>
	<div class="notice d-flex justify-content-center" > 
		<div class="notice-top" >
		
			<h2 class="notice-body" title="공지사항" > <i class="fa fa-question"></i>자주묻는질문</h2>
			<section>
		   	 <ul class="nav" title="공지사항그룹">
					  <li class="nav-item">
					    <a class="nav-link" href="/notice/ham_notice">공지사항</a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link" href="/notice/ham_often">자주묻는질문</a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link" href="/notice/ham_inquiry">1대1문의</a>
					  </li> 
			  </ul>
			</section>
		<!-- 자주 묻는 질문틀  -->
		<div class="container-fluid">
	<div class="">
		<div class="col-md-12">
			<div id="card-443862">
			<!-- Q1 -->
				<div class="card">
					<div class="card-header">
						 <a class="card-link" data-toggle="collapse" data-parent="#card-443862" href="#card-element-397258">Q 포인트 충전은 어떻게 하나요?</a>
					</div>
					<div id="card-element-397258" class="collapse">
						<div class="card-body">
							<label>마이페이지 혹은 영화예매시 결제 페이지로 이동합니다.</label>
						</div>
					</div>
				</div>
			<!-- Q2 -->
				<div class="card">
					<div class="card-header">
						 <a class="card-link" data-toggle="collapse" data-parent="#card-443862" href="#card-element-660485">Q 좌석 예매는 어디서 하나요?</a>
					</div>
					<div id="card-element-660485" class="collapse">
						<div class="card-body">
							<label>영화 포스터를 클릭 후 -> 해당 영화 예매하기 버튼 클릭 후 좌석 예매를 진행하시면 됩니다.</label>
						</div>
					</div>
				</div>
			<!-- Q3 -->
				<div class="card">
					<div class="card-header">
						 <a class="card-link" data-toggle="collapse" data-parent="#card-443862" href="#card-element-000000">Q 할인 쿠폰 적용은 어떻게 하나요?</a>
					</div>
					<div id="card-element-000000" class="collapse">
						<div class="card-body">
							<label>결제창에서 할인쿠폰 클릭 후 사용하시면 됩니다.</label>
						</div>
					</div>
				</div>
			<!-- Q4 -->
				<div class="card">
					<div class="card-header">
						 <a class="card-link" data-toggle="collapse" data-parent="#card-443862" href="#card-element-000001">Q 보유 포인트는 어디서 하나요?</a>
					</div>
					<div id="card-element-000001" class="collapse">
						<div class="card-body">
							<label>로그인 후 본인 프로필 클릭 후 마이페이지 이동시 좌측에 보유 포인트 및 보유 쿠폰 개수를 확인할 수 있습니다.</label>
						</div>
					</div>
				</div>
			<!-- Q5 -->
				<div class="card">
					<div class="card-header">
						 <a class="card-link" data-toggle="collapse" data-parent="#card-443862" href="#card-element-000002">Q 결제내역은 어디서 하나요?</a>
					</div>
					<div id="card-element-000002" class="collapse">
						<div class="card-body">
							<label>로그인 후 본인 프로필 클릭 후 마이페이지 이동 후 이용내역을 확인하실 수 있습니다.</label>
						</div>
					</div>
				</div>
				
			</div>
		</div>
	</div>
</div>
		
		
		
	</div>
	</div>

<%@ include file="/WEB-INF/views/include/bottom.jsp" %>
</body>
