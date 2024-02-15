<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
 $(function(){
	$(".mov-details-btn-payment").click(function(){
		///console.log("aaa", );
		
		var loginInfo = "${loginInfo}";
		if (loginInfo == "") {
			$("#payLoginModal").modal("show");
		} else {
			location.href="/ticketing/booking?mov_code="+${movieDetail.mov_code};
		}
	});
	$("#btnLogin").click(function(){
		location.href="/member/jo_login";
	});
 });
</script>
<div class="modal fade" id="payLoginModal" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h3 class="modal-title" id="myModalLabel">로그인이 필요합니다.</h3>
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body" id="resultModalBody">로그인 하시겠습니까?</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-success" id="btnLogin">로그인</button>
				<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
			</div>
		</div>
	</div>
</div>