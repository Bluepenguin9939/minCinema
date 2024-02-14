function updateBen(mid) {
	var mid = $(mid).attr("href");
	var result;
	$.post("/member/getActive",{mid:mid},function(rData){
		if(rData == "Y") {
			result = confirm(mid+"유저의 활동을 정지시키겠습니까?");
			if(result) {
				$.post("/member/updateBen",{mid:mid,mactive:'N'},function(rData){
					if(rData) {
						alert(mid+"유저의 활동이 정지되었습니다.");
						location.href="/admin/ham_cmanagement";
					}
				});
			}
		} else {
			result = confirm(mid+"유저의 활동정지를 해제시키겠습니까?");
			if(result) {
				$.post("/member/updateBen",{mid:mid,mactive:'Y'},function(rData){
					if(rData) {
						alert(mid+"유저의 활동이 해제되었습니다.");
						location.href="/admin/ham_cmanagement";
					}
				});
			}
		}
	});
}