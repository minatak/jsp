<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String msgFlag = request.getParameter("msgFlag");
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Insert</title>
  <%@ include file = "/include/bs4.jsp" %>
  <script>
  	'use strict';
  	
  	if('<%=msgFlag%>' == 'no') {
  		alert("로그인에 실패하셨습니다. 정보를 확인 후 다시 입력하세요.")
  	}
  </script>
  <link rel="stylesheet" href="e1_cookieStyle.css" type="text/css">
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class="container">
  <h2 class="title">Login</h2>
  <form name="myform" method="post" action="<%=request.getContextPath()%>/j0425/T11Ok">
  	<div class="input mid">
  		<div class="i">
      	<i class="fas fa-user"></i>
      </div>
  		<h5>Username</h5>
  	  <input type="text" name="mid" value="admin" class="form-control mb-3" autofocus required />
  	</div>
  	<div class="input pwd">
  		<div class="i"> 
      	<i class="fas fa-lock"></i>
      </div>
  		<h5>Password</h5>
  	  <input type="password" name="pwd" value="1234" class="form-control mb-3" required />
  	</div>
  	<div>
  	  <input type="checkbox" name="saveMid"/>아이디 저장
  	</div>
  	<div>
  	  <input type="submit" value="Login" class="btn"/>
  	</div>
  </form>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>