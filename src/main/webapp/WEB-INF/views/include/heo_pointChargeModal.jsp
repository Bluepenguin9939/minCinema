<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<!--  만약 디자인이 이상할시 주석해제 -->
<%-- <%@ include file="/WEB-INF/views/include/bs.jsp"%> --%>

<!-- 포트원 결제 -->
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>

<!-- jQuery 중복이라 막음-->
<!-- <script type="text/javascript" -->
<!-- 	src="https://code.jquery.com/jquery-1.12.4.min.js"></script> -->


<!-- iamport.payment.js -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<!-- 포트원 결제 -->
<script src="/resources/js/payment/payment.js"></script>
<!-- 모달창 스크립트 -->
<script src="/resources/js/modal/paymentModal.js"></script>
<!-- 구글 글리피콘 -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
	
<div class="modal fade" id="modal-payment" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h3 class="modal-title" id="myModalLabel">
					<span class="material-symbols-outlined"> credit_card_heart </span>포인트
					충전
				</h3>
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body">
				<div>
					<div class="form-group d-flex justify-content-center">
						<h4>충전금액</h4>
					</div>
					<div class="d-flex justify-content-center">
						<select class="form-control"
							style="width: 40%; text-align: right;" id="chargePoint">
							<option value="1000">1,000원</option>
							<option value="5000">5,000원</option>
							<option value="10000">10,000원</option>
							<option value="30000">30,000원</option>
							<option value="50000">50,000원</option>
							<option value="100000">100,000원</option>
						</select>
					</div>
					<div class="form-group d-flex justify-content-center"
						style="padding-top: 10px;">
						<h4>보유금액</h4>
					</div>
					<div class="d-flex justify-content-center">
						<input class="form-control" type="number" id="point" readonly
							style="text-align: right; width: 40%; margin-left: 20px;">
						<h4
							style="margin-bottom: 0px; padding-top: 5px; padding-left: 5px;">원</h4>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<img style="cursor: pointer; width: 100px; height: 40px;"
					alt="resource preview" id="payment"
					src="/resources/payment/kakaopay/payment_icon_yellow_medium.png">
				<button type="button" class="btn btn-danger" data-dismiss="modal">결제취소</button>
			</div>
		</div>
	</div>
</div>