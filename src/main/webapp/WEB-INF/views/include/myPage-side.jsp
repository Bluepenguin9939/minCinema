<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div style="width: 20%; margin-right: 15px;">
	<div class="card" style="border: 0px; border-radius: 0px; background-color: #eee;">
		<div class="d-flex justify-content-center" style="height: 150px;">
			<a href="#" class="align-self-center">
				<img class="card-img-top rounded-circle" src="/resources/img/default-profile.png" 
					alt="프로필" id="profile-image">
			</a>
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
			<a href="#">
				<div class="d-flex align-items-baseline profile-pc">
					<i class="fas fa-copyright align-self-center" id="coupon-i"></i>
					<span class="align-self-center">보유 쿠폰 0개</span>
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
				<a href="#">쿠폰함
					<span style="position: absolute; right: 10px;">&raquo</span>
				</a>
			</li>
		</ul>
	</div>
</div>