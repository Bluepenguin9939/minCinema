<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="/WEB-INF/views/include/top.jsp"%>

<link href="/resources/css/myPage/mySide.css?after" rel="stylesheet">
<link href="/resources/css/myPage/myPoint.css" rel="stylesheet">
<link href="/resources/css/myPage/pointPagination.css" rel="stylesheet">
<!-- 결제창모달.jsp -->
<%@ include file="/WEB-INF/views/include/heo_pointChargeModal.jsp"%>
${pointInfoList}
<script>
	$(function() {
		var buyerName = "${loginInfo.mname}";
		var buyerTel = "${loginInfo.mtel}";

		$(".use-point").click(function() {
			$(".point-ul > li > a").removeClass("active");
			$(".point-ul > li:last > a").addClass("active");
			$("#point-tab").removeClass("active");
			$("#point-history-tab").addClass("active");
			$("#point-history-tab").addClass("show");
		});

		$("#point-history-item").click(function() {
			var url = "/point/pointList";
			var sData = {
				mid : "${loginInfo.mid}"
			};
			$.get(url,sData,function(rData){
// 				console.log(rData);
				$("#point-history-tab").empty();
				$("#point-history-tab").append(rData);
			});
		});
	});
</script>


<div class="container-fluid">

	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8 d-flex justify-content-center">
			<%@ include file="/WEB-INF/views/include/myPage-side.jsp"%>
			<div style="width: 100%; background-color: #cccccc;">
				<div style="width: 90%; height: 90%; margin-left: 5%;">
					<div style="border-bottom: 1px solid #999999;
						margin-top: 20px; margin-bottom: 20px;">
						<h4>보유 쿠폰</h4>
					</div>
<%-- 					${5%_coupon} --%>
<%-- 					${10%_coupon} --%>
<%-- 					${15%_coupon} --%>
					<div class="d-flex flex-column justify-content-between" style="height: 700px;">
						<div class="d-flex">
							<img src="/resources/img/5_OFF.png" alt="쿠폰"
								width="500">
							<div class="d-flex flex-column justify-content-center"
								style="width: 40%;">
								<h3 class="align-self-center">보유 갯수</h3>
								<h3 class="align-self-center">0개</h3>
							</div>
						</div>
						<div class="d-flex">
							<img src="/resources/img/10_OFF.png" alt="쿠폰"
								width="500">
							<div class="d-flex flex-column justify-content-center"
								style="width: 40%;">
								<h3 class="align-self-center">보유 갯수</h3>
								<h3 class="align-self-center">0개</h3>
							</div>
						</div>
						<div class="d-flex">
							<img src="/resources/img/15_OFF.png" alt="쿠폰"
								width="500">
							<div class="d-flex flex-column justify-content-center"
								style="width: 40%;">
								<h3 class="align-self-center">보유 갯수</h3>
								<h3 class="align-self-center">0개</h3>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-md-2"></div>
	</div>
</div>


<%@ include file="/WEB-INF/views/include/bottom.jsp"%>