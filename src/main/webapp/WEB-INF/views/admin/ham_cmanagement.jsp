<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="/WEB-INF/views/include/ad_sidebar.jsp" %>
<%@ include file="/WEB-INF/views/include/ad_topbar.jsp" %>

<head>
<link rel="stylesheet" href="/resources/css/admin/cmanagement.css?after" type="text/css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">
<!-- <meta name="viewport" content="width=device-width,initial-scale=1.0"> -->


</head>
<body>
<script>

$(function() {
	var result = '${result}';
	var begin = 0;
	var end = 5;
	var eend = 10;
	var aa = $(".wrap>tr");
	var sa = aa.slice(begin,end);
	aa.hide();
	sa.show();
	if(result == "true"){
		alert("테스트 회원 생성 완료");
	}
	$(".deleteMember").click(function(e) {
		e.preventDefault();
		var that = $(this);
		var testDelete = that.attr("data-tmid");
		console.log("테스트딜리트:",testDelete);
		var url = "/admin/testDel";
		var sData ={
				"tmid" : testDelete
		};
		console.log("sData:",sData);
		
		$.post(url,sData,function(rData){
		console.log("rData:",rData);
			if(rData == "true"){
				alert("테스트 회원 삭제 완료");
				location.href="/admin/ham_cmanagement";
			}
			
		});//POST END
	});//.deleteMember.click END
	$("#view").click(function(){
		sa.show();
	});
	
// 	function mo(){
// 		$(".wrap>tr").slice(begin,end).show();
// 		eng +=10;
// 	}
	
	$("#load-more").click(function(){
		var that = $(this);
		end +=5;
		var testNum = $(".test999");
		var ttt = testNum.attr("data-index");
		console.log("테넘:",testNum);
		aa.slice(begin,end).show();
		
// 		var x = aa.slice(0,9);
// 		x.show();
		
// 		console.log("x:",x);
// 		console.log("에이:",aa);
// 		console.log("댓:",that);
// 		console.log("sa:",sa);
		});
	
	
	
});

</script>

<!-- 테스트 모달 -->
	
	<div>
		<a id="modal-474701" href="#modal-container-474701" role="button"
			class="btn" data-toggle="modal">테스트 회원 생성 </a>

		<div class="modal fade" id="modal-container-474701" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="myModalLabel">Modal title</h5>
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<form action="/admin/testMember" method="post">
					<div class="modal-body">
						<input type="text" name="tmid" class="form-control" placeholder="테스트 아이디">
					</div>
					<div class="modal-body">
						<input type="password" name="tmpw" class="form-control" placeholder="테스트 비밀번호">
					</div>
					<div class="modal-body">
						<input type="text" name="tmnick" class="form-control" placeholder="테스트 닉네임">
					</div>
					<div class="modal-body">
						<input type="text" name="tmname" class="form-control" placeholder="테스트 이름">
					</div>
					<div class="modal-body">
						<input type="email" name="tmemail" class="form-control" placeholder="테스트 이메일">
					</div>
					<div class="modal-body">
						<input type="text" name="tmtel" class="form-control" placeholder="테스트 전화번호">
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-primary">생성</button>
						<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
					</div>
					</form>
				</div>

			</div>

		</div>

	</div>
	<!-- 관리자용 회원관리 게시판 -->
	<div class="notice d-flex justify-content-center" > 
		<div class="admin-top" >
			<h2 class="admin-body" title="" >회원 관리</h2> <button id="view">회원 보기</button>
			<div class="search">
            <div class="search-field">
            <form action="">
					<select name="type" title="검색선택">
						<option value="I" ${param.type == 'I' ? 'selected' : ''}>아이디</option>
						<option value="NI" ${param.type == 'NI' ? 'selected' : ''}>닉네임</option>
						<option value="N" ${param.type == 'N' ? 'selected' : ''}>이름</option>
						<option value="E" ${param.type == 'E' ? 'selected' : ''}>이메일</option>
						<option value="T" ${param.type == 'T' ? 'selected' : ''}>전화번호</option>
					</select> 
					<input type="text" value="${param.keyword}" name="keyword" class="keyword" title="검색어 입력" placeholder="검색 ..." />
                <button value="검색" type="submit" class="btn btn-sm btn-outline-dark">검색</button>
            </form>
          </div>
        </div>
    
			<table class="table table-hover">
				<thead>
			
					<tr>
						<th>#</th>
						<th>아이디</th> <!--  -->
						<th>닉네임</th>
						<th>이름</th>
						<th>이메일</th> <!--  -->
						<th>전화번호</th>
						<th>관리</th>
					</tr>
				</thead>
				<!-- 임시 -->
				<tbody class="wrap">
				<c:forEach var="vo" items="${list}" varStatus="step">
					<tr>
						<td>${vo.tmno}</td>
						<td>${vo.tmid}</td>
						<td>${vo.tmnick}</td>
						<td>${vo.tmname}</td>
						<td>${vo.tmemail}</td>
						<td>${vo.tmtel}</td>
						<td>
							<a href="#" class="venMember" ><i class="fa fa-user-alt-slash" title="ven" ></i></a> 
							<a href="#" class="deleteMember" data-tmid="${vo.tmid}"><i class="fa fa-trash" title="del"></i></a>
						</td>
						<td class="test999" data-index="${step.index}">${step.index}</td>
						
					</tr>
				</c:forEach>
				</tbody>
			</table>	
		
			<!-- 하단 게시판 번호(Pagination) -->
			
				<button id="load-more">더보기</button>
			
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
<!-- <!-- 					<li class="page">현재 1 page 10 page entries </li> --> 
<!-- 				</ul> -->
<!-- 			</nav> -->
<!-- 		</div> -->
<!-- 	</div> -->
	</div>
	</div>

</body>
