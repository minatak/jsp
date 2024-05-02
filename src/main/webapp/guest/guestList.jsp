<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("newLine", "\n"); %>
<% 
  String myIP = request.getRemoteAddr();
  pageContext.setAttribute("myIP", myIP);
%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>guestList.jsp</title>
  <%@ include file = "/include/bs4.jsp" %>
  <style>
    th {
      background-color: #eee;
    }
  </style>
  <script>
    'use strict';
    
    function delCheck(idx) {
    	let ans = confirm("현재 방문글을 삭제하시겠습니까?");
    	if(ans) {
    		location.href = '${ctp}/GuestDelete?idx=' + idx;
    		return false;
    	}
    }
		

  </script>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class="container">
  <h2 class="text-center">방 명 록 리 스 트</h2><br/>
  <hr/>
  <table class="table table-borderless m-0 p-0 mb-3">
    <tr>
      <td><a href="#" class="btn btn-primary">관리자</a></td>
      <td class="text-right">
	      <a href="${ctp}/mineSearch?hostIp=${myIP}" class="btn btn-warning">내 글 확인</a>
	      <a href="${ctp}/guest/guestInput.jsp" class="btn btn-success">글쓰기</a>
      </td>
    </tr>
  </table>
  <c:forEach var="vo" items="${vos}" varStatus="st">
	  <table class="table table-borderless m-0 p-0">
	    <tr>
	      <td>
	        no. ${vo.idx}
	        <%-- <c:if test="${sMid == 'admin'}"><a href="javascript:delCheck(${vo.idx})" class="btn btn-danger btn-sm">삭제</a></c:if>
	       	<c:if test="${vo.hostIp == pageContext.request.remoteAddr}"><a href="javascript:delCheck(${vo.idx})" class="btn btn-success btn-sm">수정</a></c:if>
	       	<c:if test="${sMid != 'admin' && vo.hostIp == pageContext.request.remoteAddr}"><a href="javascript:delCheck(${vo.idx})" class="btn btn-success btn-sm">삭제</a></c:if> --%>
	      </td>
	      <td class="text-right">방문IP : ${vo.hostIp}</td>
	    </tr>
	  </table>
	  <table class="table table-bordered mb-0">
	    <tr>
	      <th>성명</th>
	      <td>${vo.name}</td>
	      <th>방문일자</th>
	      <td>${vo.visitDate}</td>
	    </tr>
	    <tr>
	      <th>메일주소</th>
	      <td colspan="3">${vo.email}</td>
	    </tr>
	    <tr>
	      <th>홈페이지</th>
	      <td colspan="3">${vo.homePage}</td>
	    </tr>
	    <tr>
	      <th>방문소감</th>
	      <td colspan="3">${fn:replace(vo.content, newLine, "<br/>")}</td>
	    </tr>
	  </table>
	  <table class="table table-borderless m-0 p-0">
		    <tr>
		      <td>
		        <c:if test="${sMid == 'admin'}"><a href="javascript:delCheck(${vo.idx})" class="btn btn-danger btn-sm float-right">삭제하기</a></c:if>
		       	<c:if test="${sMid != 'admin' && vo.hostIp == pageContext.request.remoteAddr}"><a href="javascript:delCheck(${vo.idx})" class="btn btn-danger btn-sm float-right">삭제하기</a></c:if>
		       	<c:if test="${vo.hostIp == pageContext.request.remoteAddr}"><a href="javascript:delCheck(${vo.idx})" class="btn btn-success btn-sm float-right mr-2">수정하기</a></c:if>
		      </td>
		    </tr>
		  </table>
	  <br/>
  </c:forEach>
  <br/>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>