<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="/WEB-INF/views/include/top.jsp"%>

<head>
<link rel="stylesheet" href="/resources/css/inquiry.css"
	type="text/css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<!-- <meta name="viewport" content="width=device-width,initial-scale=1.0"> -->
<script>
$(function(){
	$(".inquiryTitle").click(function(e){
		e.preventDefault();
		var that = $(this).attr("data-remessage");
		$("#modal-container-000000").modal("show");
		$("#remessage").val(that);
	});

});	
	
	
</script>

</head>
<!-- list(게시판) 양식 -->
<body>
	
	<div class="inquiry d-flex justify-content-center">
		<div class="inquiry-top">

			<h2 class="notice-body" title="공지사항">
				<i class="fa fa-headset"></i>1대1문의
			</h2>
			<section>
				<ul class="nav" title="공지사항그룹">
					<li class="nav-item">
					<a class="nav-link" id="notice" href="/notice/ham_notice">공지사항</a></li>
					<li class="nav-item">
					<a class="nav-link" id="often" href="/notice/ham_often">자주묻는질문</a></li>
					<li class="nav-item">
					<a class="nav-link" id="inquiry" href="/notice/ham_inquiry">1대1문의</a></li>
				</ul>
			</section>
			<!-- 1대1 문의틀 -->

			<div class="inquiryOne">
				<form role="form" action="/notice/ono" method="post">
					<input type="hidden" name="msg_id" value="${loginInfo.mid}">
					<input type="hidden" name="sender" value="${loginInfo.mid}">
					<input type="hidden" name="receiver" value="admin"> <a
						id="inquiryModal" href="#modal-container-560730" role="button"
						class="btn btn-danger pulse" data-toggle="modal">1대1 문의 하기</a>

					<div class="modal fade" id="modal-container-560730" role="dialog"
						aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog modal-lg" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="myModalLabel">고객 문의</h5>
									<button type="button" class="close" data-dismiss="modal">
										<span aria-hidden="true">×</span>
									</button>
								</div>
								<div class="modal-body">
									<label for="exampleInputPassword1"> 문의 제목 </label> <input
										type="text" name="mtitle" placeholder="문의하실 제목을 입력해주세요."
										class="form-control" id="exampleInputPassword1" />
								</div>
								<div>
									<label id="inquiryTitle" for="exampleInputPassword1">
										문의 내용 </label><br>
									<textarea id="inquiryMean" class="form-control" name="message"
										placeholder="요청하실 내용을 상세하게 작성해주세요."></textarea>
								</div>
								<div class="modal-footer">

									<button type="submit" class="btn btn-primary">보내기</button>
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">닫기</button>
								</div>
							</div>

						</div>

					</div>
				</form>
			</div>
			<!-- 문의 테이블 -->
						<!-- 답장 모다르 -->
			
						<div class="" style="display: flex; justify-content: center">
				<form role="form" action="/admin/sendReply" method="post" id="frmresend">
					<input type="hidden" name="msg_id">
					<a id="modal-000000" href="#modal-container-000000" role="button"
						class="btn btn-warning" data-toggle="modal"
						style="font-size: 35px; display: none;">1대1 문의 하기</a>

					<div class="modal fade" id="modal-container-000000" role="dialog"
						aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog modal-lg" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="myModalLabel">고객 문의</h5>
									<button type="button" class="close" data-dismiss="modal">
										<span aria-hidden="true">×</span>
									</button>
								</div>
								<div>
									<label style="margin-left: 15px;" for="remessage">
										답변 내용 </label><br>
									<textarea class="form-control" name="remessage" id="remessage"
										style="height: 6.25em; margin-left: 15px; width: 766px;" readonly></textarea>
								</div>
								<div class="modal-footer">
									
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">닫기</button>
								</div>
							</div>

						</div>

					</div>
				</form>
			</div>
			<div>
				<table class="table table-hover">
					<thead>
						<!-- 관리자용과 게시판 공용 사용하되 이름(컬럼명은 변경해야함)  -->
						<tr id="table-inquiry">
							<th>#</th>
							<th>문의제목</th>
							<th>문의날짜</th>
							<th>답변상태</th>
							<th></th>
						</tr>
					</thead>
					<!-- 임시 -->
					<tbody>
						<c:forEach var="vo" items="${list}">
							<tr>
								<td>${vo.rn}</td>
								<td><a href="${vo.msg_id}" class="inquiryTitle" data-remessage="${vo.remessage}">${vo.mtitle}</a></td>
								<td>${vo.send_date}</td>
								<c:if test="${vo.open_date == null}"><td class="waitReply">답변대기중</td></c:if>								
								<c:if test="${vo.open_date != null}"><td class="completeReply">답변완료</td></c:if>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>

	<%@ include file="/WEB-INF/views/include/bottom.jsp"%>
</body>