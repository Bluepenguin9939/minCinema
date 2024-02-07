/**
 *  myInfo.js
 */
 var id;

 function inputEvent(e) {
 	if (e.code == 'Enter' || e.code == 'NumpadEnter') {
        $(".btnCheck").click();
    }
 }
 
 function resign(mid) {
 	$("#resignModal").modal({backdrop: 'static', keyboard: false});
 	id = $(mid).attr("href");
 	$("#resultCheckPassword").text("");
 	$("#inPassword").val("");
 	$("#inPassword").prop("disabled",false);
 	$(".btnCheck").prop("disabled",false);
 	$(".btnResign").prop("disabled",true);
 }
 
 function btnPasswordCheck(btnCheck) {
 	var password = $("#inPassword").val();
	var url = "/myPage/heo_checkPassword";
	var sData = {mid:id,mpw:password};
	$.post(url,sData,function(rData){
		if(rData){
			// 비밀번호 체크 성공
		 	$("#inPassword").prop("disabled",true); 	
		 	$(btnCheck).prop("disabled",true);
		 	$("#resultCheckPassword").css("color","green");
		 	$("#resultCheckPassword").text("비밀번호 일치");
		 	$(".btnResign").prop("disabled",false);
		} else {
			// 비밀번호 체크 실패
		 	$("#resultCheckPassword").css("color","red");
		 	$("#resultCheckPassword").text("비밀번호가 틀립니다.");
		}
	});
 }
 
 function btnResign() {
 	var result = confirm("탈퇴시 모든 정보가 복구 되지 않습니다.\n같은 아이디를 사용할수 없습니다.\n정말 탈퇴하시겠습니까?");
 	if (result) {
	 	var url = "/member/updateBen";
	 	var sData = {mactive:'F',mid:id};
	 	$.post(url, sData, function(rData){
	 		if(rData) {
	 			alert("이용해주셔서 감사합니다.");
	 			location.href="/member/jo_login";
	 		}
	 	});
 	}
 }