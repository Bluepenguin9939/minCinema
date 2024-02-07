<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="/WEB-INF/views/include/ad_sidebar.jsp" %>
<%@ include file="/WEB-INF/views/include/ad_topbar.jsp" %>

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="stylesheet" href="/resources/css/admin/addmovie.css" type="text/css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>영화 일정 추가</title>

<style>

.scroll{
	padding-top: 5px;
    align-items: center;
    height: 550px;
    overflow: scroll; /*스크롤바 생성*/
    overflow-x: hidden; /*x축 스크롤바 숨기기*/
}

.scroll::-webkit-scrollbar{
    width: 15px;
}

.scroll::-webkit-scrollbar-thumb{
    background-color: #9b54ba;
    /* 스크롤바 둥글게 설정    */
    border-radius: 10px;
}

.scroll::-webkit-scrollbar-track{
    background-color: 	#e4e4f8;
}



</style>


<script>

$(function(){
	$.post("/admin/movieTitleLists",function(rData){
		var movieList = rData;
		$.each(movieList,function(i,value){
			$(".movieList").append("<tr class='movieListRow'>"
					+"<td style='border-right: 1px solid #999999;'>"+value.mov_code+"</td>"
					+"<td>"+value.mov_title+"</td>"
					+"<td class='text-center'>"+value.mov_releaseDate+"</td>"
					+"<td class='text-center'>"+value.mov_runtime+"</td>"
					+"<td class='d-flex  justify-content-center'><button type='button' class='movieDelete'>삭제</button></td>"
				+"</tr>");
		});
		
	});
	
	$(document).on("click",".movieDelete",function(){
		/*삭제기능 예정*/
		console.log("영화삭제");
	});
	
	
	
});

</script>

</head>

<body>
	<div class="notice d-flex justify-content-center"> 
		<div style="width: 70%; display: flex;"
			class="flex-column">
			
			<div class="admin-top">
				<h2 class="admin-body">영화 목록</h2>
			</div>
			
			<div class="scroll">
				<table class="table table-borderless">
					<thead style="border-top: 1px solid #999999;font-size: 24px;">
						<tr>
							<th>영화 코드</th>
							<th >영화 이름</th>
							<th class='text-center'>영화 상영일</th>
							<th class='text-center'>영화 런타임</th>
							<th class='text-center'>영화 삭제</th>
						</tr>
					</thead>
					<tbody class="movieList" 
						style="font-size: 19px;border-bottom: 1px solid #999999;border-top: 1px solid #999999;">
							
					</tbody>
				</table>
			</div>
			
			
			<div class="d-flex justify-content-end">
				
			</div>
			
		</div>
		
	</div>
	
	
	<!-- 칸나누기 -->
 	
	
	
</body>
