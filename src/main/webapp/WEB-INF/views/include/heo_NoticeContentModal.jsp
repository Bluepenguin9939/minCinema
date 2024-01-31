<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="modal fade" id="noticeContentModal" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h3 class="modal-title notice-title mntitle">공지 내용</h3>
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body notitle" style="display: none;"><h3>공지 제목</h3>
			<input class="form-control notice-one-title" style="width: 30%;" type="text" placeholder="공지 제목" readonly>
			</div>
			<div class="modal-body"><h3>공지 내용</h3>
			<textarea class="form-control notice-one-content" placeholder="공지 내용" rows="20" style="resize: none;" readonly></textarea>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-success" id="btnModify">공지 수정</button>
				<button type="button" class="btn btn-success" id="btnModifyComplete" style="display: none;">수정 완료</button>
				<button type="button" class="btn btn-danger" data-dismiss="modal" id="btnDel">공지 삭제</button>
			</div>
		</div>
	</div>
</div>