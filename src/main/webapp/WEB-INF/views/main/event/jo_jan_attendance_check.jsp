<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/top.jsp" %>

<link rel="stylesheet" href="/resources/css/main/event/jan_attendance_check.css">

<script>
$(function() {
// 	출석 참여 상태 체크
	var mid = "${loginInfo.mid}";
	console.log("mid :", mid);
	
	var today = new Date();
	var today_year = today.getFullYear();
	var today_month = today.getMonth() + 1;
	var today_date = today.getDate();
	
	if (today_month < 10) {
		today_month = "0" + today_month;
	}
	if (today_date < 10) {
		today_date = "0" + today_date;
	}
	
	var curDate = today_year + "/" + today_month + "/" + today_date; 
	console.log(curDate);
	
	var url = "/main/event/jan_attendance_status";
	var sData = {
			"mid" : mid,
			"curDate" : curDate
	}
	
	$.post(url, sData, function(rData) {
		console.log("attendance : ", rData);
		
		var checkAttendance = rData.checkAttendance;
		console.log("checkAttendance : ", checkAttendance);
		var attendanceList = rData.attendanceList;
		console.log("attendanceList : ", attendanceList);
		
		var cal_date = $(".attendance_td");
		for (var v = 0; v < attendanceList.length; v++) {
			cal_date.each(function() {
				var date = $(this).attr("data-date");
				if (attendanceList[v] == date) {
					$(this).find("h1").remove();
					var attendance_image = "<img src='/resources/img/event/check_penguin.png' alt='출석체크' width='87' height='98'>";
					$(this).append(attendance_image);
					$("#allAttendance").text(attendanceList.length);
				}
			});
		}
		
		if (checkAttendance == "Y") {
			$("#btnAttendance").attr("disabled", true);
			$("#btnAttendance").text("출석 완료");
		}
	});
// 	출석 참여 상태 체크 //

// 	출석 체크 하기
	$("#btnAttendance").click(function() {
		var url = "/main/event/jan_attendance_check";
		var sData = {
				"mid" : mid
		}
		
		$.post(url, sData, function(rData) {
			console.log(rData)
			
		});
	});
});
</script>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8" style="padding-top: 15px;">
			<h2>1월 출석체크</h2>
			<span>2024.01.01 ~ 2024.01.31</span>
			<hr style="border-bottom: 2px solid #555555;">
			<div style="display: flex; justify-content:center;
				margin-left: 15px; margin-right: 15px; border: 1px solid #333333;">
				<div style="width: 80%; text-align: center; padding: 10px;">
					<h1>January<sub style="font-size: 20px;">1월</sub></h1>
					<div style="background-color: #aaaaaa;">
						<table style="width: 100%;">
							<tr style="font-size: 20px; border-bottom: 1px solid #666666;">
								<th>Sun</th>
								<th>Mon</th>
								<th>Tue</th>
								<th>Wed</th>
								<th>Thu</th>
								<th>Fri</th>
								<th>Sat</th>
							</tr>
							<tr>
								<td></td>
							<c:forEach var="date" varStatus="status" begin="1" end="6">
								<td>
									<c:choose>
										<c:when test="${status.last}">
										<div class="attendance_td" data-date="${date}">
											<h1 style="align-self: center; color: #0000ff;">${date}</h1>
										</div>
										</c:when>
										<c:otherwise>
										<div class="attendance_td" data-date="${date}">
											<h1 style="align-self: center;">${date}</h1>
										</div>
										</c:otherwise>
									</c:choose>
								</td>
							</c:forEach>
							</tr>
							<tr>
							<c:forEach var="date" varStatus="status" begin="7" end="13">
								<td>
									<c:choose>
										<c:when test="${status.first}">
										<div class="attendance_td" data-date="${date}">
											<h1 style="align-self: center; color: #ff0000;">${date}</h1>
										</div>
										</c:when>
										<c:when test="${status.last}">
										<div class="attendance_td" data-date="${date}">
											<h1 style="align-self: center; color: #0000ff;">${date}</h1>
										</div>
										</c:when>
										<c:otherwise>
										<div class="attendance_td" data-date="${date}">
											<h1 style="align-self: center;">${date}</h1>
										</div>
										</c:otherwise>
									</c:choose>
								</td>
							</c:forEach>
							</tr>
							<tr>
							<c:forEach var="date" varStatus="status" begin="14" end="20">
								<td>
									<c:choose>
										<c:when test="${status.first}">
										<div class="attendance_td" data-date="${date}">
											<h1 style="align-self: center; color: #ff0000;">${date}</h1>
										</div>
										</c:when>
										<c:when test="${status.last}">
										<div class="attendance_td" data-date="${date}">
											<h1 style="align-self: center; color: #0000ff;">${date}</h1>
										</div>
										</c:when>
										<c:otherwise>
										<div class="attendance_td" data-date="${date}">
											<h1 style="align-self: center;">${date}</h1>
										</div>
										</c:otherwise>
									</c:choose>
								</td>
							</c:forEach>
							</tr>
							<tr>
							<c:forEach var="date" varStatus="status" begin="21" end="27">
								<td>
									<c:choose>
										<c:when test="${status.first}">
										<div class="attendance_td" data-date="${date}">
											<h1 style="align-self: center; color: #ff0000;">${date}</h1>
										</div>
										</c:when>
										<c:when test="${status.last}">
										<div class="attendance_td" data-date="${date}">
											<h1 style="align-self: center; color: #0000ff;">${date}</h1>
										</div>
										</c:when>
										<c:otherwise>
										<div class="attendance_td" data-date="${date}">
											<h1 style="align-self: center;">${date}</h1>
										</div>
										</c:otherwise>
									</c:choose>
								</td>
							</c:forEach>
							</tr>
							<tr>
							<c:forEach var="date" varStatus="status" begin="28" end="31">
								<td>
									<c:choose>
										<c:when test="${status.first}">
										<div class="attendance_td" data-date="${date}">
											<h1 style="align-self: center; color: #ff0000;">${date}</h1>
										</div>
										</c:when>
										<c:otherwise>
										<div class="attendance_td" data-date="${date}">
											<h1 style="align-self: center;">${date}</h1>
										</div>
										</c:otherwise>
									</c:choose>
								</td>
							</c:forEach>
							</tr>
						</table>
					</div>
				</div>
				<div style="align-self: center; width: 18%; padding: 10px; display: flex; justify-content: center;">
					<div style="width: 100%;">
						<div style="background-color: #aaaaaa; text-align: center; width: 100%;">
							<h4>현재 출석일</h4>
							<hr>
							<h2><span id="allAttendance">0</span>일</h2>
							<button type="button" class="btn btn-secondary" id="btnAttendance">출석</button>
						</div>
						<div style="">
						</div> 
					</div>
				</div>
			</div>
		</div>
		<div class="col-md-2">
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/include/bottom.jsp" %>