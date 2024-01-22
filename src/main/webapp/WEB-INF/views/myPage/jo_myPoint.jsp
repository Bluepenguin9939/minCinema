<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/views/include/top.jsp" %>

<link href="/resources/css/myPage/mySide.css?after" rel="stylesheet">
<link href="/resources/css/myPage/myPoint.css?after" rel="stylesheet">

<div class="container-fluid">
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8 d-flex justify-content-center">
		<%@ include file="/WEB-INF/views/include/myPage-side.jsp" %>
			<div style="width: 100%; height: 85vh;	 background-color: #cccccc;">
				<div style="width: 90%; height: 90%; margin-left: 5%;">
					<div style="border-bottom: 1px solid #999999; margin-top:20px; margin-bottom: 20px;">
						<h4>포인트</h4>
					</div>
					<!-- Nav tabs -->
					<ul class="nav nav-tabs nav-justified" role="tablist">
						<li class="nav-item">
							<a class="nav-link active" data-toggle="tab" href="#point">포인트</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" data-toggle="tab" href="#menu1">이용내역</a>
						</li>
					</ul>
					
					<!-- Tab panes -->
					<div class="tab-content">
						<div id="point" class="container tab-pane active point-tab"><br>
							<div style="height: 250px; border-radius: 20px; background-color: #eee;">
								
							</div>
						</div>
						<div id="menu1" class="container tab-pane fade point-tab"><br>
							<h3>Menu 1</h3>
							<p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
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