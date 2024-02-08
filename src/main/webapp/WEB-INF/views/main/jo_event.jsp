<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/top.jsp" %>

<link rel="stylesheet" href="/resources/css/main/event.css">

<div class="container-fluid">
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
			<div style="margin-top: 15px;">
				<h2>진행중인 이벤트</h2>
			</div>
			<hr style="border-bottom: 2px solid #555555;">
			<div style="display: flex; justify-content: space-between;">
				<a href="/main/event/jo_feb_attendance_check">
					<div>
						<img src="/resources/img/event/attendance_check.png?after" alt="출석체크"
							style="width: 500px; height: 400px; border: 2px solid #000000">
						<div style="width: 500px; border: 2px solid #000000; border-top: 0px; padding: 10px;">
							<h5>2월 출석체크</h5>
							<span>2024.02.01 ~ 2024.02.29</span>
						</div>
				 	</div>
			 	</a>
		 	</div>
		 	<br>
			<div style="margin-top: 15px;">
				<h2>종료된 이벤트</h2>
			</div>
			<hr style="border-bottom: 2px solid #555555;">
			<div style="display: flex; justify-content: space-between;">
				<a href="/main/event/jo_jan_attendance_check">
					<div>
						<img src="/resources/img/event/attendance_check.png?after" alt="출석체크"
							style="width: 500px; height: 400px; border: 2px solid #000000">
						<div style="width: 500px; border: 2px solid #000000; border-top: 0px; padding: 10px;">
							<h5>1월 출석체크</h5>
							<span>2024.01.01 ~ 2024.01.31</span>
						</div>
				 	</div>
			 	</a>
		 	</div>
		</div>
		<div class="col-md-2">
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/include/bottom.jsp" %>