/**
 * certification.js
 */
function checkMyInfo() {
	var result = confirm("본인인증이 필요합니다. 인증하시겠습니까?");
	if (result) {
 		IMP.init("imp32042807");
		IMP.certification({
		    pg: "inicis_unified",
		  },function(rsp){
		  	if(rsp.success) {
		  		alert("본인인증 성공.");
		  		location.href="/member/jo_register";
		  	} else {
		  		alert("본인인증에 실패했습니다.");
		  	}
		  });
	}
}