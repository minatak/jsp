<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file = "/include/certification.jsp" %> 
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>test5.jsp</title>
  <%@ include file = "/include/bs4.jsp" %>
</head>
<script>
	'use strict'
	
	function memberCheck() {
		let choice = myform.member.value;
		
		if(choice.trim()=="") {
			alert("항목을 선택하세요");
		}
		else {
			myform.action = choice; 
			myform.submit();
		}
		
	}
	
</script>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class="container" style="text-align:center;">
  <h2>회원가입 mapping 연습</h2>
  <hr/>
  <form name="myform">
	  <div class="form-group">
	  	<select class="form-control mb-3" name="member" onchange="memberCheck()">
	  		<option value="">선택하기</option>
	  		<option value="input.do5">회원가입</option>
	  		<option value="update.do5">회원수정</option>
	  		<option value="delete.do5">회원삭제</option>
	  		<option value="search.do5">회원검색</option>
	  		<option value="list.do5">전체 회원 리스트 확인</option>
	  	</select>
	  </div>
  </form>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>