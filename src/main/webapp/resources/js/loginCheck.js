/**
 * loginCheck.js
 */
 
function loginEnter(e) {
 	if (e.code == 'Enter' || e.code == 'NumpadEnter') {
        loginCheck();
    }
 }
 
function loginCheck() {
	var id = $("#uid").val();
	var url = "/member/getActive";
	var sData = {mid:id};
	$.post(url, sData, function(rData){
		console.log(rData);
		if (rData == "Y") {
			$("#loginCheck").submit();
		} else if (rData == "N") {
			alert("활동이 정지된 회원입니다.");
		} else if (rData == "F") {
			alert("탈퇴된 회원입니다.");
		} else {
			alert("아이디 혹은 비밀번호를 확인해주세요.");
		}
	});
}