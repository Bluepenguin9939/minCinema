<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/views/include/top.jsp" %>

<link href="/resources/css/myPage/mySide.css?after" rel="stylesheet">
<link href="/resources/css/myPage/myInfo.css?after" rel="stylesheet">

<div class="container-fluid">
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8 d-flex justify-content-center">
		<%@ include file="/WEB-INF/views/include/myPage-side.jsp" %>
			<div style="width: 100%; height: 85vh;	 background-color: #cccccc;">
				<div style="width: 90%; height: 90%; margin-left: 5%;">
					<div style="border-bottom: 1px solid #999999; margin-top:20px; margin-bottom: 20px;">
						<h4>회원 정보</h4>
					</div>
					<h5>내 정보</h5>
					<table class="table">
						<tbody style="border-bottom: 0.5px solid black;">
							<tr class="table-dark text-dark">
								<th class="table-header">아이디</th>
								<td>${loginInfo.mid}</td>
							</tr>
							<tr class="table-dark text-dark">
								<th class="table-header" style="vertical-align: middle;">비밀번호</th>
								<td>
									●●●●●●●●●●
									<button class="btn btn-secondary btn-sm"type="button"
										id="btnPwMod">변경</button>
								</td>
							</tr>
							<tr class="table-dark text-dark">
								<th class="table-header">이름</th>
								<td>${loginInfo.mname}</td>
							</tr>
							<tr class="table-dark text-dark">
								<th class="table-header" style="vertical-align: middle;">닉네임</th>
								<td>
									${loginInfo.mnick}
									<button class="btn btn-secondary btn-sm"type="button"
										id="btnNickNameMod">변경</button>
								</td>
							</tr>
							<tr class="table-dark text-dark">
								<th class="table-header" style="vertical-align: middle;">전화번호</th>
								<td>
									${loginInfo.mtel}
									<button class="btn btn-secondary btn-sm"type="button"
										id="btnTelMod">변경</button>
								</td>
							</tr>
						</tbody>
					</table>
					<h5>내 예매내역</h5>
					<div style="border: 3px solid #999999; height: 40px; display: flex;">
						<div style="width: 90%; margin-left: 5%; align-self: center;">
							<span>최근 예매내역이 존재하지 않습니다.</span>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-md-2">
		</div>
	</div>
</div>


<%@ include file="/WEB-INF/views/include/bottom.jsp" %>