<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>memberList.jsp</title>
  <%@ include file = "/include/bs4.jsp" %>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class="container">
  <h2 class="text-center">전체 회원 리스트</h2>
  <table class="table table-hover text-center">
    <tr class="table-dark text-dark">
      <th>번호</th>
      <th>아이디</th>
      <th>닉네임</th>
      <th>성명</th>
      <th>생일</th>
      <th>성별</th>
      <th>최종방문일</th>
      <th>오늘방문횟수</th>
      <c:if test="${sNickName == '관리맨'}"><th>정보공개여부</th></c:if>
    </tr>
    <c:if test="${sNickName != '관리맨'}">
	    <c:forEach var="vo" items="${vos}" varStatus="st">
	    	<c:if test="${vo.userInfor == '공개'}">
		      <tr>
		        <td>${vo.idx}</td>
		        <td>${vo.mid}</td>
		        <td>${vo.nickName}</td>
		        <td>${vo.name}</td>
		        <td>${fn:substring(vo.birthday,0,10)}</td>
		        <td>${vo.gender}</td>
		        <td>${fn:substring(vo.lastDate,0,10)}</td>
		        <td>${vo.todayCnt}</td>
		      </tr>
	      </c:if>
	    </c:forEach>
    </c:if>
    <c:if test="${sNickName == '관리맨'}">
	    <c:forEach var="vo" items="${vos}" varStatus="st">
	      <tr>
	        <td>${vo.idx}</td>
	        <td>${vo.mid}</td>
	        <td>${vo.nickName}</td>
	        <td>${vo.name}</td>
	        <td>${fn:substring(vo.birthday,0,10)}</td>
	        <td>${vo.gender}</td>
	        <td>${fn:substring(vo.lastDate,0,10)}</td>
	        <td>${vo.todayCnt}</td>
	        <td>${vo.userInfor}</td>
	      </tr>
	    </c:forEach>
    </c:if>
    <c:if test="${sNickName != '관리맨'}"><tr><td colspan="8" class="m-0 p-0"></td></tr></c:if>
    <c:if test="${sNickName == '관리맨'}"><tr><td colspan="9" class="m-0 p-0"></td></tr></c:if>
  </table>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>