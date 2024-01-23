<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="/WEB-INF/views/include/bs.jsp" %>
<%@ include file="/WEB-INF/views/include/ad_sidebar.jsp" %>
<%@ include file="/WEB-INF/views/include/ad_topbar.jsp" %>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Image Upload Example</title>
<script>

</script>
</head>

<body>
	<div class="notice d-flex justify-content-center" > 
		<div class="admin-top" >
			<h2 class="admin-body" title="" >영화 추가</h2>
	</div>
</div>
<!-- 사진 추가 -->
	<div>
   <form action=""  enctype="multipart/form-data">
	<div  class="card" id="middle" style="float : left; width: 198; height: 288; background-color: black" >
	<div class="card-body" title="중앙쓰" style="">
			<label for="chooseFile" style="cursor: pointer;">
				사진(198x288)
			</label>
	  </div>
	  <input type="file" id="chooseFile" name="chooseFile" accept="image/*" onchange="loadFile(this)"
	  	style="visibility: hidden;" >
	  	</div>
	  	<div  class="d-flex align-items-center">
	  <input type="text" style="width: 90%; margin-left: 30px;"> 
	  </div>
	</form>
</div>	
</body>
