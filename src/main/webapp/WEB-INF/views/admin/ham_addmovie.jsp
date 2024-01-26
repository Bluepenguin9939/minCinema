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



<!-- // $(function(){ -->
<!-- // 	$("#chooseFile").on("dragenter dragover", function (e){ -->
<!-- // 		e.preventDefault(); -->
<!-- // 	}); -->
	
<!-- // 	$("#chooseFile").on("drop", function (e){ -->
<!-- // 		e.preventDefault(); -->
<!-- // 		console.log(e.originalEvent.dataTransfer.files); -->
<!-- // 		var files = e.originalEvent.dataTransfer.files; -->
<!-- // 		console.log("파일즈:",files); -->
<!-- // 		// UploadController에 파일 보내고, 처리결과(rData) -> [] 확인 -->
<!-- // 		// <form> -->
<!-- // 		//    <input name="uploadFile"> : files의 갯수 만큼 -->
<!-- // 		//    <input name="uploadFile"> : files의 갯수 만큼 -->
<!-- // 		//    <input name="uploadFile"> : files의 갯수 만큼 -->
<!-- // 		//      -> ajax 요청 -->
<!-- // 		//          -> 응답 데이터 출력 -->
		
<!-- // 		var formData = new FormData(); // <form> -->
<!-- // 		for (var v = 0; v < files.length; v++) { -->
<!-- // 			formData.append("uploadFile", files[v]); -->
<!-- // 		} -->
<!-- // }); -->
<!-- // });	 -->

<!-- // $(function(){ -->
<!-- // 	var fileClone = $("#fileMove > input").clone(); -->
<!-- // 	var maxSize = 999999999; -->
<!-- // 	var regex = new RegExp("(.*?)\.(exe|sh|zip|alz$)"); -->
<!-- // 	function checkExtension(fileName, fileSize){ -->
<!-- // 		if(fileSize >= maxSize){ -->
<!-- // 			alert("파일 용량 초과"); -->
<!-- // 			return false; -->
<!-- // 		} -->
<!-- // 		if(regex.test(fileName)){ -->
<!-- // 			alert("해당 종류의 파일은 업로드 불가") -->
<!-- // 			return false; -->
<!-- // 		} -->
<!-- // 		return true; -->
<!-- // 	} -->
<!-- // }); -->

</head>

<body>
	<div class="notice d-flex justify-content-center" > 
		<div class="admin-top" >
			<h2 class="admin-body" title="" >영화 추가</h2>
	</div>
</div>
<!--  		칸나누기 -->
 <form action="" method=""  enctype="multipart/form-data">
	<div class="col-md-12" style="margin-left: 10%;" >
			<div class="fileMove-card">
				<div class="profile-images" >
				<img alt="" src="/resources/img/moviedefault.jpg" id="upload-img">
				</div>
				<div class="custom-file">
				<label class="main_image_text" id="te" for="fileupload">영화 사진 추가</label>
	  				<input type="file" id="fileupload" name="image" accept="image/*">
  				</div>
				<div class="col-md-10 si">
					<input type="text" placeholder="영화 제목" size="100px;">
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
						<i class="fa fa-link"></i> <input type="text" placeholder="동영상 URI 등록"> <input type="submit">
					</div>
			</div>
		</div>
	</form>
<script>
$(function(){
	$("#fileupload").change(function(event){
		var x = URL.createObjectURL(event.target.files[0]);
		console.log(x);
		$("#upload-img").attr("src",x);
// 		var x = event.target.files[0].name; 이미지 이름 가져오기
// 		console.log(x);
// 			$(".filename").text(x);
	});
	$("#te").click(function(){
		var that = $(this);
		console.log(that);
		that.show();
	})
});
</script>
</body>
