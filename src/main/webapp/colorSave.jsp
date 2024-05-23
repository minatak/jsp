<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>colorSave</title>
  <%@ include file = "/include/bs4.jsp" %>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class="container">
  <h1>색상 팔레트</h1>
	<div style="color:#718355;"><b>초록색 조합</b> 
		<ul>
		  <li style="color:#e9f5db;">제일 연한 색 - #e9f5db</li>
		  <li style="color:#cfe1b9;">2 연한 색 - #cfe1b9</li>
		  <li style="color:#b5c99a;">3 연한 색 - #b5c99a</li>
		  <li style="color:#97a97c;">4 연한 색 - #97a97c</li>
		  <li style="color:#87986a;">5 진한 색 - #87986a</li>
		  <li style="color:#718355;">제일 진한 색 - #718355</li>
		</ul>
	</div>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>