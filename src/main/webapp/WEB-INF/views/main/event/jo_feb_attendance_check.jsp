<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/top.jsp" %>

<link rel="stylesheet" href="/resources/css/main/event/attendance_check.css">

<script>
$(function() {
// 	출석 참여 상태 체크
	var mid = "${loginInfo.mid}";
	
	var cur_attendance_month = 02;
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
	
	if (today_month != 2) {
		$("#btnAttendance").attr("disabled", true);
	}
	
	var curDate = today_year + "/" + today_month + "/" + today_date; 
	console.log(curDate);
	
	var url = "/main/event/attendance_status";
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
		var allCount = 0;
		for (var v = 0; v < attendanceList.length; v++) {
			attendance_month = attendanceList[v].substring(0, 2);
			if (cur_attendance_month == attendance_month) {
				allCount++;
				cal_date.each(function() {
					var date = $(this).attr("data-date");
					if (date < 10) {
						date = "0" + date;
					}
					attendance_date = attendanceList[v].substring(3, 5);
					if (attendance_date == date) {
						$(this).find("h1").remove();
						var attendance_image = "<img src='/resources/img/event/check_penguin.png' alt='출석체크' width='87' height='98'>";
						$(this).append(attendance_image);
					}
				});
			}
		}
		$("#allAttendance").text(allCount);
		
		if (checkAttendance == "Y") {
			$("#btnAttendance").attr("disabled", true);
			$("#btnAttendance").text("출석 완료");
		}
		
//	 	출석 보상 수령 여부
		if (allCount >= 10) {
			var reward_url = "/main/event/attendance_reward";
			var reward_sData = {
					"allCount" : allCount,
					"r_month" : today_month
			}
			
			$.post(reward_url, reward_sData, function(rData) {
				console.log(rData);
				$(rData).each(function(i) {
					console.log("i :", i);
					var isReceive = rData[i];
					if (isReceive == 1) {
						$("#gift-table > tbody > tr:eq(" + i + ")").css("text-decoration", "line-through")
					} else {
						$("#btnGetReward").prop("disabled", false);
					}
				});
// 				if (rData) {
// 					alert("수령하지 않은 보상이 존재합니다");
// 					$("#btnGetReward").prop("disabled", false);
// 				}
			});
		}
	});

// 	로그인 판별
	if (mid == "" || mid == null) {
			$("#btnAttendance").attr("disabled", true);
	}

// 	출석 체크 하기
	$("#btnAttendance").click(function(e) {
		e.preventDefault();
		
		var checkUrl = "/main/event/attendance_check";
		var checkSData = {
				"mid" : mid
		}
		
		$.ajax({
			method : "post",
			url : checkUrl,
			data : checkSData,
			success : function(rData) {
				console.log(rData);
				if (rData) {
					alert("출석 완료");
					self.location = "/main/event/jo_feb_attendance_check";
				}
			}
		});
	});
	
// 	보상 받기 버튼
	$("#btnGetReward").click(function() {
		var allCount = $("#allAttendance").text();
		
		var url = "/main/event/attendance_receive";
		var sData = {
				"allCount" : allCount,
				"r_month" : today_month
		}
		
		$.post(url, sData, function(rData) {
			if (rData) {
				alert("쿠폰 지급이 완료되었습니다.");
				$("#btnGetReward").prop("disabled", true);
				self.location = window.location.href;
			}
		});
	});
});
</script>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8" style="padding-top: 15px;">
			<h2>2월 출석체크</h2>
			<span>2024.02.01 ~ 2024.02.29</span>
			<hr style="border-bottom: 2px solid #555555;">
			<div style="display: flex; justify-content:center;
				margin-left: 15px; margin-right: 15px; border: 1px solid #333333;">
				<div style="width: 80%; text-align: center; padding: 10px;">
					<h1>Febuary<sub style="font-size: 20px;">2월</sub></h1>
					<div>
						<table id="callender" style="width: 100%;">
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
								<td></td>
								<td></td>
								<td></td>
							<c:forEach var="date" varStatus="status" begin="1" end="3">
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
							<c:forEach var="date" varStatus="status" begin="4" end="10">
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
							<c:forEach var="date" varStatus="status" begin="11" end="17">
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
							<c:forEach var="date" varStatus="status" begin="18" end="24">
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
							<c:forEach var="date" varStatus="status" begin="25" end="29">
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
						<div style="text-align: center; width: 100%; border: 1px solid;
							padding: 5px;">
							<h4>현재 출석일</h4>
							<hr>
							<h2><span id="allAttendance">0</span>일</h2>
							<button type="button" class="btn btn-secondary" id="btnAttendance">출석</button>
						</div>
						<div style="margin-top: 30px; border: 1px solid; padding: 5px;
							text-align: center;">
							<table id="gift-table">
								<tbody>
									<tr>
										<th>10일차</th>
										<td>5% 할인 쿠폰</td>
									</tr>
									<tr>
										<th>20일차</th>
										<td>10% 할인 쿠폰</td>
									</tr>
									<tr>
										<th>30일차</th>
										<td>15% 할인 쿠폰</td>
									</tr>
								</tbody>
							</table>
							<button type="button" class="btn btn-sm btn-secondary"
								id="btnGetReward" disabled>
								보상 받기
							</button>
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