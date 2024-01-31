/**
 *  addNoticeModal.js
 */
$(function(){
	var title = "";
	var content = "";
	var titleNum = "";
	var url = "";
	var sData = {};
	$(".btnAddNotice").click(function(){
		$("#addNoticeModal").modal("show");
	});	
	$("#btncomplete").click(function(){
		title = $(".notice-modal-title").val();
		content = $(".notice-modal-content").val();
		url = "/admin/heo_addNotice";
		sData = {
			ntitle : title,
			ncontent : content
		};
		$.post(url, sData, function(rData){
			if (rData) {
				alert("공지 추가 완료");
				$("#addNoticeModal").modal("hide");
				location.href="/admin/heo_addNotice";
			}
		});
	});
	$(".titleNum").click(function(e){
		e.preventDefault();
		titleNum = $(this).attr("href");
		title = $(this).text();
		content = $(this).attr("data-content");
		$(".notitle").css("display", "none");
		$(".notice-one-title").attr('readonly', true);
		$(".notice-one-content").attr('readonly', true);
		$("#btnModify").css("display","block");
		$("#btnModifyComplete").css("display","none");
		$("#btnDel").css("display","block");
		$(".mntitle").text(title);
		$(".notice-one-title").val(title);
		$(".notice-one-content").val(content);
		$("#noticeContentModal").modal("show");
	});
	$("#btnModify").click(function(){
		$(".mntitle").text("공지 수정");
		$(".notitle").css("display", "block");
		$(".notice-one-title").attr('readonly', false);
		$(".notice-one-content").attr('readonly', false);
		$("#btnModify").css("display","none");
		$("#btnModifyComplete").css("display","block");
		$("#btnDel").css("display","none");
	});
	$("#btnDel").click(function(){
		url = "/admin/heo_delNotice";
		sData = {
			nno : titleNum
		};
		$.post(url, sData, function(rData){
			if (rData) {
				alert("공지 삭제 완료");
				location.href="/admin/heo_addNotice";
			}
		});
	});
	$("#btnModifyComplete").click(function(){
		var modifyTitle = $(".notice-one-title").val();
		var modifyContent = $(".notice-one-content").val();
		url = "/admin/heo_modifyNotice"
		sData = {
			nno : titleNum,
			ntitle : modifyTitle,
			ncontent : modifyContent
		};
		$.post(url, sData, function(rData){
			if(rData) {
				alert("공지 수정 완료");
				location.href="/admin/heo_addNotice";
			}
		});
	});
});