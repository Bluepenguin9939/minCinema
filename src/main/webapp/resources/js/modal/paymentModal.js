/**
 * paymentModal.js
 */

 $(function(){
	 //포인트 충전 id 혹은 class 
	$(".btn-point-charge").click(function(e){
		e.preventDefault();
		$("#modal-payment").modal("show");
	});
 });