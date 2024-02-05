/**
 * notice.js
 */
 
 $.get("/notice/heo_noticeList",function(rData){
 	$("#notice-list").append(rData);
 });

 function getContent(nno){
	 var noticeNnoTd = $(nno).parent().prev();
	 var noticeTbody = $(nno).parent().parent();
	 var nno = Number(noticeNnoTd.text());
	 console.log(nno);
	 var url = "/notice/selectNotice";
	 var sData = {nno: nno};
	 var content = "";
	 $.get(url, sData, function(rData){
		 content += "<tr class='afterTr'><th colspan='4'>공지 내용</th></tr>";
		 content += "<tr class='afterTr'><td colspan='4'>"+ rData +"</td></tr>";
		 content += "<tr class='afterTr'><td colspan='4'><button class='btn btn-danger btnClose'>접기</button></td></tr>";
		 noticeTbody.after(content);
	 });
	 $(document).on("click",".btnClose",function(){
		$(this).parent().parent().prev().prev().remove(); 
		$(this).parent().parent().prev().remove(); 
		$(this).parent().parent().remove(); 
	 });
 }
 
 function changePages(pageNum) {
 	var pageNum = $(pageNum).attr("href");
 	var url = "/notice/heo_noticeList";
 	var sData = {
 		pageNum : pageNum
 	};
 	$.get(url, sData, function(rData){
 		$("#notice-list").empty();
 		$("#notice-list").append(rData);
 	});
 }