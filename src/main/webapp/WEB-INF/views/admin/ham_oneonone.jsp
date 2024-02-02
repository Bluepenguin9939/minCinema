<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="/WEB-INF/views/include/ad_sidebar.jsp" %>
<%@ include file="/WEB-INF/views/include/ad_topbar.jsp" %>

<head>
<link rel="stylesheet" href="/resources/css/admin/oneonone.css?after" type="text/css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">
<!-- <meta name="viewport" content="width=device-width,initial-scale=1.0"> -->
<script>
$(function(){
	$(".mtitle").click(function(e){
		var sender = $(this).parent().prev().text();
		var rn = $(this).parent().prev().prev().text();
		
			e.preventDefault();
			var url = "/admin/reply"
			var sData = {
					"sender":sender,
					"rn":rn
			}
// 			var rn = tr.children();
			
// 			var sender = tr.find(".sender").text();
			console.log("알앤:",rn);
			console.log("샌더:",sender);
		$.post(url,sData,function(rData){
			console.log("아르데이터:",rData);
			var mtitle = rData.mtitle;
			var message = rData.message;
			$("#modal-container-560730").modal();
			$("#mtitle").val(mtitle);
			$("#message").val(message);
			var frmMsg_id = $("#frmresend").find("input[name=msg_id]");
			frmMsg_id.val(sender);
			console.log("췤1:",mtitle);
			console.log("췤2:",message);
		});
	});//
	$("#reply").click(function(e){
		e.preventDefault();
		$("#modal-container-560730").modal("hide");
		$("#modal-container-000000").modal("show");
		
	});
	$("#sendReply").click(function(){
		$("#modal-container-000000").modal("hide");
	});
});

</script>

</head>
<!-- list(게시판) 양식 -->
<body>
	<div class="notice d-flex justify-content-center" > 
		<div class="admin-top" >
			<h2 class="admin-body" title="" >고객센터 관리</h2>
			<!-- 모다르 -->
						<div class="" style="display: flex; justify-content: center">
				<form role="form" action="#" method="post">
					<input type="hidden" name="msg_id" value="">
					<input type="hidden" name="sender" value="">
					<a
						id="modal-560730" href="#modal-container-560730" role="button"
						class="btn btn-warning" data-toggle="modal"
						style="font-size: 35px; display: none;">1대1 문의 하기</a>

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
									<label for="exampleInputPassword1"> 문의 제목 </label> 
									<input type="text" name="mtitle" 
										class="form-control" id="mtitle" />
								</div>
								<div>
									<label style="margin-left: 15px;" for="message">
										문의 내용 </label><br>
									<textarea class="form-control" name="message" id="message"
										style="height: 6.25em; margin-left: 15px; width: 766px;"></textarea>
								</div>
								<div class="modal-footer">

									<button type="submit" id="reply" class="btn btn-primary">답장</button>
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">닫기</button>
								</div>
							</div>

						</div>

					</div>
				</form>
			</div>
			<!-- 모다르 끝 -->
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
										style="height: 6.25em; margin-left: 15px; width: 766px;"></textarea>
								</div>
								<div class="modal-footer">

									<button type="submit" id="sendReply" class="btn btn-primary">보내기</button>
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">닫기</button>
								</div>
							</div>

						</div>

					</div>
				</form>
			</div>
			
			
			
			<!-- 답장 모다르 끝 -->
			<div class="search">
            <div class="search-field">
					<select name="target" title="검색선택">
						<option value="">전체</option>
						<option value="title">아이디</option>
						<option value="content">닉네임</option>
						<option value="member_display">이름</option>
						<option value="member_display">이메일</option>
						<option value="member_display">전화번호</option>
					</select> 
					<input type="text" value="" name="s" class="s" title="검색어 입력" id="search_id" placeholder="검색 ..." />
                <input value="검색" type="submit" class="searchsubmit" />
            </div>
        </div>
    
			<table class="table table-hover">
				<thead>
				<!-- 관리자용과 게시판 공용 사용하되 이름(컬럼명은 변경해야함)  -->
					<tr>
						<th>#</th>
						<th>보낸 유저</th> <!--  -->
						<th>문의 제목</th>
						<th>받은날짜</th> <!--  -->
						<th>답변날짜</th>
					</tr>
				</thead>
				<!-- 임시 -->
				<tbody>
				<c:forEach var="vo" items="${list}">
					<tr>
						<td data-rn="${vo.rn}" class="rn">${vo.rn}</td>
						<td data-sender="${vo.sender}" class="sender">${vo.sender}</td>
						<td><a href="#" class="mtitle" data-title="${vo.mtitle}">${vo.mtitle}</a></td>
						<td>${vo.send_date}</td>
						<c:if test="${vo.open_date == null}"><td>읽지 않음</td></c:if>
						<c:if test="${vo.open_date != null}"><td>${vo.open_date}</td></c:if>
					</tr>
				</c:forEach>					
				</tbody>
			</table>	
			
			<button type="button" data-toggle="modal" data-target="#myModal">Open Modal</button>
		
			<!-- 하단 게시판 번호(Pagination) -->
<!-- 	<div class="pageBottom" style="margin-bottom: 100px"> -->
<!-- 		<div class="col-md-12"> -->
<!-- 			<nav> -->
			
<!-- 				<ul class="pagination d-flex align-items-center justify-content-center"> -->
<!-- 						<select name="target" title="검색선택"> -->
<!-- 						<option value="1">10</option> -->
<!-- 						<option value="2">20</option> -->
<!-- 						<option value="3">30</option> -->
<!-- 						<option value="4">40</option> -->
<!-- 						<option value="5">50</option> -->
<!-- 					</select>  -->
<!-- 					<li class="page-item"> -->
<!-- 						<a class="page-link" href="#">&laquo;</a> -->
<!-- 					</li> -->
<!-- 					<li class="page-item"> -->
<!-- 						<a class="page-link" href="#">1</a> -->
<!-- 					</li> -->
<!-- 					<li class="page-item"> -->
<!-- 						<a class="page-link" href="#">2</a> -->
<!-- 					</li> -->
<!-- 					<li class="page-item"> -->
<!-- 						<a class="page-link" href="#">3</a> -->
<!-- 					</li> -->
<!-- 					<li class="page-item"> -->
<!-- 						<a class="page-link" href="#">4</a> -->
<!-- 					</li> -->
<!-- 					<li class="page-item"> -->
<!-- 						<a class="page-link" href="#">5</a> -->
<!-- 					</li> -->
<!-- 					<li class="page-item"> -->
<!-- 						<a class="page-link" href="#">...</a> -->
<!-- 					</li> -->
<!-- 					<li class="page-item"> -->
<!-- 						<a class="page-link" href="#">10</a> -->
<!-- 					</li> -->
<!-- 					<li class="page-item"> -->
<!-- 						<a class="page-link" href="#">&raquo;</a> -->
<!-- 					</li> -->
<!-- 					<li class="page">현재 1 page 10 page entries </li> -->
<!-- 				</ul> -->
<!-- 			</nav> -->
<!-- 		</div> -->
<!-- 	</div>페이징 -->
	</div>
	</div>

</body>
