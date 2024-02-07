<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.modal {
        text-align: center;
}

@media screen and (min-width: 768px) {
	.modal:before {
		display: inline-block;
		vertical-align: middle;
		content: " ";
		height: 100%;
	}
}

.modal-dialog {
        display: inline-block;
        text-align: left;
        vertical-align: middle;
}
</style>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="modal fade" id="resignModal" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content modal-sm">
						<div class="modal-header">
							<h5 class="modal-title" id="myModalLabel">회원 탈퇴</h5>
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body" style="text-align: center;">
							<h5>비밀번호 확인</h5>
							<div style="display: flex; justify-content: center;">
								<input type="password" class="form-control" id="inPassword"
									style="width: 45%; margin-right: 10px;" onkeyup="return inputEvent(event);">
								<button class="btn btn-primary btnCheck" style="border: none;" onclick="btnPasswordCheck(this)">확인</button>
							</div>
							<label id="resultCheckPassword"></label>
						</div>
						<div class="modal-footer">
							<button type="button" onclick="btnResign();"
								class="btn btn-danger btnResign">회원 탈퇴</button>
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">취소</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>