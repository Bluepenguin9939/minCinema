<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="/WEB-INF/views/include/bs.jsp" %>
<%@ include file="/WEB-INF/views/include/top.jsp" %>

<head>
<link rel="stylesheet" href="/resources/css/notice.css?after" type="text/css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">
<!-- <meta name="viewport" content="width=device-width,initial-scale=1.0"> -->
<style>

</style>

</head>
<!-- list(게시판) 양식 -->
<body>
	<div class="notice d-flex justify-content-center" > 
		<div class="notice-top" >
		
			<h2 class="notice-body" title="공지사항" > <i class="fa fa-headset"></i>1대1문의</h2>
			<section>
		   	 <ul class="nav" title="공지사항그룹">
					  <li class="nav-item">
					    <a class="nav-link" href="/notice/ham_notice">공지사항</a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link" href="/notice/ham_often">자주묻는질문</a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link" href="/notice/ham_inquiry">1대1문의</a>
					  </li> 
			  </ul>
			</section>
		<!-- 1대1 문의틀 -->
<div class="col-md-12">
				<form role="form">
				
					<div class="form-group">
						<label for="exampleInputPassword1"> 문의하실 고객님 아이디 </label> 
						<input type="text" class="form-control" id="exampleInputPassword1"/>
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1"> 문의 제목 </label> 
						<input type="text" class="form-control" id="exampleInputPassword1"/>
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1"> 문의 내용 </label><br>
						<textarea style="width: 100%; height: 6.25em;  resize: none;"></textarea> 

  
					</div>
					<div class="form-group">

						<input type="file" class="form-control-file" id="exampleInputFile" />
					</div>
					<button type="submit" class="btn btn-primary">Submit</button>
				</form>
			</div>
<!-- 			<div class=""> -->
<!-- 				<div class="col-md-12"> -->
<!-- 					<div class="inquiry"> -->
<!-- 						<h2>1대1 문의하기</h2> -->
<!-- 						<hr style="border: 0; height: 5px; background-color: #000000;"> -->
<!-- 					</div> -->
<!-- 					<div class="d-flex firstInput"> -->
<!-- 						<h3 style="margin-right: 50px;">문의제목</h3> -->
<!-- 						<input type="text" placeholder="문의하실 내용의 제목을 적어주세요." size="170"> -->
<!-- 					</div> -->
<!-- 					<div class="d-flex secondInput" style="margin-top: 20px;"> -->
<!-- 						<h3 style="margin-right: 50px;">문의내용</h3> -->
<!-- 						<textarea cols="173" rows="5" placeholder="신속하고 정확한 안내를 위해 상세하게 작성해주세요."></textarea>  -->
<!-- 					</div> -->
<!-- 					<div class="d-flex firstInput" style="margin-top: 20px;"> -->
<!-- 						<h3 style="margin-right: 20px;">이메일 주소</h3> -->
<!-- 						<input type="text" placeholder="ex)example@naver.com" size="170"> -->
<!-- 					</div> -->
<!-- 					<div style="margin-top: 20px;"> -->
<!-- 						<input type="file"> -->
<!-- 					</div> -->
<!-- 					<div style="margin-top: 20px;"> -->
<!-- 					<button>문의사항 제출</button> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
		<!-- 1대1문의 모달창 -->
<!-- 		<div class="col-md-12"> -->
<!-- 		<div class="card"> -->
<!-- 			 <a id="modal-950190" href="#modal-container-950190" role="button" class="btn" data-toggle="modal">Launch demo modal</a> -->
			
<!-- 			<div class="modal fade" id="modal-container-950190" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"> -->
<!-- 				<div class="modal-dialog" role="document"> -->
<!-- 					<div class="modal-content"> -->
<!-- 						<div class="modal-header"> -->
<!-- 							<h5 class="modal-title" id="myModalLabel"> -->
<!-- 								Modal title -->
<!-- 							</h5>  -->
<!-- 							<button type="button" class="close" data-dismiss="modal"> -->
<!-- 								<span aria-hidden="true">×</span> -->
<!-- 							</button> -->
<!-- 						</div> -->
<!-- 						<div class="modal-body"> -->
<!-- 							... -->
<!-- 						</div> -->
<!-- 						<div class="modal-footer"> -->
							 
<!-- 							<button type="button" class="btn btn-primary"> -->
<!-- 								Save changes -->
<!-- 							</button>  -->
<!-- 							<button type="button" class="btn btn-secondary" data-dismiss="modal"> -->
<!-- 								Close -->
<!-- 							</button> -->
<!-- 						</div> -->
<!-- 					</div> -->
					
<!-- 				</div> -->
				
<!-- 			</div> -->
			
<!-- 		</div> -->
<!-- 		</div> ddd  -->
	</div>
	</div>

<%@ include file="/WEB-INF/views/include/bottom.jsp" %>
</body>
