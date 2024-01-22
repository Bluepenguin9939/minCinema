<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/top.jsp"%>
<!-- 포트원 결제 -->
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<!-- jQuery -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<!-- 포트원 결제 -->
<script src="/resources/js/payment/payment.js"></script>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-3"></div>
		<div class="col-md-6 d-flex justify-content-center"
			style="height: 85vh;">
			<div>
				<br>
				<h3>
					<span class="material-symbols-outlined"> credit_card_heart </span>포인트
					충전
				</h3>
				<hr>
				<form role="form" method="get" style="padding-top: 85px;">
					<div class="form-group d-flex justify-content-center">
						<h4>충전금액</h4>
					</div>
					<div class="d-flex justify-content-center">
						<select class="form-control" style="width: 80%;" id="point">
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
						<button type="button" id="payment" class="btn btn-success btn-lg">충전하기</button>
						
					</div>
				</form>
			</div>
		</div>
		<div class="col-md-3"></div>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/bottom.jsp"%>