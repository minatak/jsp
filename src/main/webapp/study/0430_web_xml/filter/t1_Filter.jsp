<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file = "/include/certification.jsp" %> 
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Insert</title>
  <%@ include file = "/include/bs4.jsp" %>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class="container">
  <h2>Filter 한글처리 연습입니다3333번...</h2>
  <form name="myform" method="post">
  	<div><input type="text" name="content" value="간단한 소개입니다." class="form-control" autofocus /></div>
  	<div><textarea rows="5" name="introduce" value="사이트 소개입니다." class="form-control"></textarea></div>
  	<div><input type="button" value="전송1" onclick="fCheck('OK')" class="btn btn-success form-control" /></div>
  	<div><input type="button" value="전송2" onclick="fCheck('NO')" class="btn btn-primary form-control" /></div>
  </form>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>