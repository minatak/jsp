<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>이미지출력창</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
	<style>
		.container {
	    text-align: center;
	    margin-top: 50px;
	  }
	</style>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>선택하신 이미지입니다</h2>
  <hr/>
  <div id="demo">${str}</div>
  <hr/>
  <div><a href="<%=request.getContextPath()%>/study/0425/t08_image.jsp" class="btn btn-info">돌아가기</a></div>
</div>
<p><br/></p>
</body>
</html>