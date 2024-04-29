<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String msgFlag = request.getParameter("msgFlag");
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>t08.jsp</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
	<script>
	'use strict';
  	
  	if('<%=msgFlag%>' == 'no') {
  		alert("그림 파일을 선택하지 않았습니다.")
  	}
	</script>
	<style>
		h6 {color: blue;}
	  .container {
	    text-align: center;
	    margin-top: 50px;
	  }
	  .form-control {
	  	display: block; 
  		margin: 0 auto;
  		margin-top: 10px;
	    width: 300px;
	    height: 400px;
	  }
	</style>
</head>
<body>
<p><br/></p>
<div class="container" style="text-align: center;">
  <h2>그림 출력</h2><br/>
  <h6>* 아래 콤보상자에서 그림파일을 선택하면 선택된 그림이 화면에 출력됩니다 *</h6>
  <hr/>
  <form name="myform" method="post" action="<%=request.getContextPath()%>/j0425/T08Ok">
	  <div class="form-group mb-3">그림을 선택하세요 (다중선택 가능)<br/>
	  	<select name="img" class="form-control" multiple>
	  		<option value="111">꽃</option>
	  		<option value="112">노을</option>
	  		<option value="113">이슬</option>
	  		<option value="114">토끼</option>
	  		<option value="115">풀</option>
	  	</select>
	  	<div>
		  	<input type="submit" value="그림 출력" class="btn btn-success mt-3">	  		
	  	</div>
	  </div>
  </form>
</div>
<p><br/></p>
</body>
</html>