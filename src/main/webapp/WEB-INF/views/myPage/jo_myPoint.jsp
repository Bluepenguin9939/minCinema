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
			<div style="width: 100%; height: 85vh;">
				<div style="width: 90%; height: 90%; margin-left: 5%;">
					<div
						style="border-bottom: 1px solid #999999; margin-top: 20px; margin-bottom: 20px;">
						<h4>포인트</h4>
					</div>
					<!-- Nav tabs -->
					<ul class="nav nav-tabs nav-justified point-ul" role="tablist">
						<li class="nav-item"><a class="nav-link active"
							data-toggle="tab" href="#point-tab">포인트</a></li>
						<li class="nav-item"><a class="nav-link" data-toggle="tab"
							href="#point-history-tab" id="point-history-item">이용내역</a></li>
					</ul>

					<!-- Tab panes -->
					<div class="tab-content">
						<div id="point-tab" class="container tab-pane active point-tab">
							<br>
							<div
								style="height: 220px; border-radius: 20px; background-color: #fff; display: flex; justify-content: flex-start; margin-bottom: 20px;">
								<div class="point-box" style="width: 60%;">
									<h5>내 보유 포인트</h5>
									<h2>${loginInfo.mnick}님의
										보유 포인트는<br>
										<fmt:formatNumber pattern="#,###">${loginInfo.mpoint}</fmt:formatNumber>
										포인트 입니다.
									</h2>
									<a class="use-point" data-toggle="tab"
										href="#point-history-tab">이용내역 보러가기 &raquo;</a>
								</div>
								<div class="point-box" style="width: 40%;">
									<!-- 									<img src="/resources/img/page-point.png" id="point-img"> -->
									<i class="fab fa-product-hunt align-self-center"
										id="rotate-point-i"></i>
								</div>
							</div>
							<div
								style="background-color: #fff; display: flex; height: 60px; border-radius: 15px;">
								<div style="width: 10%; display: flex; justify-content: center;">
									<i class="fab fa-product-hunt align-self-center"
										id="charge-point-i"></i>
								</div>
								<div style="width: 80%; display: flex; justify-content: center;">
									<span style="align-self: center; font-size: 20px;">포인트
										충전하러 가기</span>
								</div>
								<div style="width: 10%; display: flex; justify-content: center;">
									<button class="btn btn-sm btn-secondary btn-point-charge"
										type="button" style="align-self: center">충전</button>
								</div>
							</div>
						</div>
						<div id="point-history-tab"
							class="container tab-pane fade point-tab">
							
							
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-md-2"></div>
	</div>
</div>


<%@ include file="/WEB-INF/views/include/bottom.jsp"%>