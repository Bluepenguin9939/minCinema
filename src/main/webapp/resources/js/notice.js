/**
 * notice.js
 */
 
 $.get("/notice/heo_noticeList",function(rData){
 	$("#notice-list").append(rData);
 });

 function getContent(nno){
	 var title = $(nno).text();
	 var noticeNnoTd = $(nno).parent().prev();
	 var noticeTr = $(nno).parent().parent(); 
	 var nno = Number(noticeNnoTd.text());
	 var url = "/notice/selectNotice";
	 var sData = {nno: nno};
	 $.get(url, sData, function(rData){
		 var content = "";
		 content += "<tr class='afterTr'><th colspan='4'><h3>" + title + "</h3><hr>";
		 content += rData + "<br><br>";
		 content += "<button class='btn btn-danger btnClose'>접기</button></th></tr>";
		 noticeTr.after(content);
	 });
 	 $(document).on("click",".viewContent",function(){
 	 	$(".afterTr").remove();
 	 });
 	 
	 $(document).on("click",".btnClose",function(){
		$(".afterTr").remove(); 
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