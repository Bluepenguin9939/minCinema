/**
 * paymentModal.js
 */

 $(function(){
	 //포인트 충전 id 혹은 class 
	$(".mov-details-btn-payment").click(function(e){
		e.preventDefault();
		$("#modal-payment").modal("show");
	});
 });