/**
 * payment.js
 */
$(function() {
	$("#payment").click(function() {
		var point = $("#chargePoint").val();
		let pg = "";
    	let payMethod = "";
    	pg = "kakaopay";
    	payMethod = "card";
		const orderNumber = createOrderNum();
		IMP.init('imp32042807');
        IMP.request_pay({
            pg: pg,
            pay_method : payMethod,
            merchant_uid : orderNumber,
            name : "포인트 충전",
            amount: point,
            buyer_name : "허성민",
            buyer_tel : "010-1234-5678"
        }, function(rsp) {
			if (rsp.success) {
				//결제 성공시 데이터 테이블 추가 문구 작성해야함
				alert(point + "원 충전 완료.");
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