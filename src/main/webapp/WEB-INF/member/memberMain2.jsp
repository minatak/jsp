<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- <%@ include file = "/include/certification.jsp" %> --%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>memberMain.jsp</title>
  <%@ include file = "/include/bs4.jsp" %>
</head>
<script>
	'use strict';
/* 
	// 총 방문횟수, 오늘 방문횟수, 누적 포인트 조회
	$.ajax({
		url : "cntSearch.mem",  
		type : "post",
		data : {nickName : '${sNickName}'},
		success : function(res) {
			let str = res.split("/");
			
			$("#visitCnt").text(str[0]); 
	    $("#todayCnt").text(str[1]); 
	    $("#point").text(str[2]); 
		},
		error : function() {
			alert("전송오류입니다");
		}
	}); -> ajax로 가져올 필요 없음 ......
     */
	
</script>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class="container">
  <h2>회원 전용방</h2>
  <hr/>
  <!-- 실시간 채팅방(DB) -->
  <hr/>
  <div>
  	<p>현재 <font color="blue"><b>${sNickName}</b></font><font color="red">(${strLevel})</font>님이 로그인중이십니다.</p>
  	 <p>총 방문횟수 : <span id="visitCnt"></span>회</p>
    <p>오늘 방문횟수 : <span id="todayCnt"></span>회</p>
    <p>총 보유 포인트 : <span id="point"></span>점</p>
  </div>
  <div class="col">
  	<p><img src="${ctp}/images/member/${mVo.photo}" width="200px"/></p>
  </div>
	<hr/>
  <div>
  	<p>활동내역</p>
  	<p>방명록에 올린 글 수 : 건</p>
  	<p>게시판에 올린 글 수 : 건</p>
  	<p>자료실에 올린 글 수 : 건</p>
  </div>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>