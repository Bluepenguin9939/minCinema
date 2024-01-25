<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="/WEB-INF/views/include/ad_sidebar.jsp" %>
<%@ include file="/WEB-INF/views/include/ad_topbar.jsp" %>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="stylesheet" href="/resources/css/admin/addmovie.css?after" type="text/css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Image Upload Example</title>
<script>

</script>
</head>

<body>
	<div class="notice d-flex justify-content-center" > 
		<div class="admin-top" >
			<h2 class="admin-body" title="" >영화 추가</h2>
	</div>
</div>
<!--  		칸나누기 -->
 <form action=""  enctype="multipart/form-data">
	<div class="col-md-12" style="margin-left: 10%;" >
			<div class="">
				<div class="col-md-2 cardV" >
				<div class="card-body" title="중앙쓰"> 
				<label for="chooseFile" title="사진규격" style="cursor: pointer;">
				사진(198x288)
				</label>
 			    </div>
				</div>
	  <input type="file" id="chooseFile" name="chooseFile" accept="image/*" onchange="loadFile(this)"
	  	style="visibility: hidden;">
				<div class="col-md-10 si">
					<input type="text" placeholder="영화 제목" size="100">
					<div>
					<textarea id="" rows="3" cols="100" placeholder="상세 내용"></textarea>
					</div>
					<div class="quarter">
					<input class="" type="text" placeholder="개봉일" >
					<input class="movieText" type="text" placeholder="연령" >
					<input class="movieText" type="text" placeholder="시간" >
					<input class="movieText" type="text" placeholder="장르" >
					</div>
					<div>
						<i class="fa fa-video"></i><label for="chooseVideo" style="cursor: pointer;">동영상 업로드</label>
					</div>
						<input type="file" id="chooseVideo" name="chooseVideo" accept="video/*" onchange="loadFile(this)" style="visibility: hidden;">
				</div>
					<div>
						<i class="fa fa-link"></i> <input type="text" placeholder="동영상 URI 등록"> <button type="submit">작성완료</button>
					</div>
			</div>
		</div>
	</form>
</body>
