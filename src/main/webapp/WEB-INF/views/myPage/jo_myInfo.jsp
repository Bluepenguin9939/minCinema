<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/views/include/top.jsp" %>
<%@ include file="/WEB-INF/views/include/heo_resignModal.jsp" %>
<link href="/resources/css/myPage/mySide.css?after" rel="stylesheet">
<link href="/resources/css/myPage/myInfo.css?after" rel="stylesheet">
<script type="text/javascript" src="/resources/js/myInfo.js"></script> 

<script>
$(function() {
// 	패스워드 변경 버튼
	$("#btnPwMod").click(function() {
		$("#nickDiv").hide();
		$("#btnChangeNick").hide();
		$("#pwDiv").show();
		$("#btnChangePw").show();
		$("#changeInfoModal").modal("show");
	});
	
// 	패스워드 변경 모달 버튼
	$("#btnChangeInfo").click(function() {
		var curPw = $("#curPw").val();
		var url = "/member/checkPw"
		var sData = {
				"curPw" : curPw
		}
		
		$.post(url, sData, function(rData) {
			console.log(rData);
			if (rData == "true") {
				var futurePw = $("#futurePw").val();
				console.log("pw1 :", futurePw);
				var futurePw2 = $("#futurePw2").val();
				console.log("pw2 :", futurePw2);
				if (futurePw == futurePw2) {
					var url2 = "/member/changePw"
					var changeData = {
							"futurePw" : futurePw
					}
					$.post(url2, changeData, function(rData2) {
						console.log("change :", rData2);
						if (rData2 == "true") {
							alert("변경이 완료되었습니다.");
							window.location = "/myPage/jo_myInfo";
						}
					});
				} else {
					alert("변경할 비밀번호가 일치하지 않습니다.");
					$("#futurePw").focus();
				}
			} else if (rData == "false") {
				alert("현재 비밀번호가 일치하지 않습니다.");
				$("#curPw").focus();
			}
		});
	});
	
//	닉네임 변경 버튼
	$("#btnNickNameMod").click(function() {
		var mnick = "${loginInfo.mnick}";
		$("#nickDiv").show();
		$("#btnChangeNick").show();
		$("#changeNick").val(mnick);
		$("#pwDiv").hide();
		$("#btnChangePw").hide();
		$("#changeInfoModal").modal("show");
	});
	
// 	닉네임 변경 모달 버튼
	$("#btnChangeNick").click(function() {
		var mid = "${loginInfo.mid}";
		var mnick = $("#changeNick").val();
		var url = "/member/changeNick";
		var sData = {
				"mnick" : mnick,
				"mid" : mid
		}
		
		$.post(url, sData, function(rData) {
			console.log("닉네임 변경 :",rData);
			if (rData == "true") {
				alert("닉네임 변경이 완료되었습니다.");
				window.location = "/myPage/jo_myInfo";
			}
		});
	});
});
</script>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8 d-flex justify-content-center">
		<%@ include file="/WEB-INF/views/include/myPage-side.jsp" %>
			<div style="width: 100%; height: 85vh;">
				<div style="width: 90%; height: 90%; margin-left: 5%;">
					<div style="border-bottom: 1px solid #999999; margin-top:20px; margin-bottom: 20px;">
						<h4>회원 정보</h4>
					</div>
					<h5>내 정보</h5>
					<table class="table">
						<tbody style="border-bottom: 0.5px solid black;">
							<tr class="text-dark">
								<th class="table-header">아이디</th>
								<td>${loginInfo.mid}</td>
							</tr>
							<tr class="text-dark">
								<th class="table-header" style="vertical-align: middle;">비밀번호</th>
								<td>
									●●●●●●●●●●
									<button class="btn btn-secondary btn-sm"type="button"
										id="btnPwMod">변경</button>
								</td>
							</tr>
							<tr class="text-dark">
								<th class="table-header">이름</th>
								<td>${loginInfo.mname}</td>
							</tr>
							<tr class="text-dark">
								<th class="table-header" style="vertical-align: middle;">닉네임</th>
								<td>
									${loginInfo.mnick}
									<button class="btn btn-secondary btn-sm"type="button"
										id="btnNickNameMod">변경</button>
								</td>
							</tr>
							<tr class="text-dark">
								<th class="table-header" style="vertical-align: middle;">전화번호</th>
								<td>
									${loginInfo.mtel}
									<button class="btn btn-secondary btn-sm"type="button"
										id="btnTelMod">변경</button>
								</td>
							</tr>
						</tbody>
					</table>
					<div style="display: flex; justify-content: flex-end;">
						<a href="${loginInfo.mid}" style="font-weight: bold; color: red;" onclick="resign(this); return false;">회원 탈퇴</a> 
					</div>
					<h5>내 예매내역</h5>
					<div style="border: 3px solid #999999; height: 40px; display: flex;">
						<div style="width: 90%; margin-left: 5%; align-self: center;">
							<span>최근 예매내역이 존재하지 않습니다.</span>
						</div>
					</div>
				</div>
			</div>
		</div>
			<div class="modal fade" id="changeInfoModal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="changeInfoModal-title" id="myModalLabel">
								정보 변경
							</h5> 
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body">
							<div id="pwDiv">
								<label style="width: 30%;">현재 비밀번호</label>
								<input type="password" id="curPw" placeholder="현재 비밀번호"><br>
								<label style="width: 30%;">변경할 비밀번호</label>
								<input type="password" id="futurePw" placeholder="변경할 비밀번호"><br>
								<label style="width: 30%;">비밀번호 재확인</label>
								<input type="password" id="futurePw2" placeholder="비밀번호 재확인">
							</div>
							<div id="nickDiv">
								<label style="width: 20%;">닉네임</label>
								<input type="text" id="changeNick" placeholder="닉네임">
							</div>
						</div>
						<div class="modal-footer">
							 
							<button type="button" id="btnChangePw" class="btn btn-primary">
								변경
							</button> 
							<button type="button" id="btnChangeNick" class="btn btn-primary">
								변경
							</button> 
							<button type="button" class="btn btn-secondary" data-dismiss="modal">
								취소
							</button>
						</div>
					</div>
				</div>
			</div>
		<div class="col-md-2">
		</div>
	</div>
</div>


<%@ include file="/WEB-INF/views/include/bottom.jsp" %>