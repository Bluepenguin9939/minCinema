/**
 * notice.js
 */

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
 
 function changePages() {
	 console.log("ddd");
 }