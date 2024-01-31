<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="modal fade" id="addNoticeModal" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h3 class="modal-title" id="myModalLabel">공지 추가</h3>
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body"><h3>공지 제목</h3>
			<input class="form-control notice-modal-title" style="width: 30%;" type="text" placeholder="공지 제목">
			</div>
			<div class="modal-body"><h3>공지 내용</h3>
			<textarea class="form-control notice-modal-content" placeholder="공지 내용" rows="20" style="resize: none;"></textarea>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-success" id="btncomplete">작성 완료</button>
				<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
			</div>
		</div>
	</div>
</div>