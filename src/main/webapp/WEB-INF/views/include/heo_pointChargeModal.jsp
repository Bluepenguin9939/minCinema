<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!--  만약 디자인이 이상할시 주석해제 -->
<%-- <%@ include file="/WEB-INF/views/include/bs.jsp"%> --%>


<!-- jQuery 중복이라 막음-->
<!-- <script type="text/javascript" -->
<!-- 	src="https://code.jquery.com/jquery-1.12.4.min.js"></script> -->


<script>

</script>
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
						<h4>보유포인트</h4>
					</div>
					<div class="d-flex justify-content-center">
						<input class="form-control" type="text" id="point" readonly
							style="text-align: right; width: 40%; margin-left: 20px;"
							value="<fmt:formatNumber value="${loginInfo.mpoint}" pattern="#,###"/>">
						<h4
							style="margin-bottom: 0px; padding-top: 5px; padding-left: 5px;">P</h4>
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
<!-- 포트원 결제 -->
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<!-- 모달창 스크립트 -->
<script src="/resources/js/modal/paymentModal.js"></script>
<script>
$(function() {
	$("#payment").click(function(e) {
		e.preventDefault();
		var buyerTel = "${loginInfo.mtel}";
		var buyerId = "${loginInfo.mid}";
		
		var point = $("#chargePoint").val();
		

    	let pg = "kakaopay";
    	let payMethod = "card";
		const orderNumber = createOrderNum();
		IMP.init('imp32042807');
        IMP.request_pay({
            pg: pg,
            pay_method : payMethod,
            merchant_uid : orderNumber,
            name : "포인트 충전",
            amount: point,
            buyer_name : buyerId,
            buyer_tel : buyerTel
        }, function(rsp) {
			if (rsp.success) {
				console.log("asd:",rsp.buyer_name);
				$.ajax({    
					url : '/point/charge', // 요청 할 주소   
					method : 'post', // GET, PUT    
					data: {        
						mid : buyerId,
						ppoint : rsp.paid_amount,
						pcode : 'PC'}, // 전송할 데이터    
// 					dataType: 'text', // xml, json, script, html    
// 					beforeSend: function(jqXHR) {}, // 서버 요청 전 호출 되는 함수 return false; 일 경우 요청 중단    
					success: function(rData) {
						if (rData == "true") {
							alert("충전 성공");
							location.href= window.location.href;
						} else if (rData == "false"){
							alert("다시 시도해주세요.");
						}
					} // 요청 완료 시    
// 					error: function(jqXHR) {}, // 요청 실패.    
// 					complete: function(jqXHR) {} // 요청의 실패, 성공과 상관 없이 완료 될 경우 호출
					});
				$("#modal-payment").modal("hide");
			} else {
				alert(point + "원 충전 실패.");	
				$("#modal-payment").modal("hide");
			}
		});
	});
});

// 주문번호 생성 함수
function createOrderNum() {
    const date = new Date();
    const year = date.getFullYear();
    const month = String(date.getMonth() + 1).padStart(2, "0");
    const day = String(date.getDate()).padStart(2, "0");
 
    let orderNum = year + month + day;
    for (let i = 0; i < 5; i++) {
        orderNum += Math.floor(Math.random() * 8);
    }
    return parseInt(orderNum);
}
</script>