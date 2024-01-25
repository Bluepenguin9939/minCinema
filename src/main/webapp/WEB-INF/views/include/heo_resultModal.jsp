<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
	$(function() {
		var loginResult = "${loginResult}";
		console.log(loginResult);
		if (loginResult == "fail") {
			$("#result-modal").modal("show");
		}
	});
</script>
<div class="modal fade" id="result-modal" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h3 class="modal-title" id="myModalLabel">로그인 실패</h3>
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body" id="resultModalBody">아이디 혹은 비밀번호를 확인해주세요.</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-success" id="btnLogin">로그인</button>
				<button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>