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
	function moreButton(acount){
		var bsl = $(".wrap>tr").length;
		if(bsl > acount && bsl % 5 > 0 && bsl % 5 < 5){
			$("#load-more").css("display", "block");
		}
	}
	$(function() {
		var result = '${result}';
		var begin = 0;
		var end = 5;
		var acount = 5;
		var bStep = $(".wrap>tr");
		var eStep = bStep.slice(begin,end);
		bStep.hide();
		eStep.show();
		
		var bsl = bStep.length;
		console.log(bsl);
		if(bsl > acount && bsl % 5 >= 0){
			$("#load-more").css("display", "block");
		}
		$("#load-more").click(function(){
			$(this).css("display", "none");
			var that = $(this);
			end += 5;
			acount += 5;
			moreButton(acount);
			bStep.slice(begin,end).show();
		});
	
	var that="";
	$(".mtitle").click(function(e){
		var sender = $(this).parent().prev().text();
		var rn = $(this).parent().prev().prev().text();
		
		
			e.preventDefault();
			var url = "/admin/reply"
			var sData = {
					"sender":sender,
					"rn":rn
			}
		$.post(url,sData,function(rData){
			console.log("아르데이터:",rData);
			that = rData.rn;
			var mtitle = rData.mtitle;
			var message = rData.message;
			$("#adminModal").modal();
			$("#mtitle").val(mtitle);
			$("#message").val(message);
			console.log("message:",message);
			var frmMsg_id = $("#frmresend").find("input[name=msg_id]");
			frmMsg_id.val(sender);
		});
	});//
	$("#reply").click(function(e){
		e.preventDefault();
		var rn = $("#sendReply").attr("data-rn", that);
		$("#adminModal").modal("hide");
		$("#adminReply").modal("show");
		
	});
	$("#sendReply").click(function(e){
		var rn = $("#sendReply").attr("data-rn");
		$("#replyRn").val(rn);
		
	});
});

</script>

</head>
<!-- list(게시판) 양식 -->
<body>
<div id="oneonone-d">
	<div class="oneonone d-flex justify-content-center" > 
		<div class="admin-top" >
			<h2 class="admin-body" title="" >고객센터 관리</h2>
			<div class="search">
            <div class="search-field">
					<form action="/admin/ham_oneonone" method="get">
					<select name="type" title="검색선택">
						<option value="S" ${param.type == 'S' ? 'selected' : ''}>보낸 유저</option>
						<option value="M" ${param.type == 'M' ? 'selected' : ''}>문의 제목</option>
					</select> 
					<input type="text" value="${param.keyword}" name="keyword" class="keyword" title="검색어 입력" id="search_id" placeholder="검색 ..." />
					<button value="검색" type="submit" class="btn btn-sm btn-outline-dark">검색</button>
                </form>
            </div>
        </div>
			<!-- 모달 -->
			<div class="adminOne">
				<form role="form" action="#" method="post">
					<input type="hidden" name="msg_id" value="">
					<input type="hidden" name="sender" value="">
					<input type="hidden" name="rn" value="">
					<a
						id="modal-560730" href="#adminModal" role="button"
						class="btn btn-warning" data-toggle="modal"
						style="font-size: 35px; display: none;">1대1 문의 하기</a>

					<div class="modal fade" id="adminModal" role="dialog"
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
									<label id="adminOneLabel" for="message">문의 내용 </label><br>
									<textarea class="form-control" name="message" id="message"></textarea>
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
			<!-- 모달 끝 -->
			<!-- 답장 모달 -->
			
						<div class="" style="display: flex; justify-content: center">
				<form role="form" action="/admin/sendReply" method="post" id="frmresend">
					<input type="hidden" name="msg_id">
					<input type="hidden" name="rn" id="replyRn">
					<a id="adminAtag" href="#adminReply" role="button"
						class="btn btn-warning" data-toggle="modal">1대1 문의 하기</a>

					<div class="modal fade" id="adminReply" role="dialog"
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
			
			
			
			<!-- 답장 모달 끝 -->
			
    
			<table class="table oneononeTable">
				<thead>
				<!-- 관리자용과 게시판 공용 사용하되 이름(컬럼명은 변경해야함)  -->
					<tr class="oneononeTr">
						<th>#</th>
						<th>보낸 유저</th> <!--  -->
						<th>문의 제목</th>
						<th>받은날짜</th> <!--  -->
						<th>답변날짜</th>
					</tr>
				</thead>
				<!-- 임시 -->
				<tbody class="wrap">
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
					<div class="loadMore">
						<button id="load-more" class="btn btn-sm btn-outline-dark">더보기</button>
					</div>
				</div>
			</div>
		</div>

</body>
