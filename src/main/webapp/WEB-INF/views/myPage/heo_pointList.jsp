<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
$(function(){
	$(".pages").click(function(e){
		e.preventDefault();
		var pageNum = $(this).attr("href");
		var frmCriteria = $("#frmCriteria");
		var url = "/point/pointList";
		var sData = {
			mid : "${loginInfo.mid}",
			pageNum : pageNum
		};
		$.get(url, sData, function(rData){
			$("#point-history-tab").empty();
			$("#point-history-tab").append(rData);
// 			console.log($("#point-history-tab"));
		});
	});
});
</script>
<%@ include file="/WEB-INF/views/include/heo_frmCriteria.jsp" %>
<br>
<h5>이용 내역</h5>
<table class="table table-borderless">
	<tbody style="border-bottom: 1px solid #999999;">
		<c:forEach var="vo" items="${pointInfoList}">
			<tr class='point-history-tr'
				style='border-bottom: 1px solid #999999;'>
				<td><i
					class='fab fa-product-hunt align-self-center table-point-i'></i></td>
				<td
					style='padding: 0px; padding-top: 15px; padding-bottom: 15px; text-align: center; vertical-align: middle;'>${vo.pdate}</td>
				<td
					style='padding: 0px; padding-top: 15px; padding-bottom: 15px; text-align: center; vertical-align: middle;'>${vo.pcode}</td>
				<td
					style='padding: 0px; padding-top: 15px; padding-bottom: 15px; text-align: center; vertical-align: middle;'>${vo.ppoint}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<div class="page">
	<ul class="pagination pModal">
		<li><a href="${pageMaker.startPage}" class="first pages">처음 페이지</a></li>
		<c:if test="${pageMaker.prev == true}">
			<li><a href="${pageMaker.startPage - 1}" class="arrow left pages">&laquo;</a></li>
		</c:if>
		<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="v">
			<li><a href="${v}" class="${(pageMaker.heo_PointCriteria.pageNum == v)? 'active' : ''} num pages">${v}</a></li>		
		</c:forEach>
		<c:if test="${pageMaker.next == true}">
			<li><a href="${pageMaker.endPage + 1}" class="arrow right pages">&raquo;</a></li>
		</c:if>
		<li><a href="${pageMaker.endPage}" class="last pages">끝 페이지</a></li>
	</ul>
</div>