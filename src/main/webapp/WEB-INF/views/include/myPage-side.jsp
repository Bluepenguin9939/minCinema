<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
$(function() {
// 	프로필 사진 띄우기
	$("#profile-upload").change(function(e) {
		var upload_image = e.target.files;
		console.log("asd :", upload_image);
		
		var formData = new FormData();
		formData.append("uploadFile", upload_image[0]);
		console.log(formData);
		
		$.ajax({
			"url" : "/uploadProfileImage",
			"type" : "post",
			"processData" : false,
			"contentType" : false,
			"data" : formData,
			"success" : function(rData) {
				console.log(rData);
				var attachVO = rData.attachVO;
				var upload_path = attachVO.upload_path;
				var uuid = attachVO.uuid;
				var file_name = attachVO.file_name;
				
				var file_path = upload_path + "/" + uuid + "_" + file_name;
				var url = "/display?fileName=" + file_path
				console.log(url);
				$("#profile-image").attr("src", url);
				if (rData.result) {
					$("#btnChange").attr("data-file_path", file_path);
					$("#btnCancle").attr("data-file_path", file_path);
					$("#changeModal").modal("show");
				}
			}
		});
	});
	
// 	모달 이미지 변경버튼
	$("#btnChange").click(function() {
		var file_path = $(this).attr("data-file_path");
		console.log(file_path);
		var upload_path = file_path.substring(0, 28);
		var uuid = file_path.substring(29, 65);
		var file_name = file_path.substring(66);
		
		var url = "/changeProfile"
		var sData = {
				"uuid" : uuid,
				"upload_path" : upload_path,
				"file_name" : file_name
		}
		
		$.post(url, sData, function(rData) {
			console.log(rData);
			if (rData) {
				self.location = window.location.href;
			}
		});
	});
	
// 	모달 취소버튼
	$("#btnCancle").click(function(e) {
		e.preventDefault();
		
		var file_path = $(this).attr("data-file_path");
		
		var url = "/deleteProfile"
		var sData = {
				"file_path" : file_path
		}
		
		$.post(url, sData, function(rData) {
			console.log(rData);
		});
	});
});
</script>

<div style="width: 20%; margin-right: 15px;">
	<div class="card" style="border: 0px; border-radius: 0px; background-color: #eee;">
		<div class="d-flex justify-content-center" style="height: 150px;">
			<input type="file" id="profile-upload" accept="image/*">
			<div class="align-self-center" onclick="$('#profile-upload').click();"
				id="user-profile">
				<c:choose>
					<c:when test="${loginInfo.uuid != null}">
						<img class="card-img-top rounded-circle" src="/display?fileName=${loginInfo.upload_path}/${loginInfo.uuid}_${loginInfo.file_name}" 
							alt="프로필" id="profile-image">
					</c:when>
					<c:otherwise>
						<img class="card-img-top rounded-circle" src="/resources/img/default-profile.png" 
							alt="프로필" id="profile-image">
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<hr style="border-bottom: 1px solid #666666;">
		<div class="card-body" style="padding-top: 0px;">
			<h5 class="card-title">${loginInfo.mnick}</h5>
			<a href="#">
				<div class="d-flex align-items-baseline profile-pc">
					<i class="fab fa-product-hunt align-self-center" id="point-i"></i>
					<span class="align-self-center"><fmt:formatNumber value="${loginInfo.mpoint}" pattern="#,###"/> P</span>
				</div>
			</a>
			<a href="/myPage/jo_myCoupon">
				<div class="d-flex align-items-baseline profile-pc">
					<i class="fas fa-copyright align-self-center" id="coupon-i"></i>
					<c:if test="${loginInfo.coupon5 + loginInfo.coupon10 + loginInfo.coupon15 eq 0}">
						<span class="align-self-center">보유 쿠폰 0개</span>
					</c:if>
					<c:if test="${loginInfo.coupon5 + loginInfo.coupon10 + loginInfo.coupon15 != 0}">
						<span class="align-self-center">보유 쿠폰 ${loginInfo.coupon5 + loginInfo.coupon10 + loginInfo.coupon15}개</span>
					</c:if>
				</div>
			</a>
		</div>
	</div>
	<div style="background-color: #cccccc; position: relative;">
		<ul id="myMenu">
			<li>
				<a href="/myPage/jo_myInfo">회원정보
					<span style="position: absolute; right: 10px;">&raquo</span>
				</a>
			</li>
			<li>
				<a href="/myPage/jo_myPoint">포인트
					<span style="position: absolute; right: 10px;">&raquo</span>
				</a>
			</li>
			<li>
				<a href="/myPage/jo_myInterest">관심목록
					<span style="position: absolute; right: 10px;">&raquo</span>
				</a>
			</li>
			<li>
				<a href="/myPage/jo_myCoupon">쿠폰함
					<span style="position: absolute; right: 10px;">&raquo</span>
				</a>
			</li>
		</ul>
	</div>
</div>
<div class="modal fade" id="changeModal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="changeModal-title" id="myModalLabel">
					변경
				</h5> 
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body" id="changeModal-body">
				변경하시겠습니까?
			</div>
			<div class="modal-footer">
				<button type="button" id="btnChange" class="btn btn-primary">
					변경
				</button> 
				<button type="button" id="btnCancle" class="btn btn-secondary" data-dismiss="modal">
					취소
				</button>
			</div>
		</div>
	</div>
</div>