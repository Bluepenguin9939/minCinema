<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/views/include/ad_sidebar.jsp"%>
<%@ include file="/WEB-INF/views/include/ad_topbar.jsp"%>
<head>
<link rel="stylesheet" href="/resources/css/admin/addNotice.css"
	type="text/css">
<%@ include file="/WEB-INF/views/include/heo_addNoticeModal.jsp"%>
<%@ include file="/WEB-INF/views/include/heo_NoticeContentModal.jsp"%>
<link href="/resources/css/myPage/pointPagination.css" rel="stylesheet">
<script src="/resources/js/modal/notice.js"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12 blankDiv"></div>
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<div class="notice d-flex justify-content-start">
					<h1 class="notice-title" style="">공지사항 관리</h1>
				</div>
				<div class="d-flex justify-content-center">
					<button class="btn btn-warning btnAddNotice">공지사항 추가</button>
				</div>
				<div class="tblDiv">
				</div>
			</div>
			<div class="col-md-2"></div>
		</div>
	</div>

</body>
