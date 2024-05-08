<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file = "/include/certification.jsp" %> 
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>input.jsp</title>
  <%@ include file = "/include/bs4.jsp" %>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class="container">
  <h2 style="text-align:center;">회원가입</h2>
  <hr/>
  <form name="myform" method="post" action="inputOk.do5">
  	<div>아이디
  	  <input type="text" name="mid" value="admin" class="form-control mb-3" autofocus required />
  	</div>
  	<div>비밀번호
  	  <input type="password" name="pwd" value="1234" class="form-control mb-3" required />
  	</div>
  	<div style="text-align:center;">
  	  <button type="submit" class="btn btn-success">가입하기</button>
  		<a href="test5.do5" class="btn btn-warning">돌아가기</a>
  	</div>
  </form>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>