<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Mina's Homepage</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <%@ include file = "../../include/bs4.jsp" %>
  <style>
  .fakeimg {
    height: 200px;
    background: #aaa;
  }
  .navbar-nav .nav-link, .navbar-brand{
      color: #333d29;
  }
  h2, h3, h5 {
	  font-family: "Playfair Display", serif;
	  font-optical-sizing: auto;
	  font-weight: <weight>;
	  font-style: normal;
  }
   .welcome, .table {
	  font-family: "Noto Sans KR", sans-serif;
	  font-optical-sizing: auto;
	  font-weight: <weight>;
	  font-style: normal;
	  float: right;
  }
 /*  .table {
    font-family: "Gowun Batang", serif;
	  font-weight: 400;
	  font-style: normal;
  } */
  </style>
</head>
<body>

<!-- 해더(header) -->
<%@ include file = "../../include/header.jsp" %>

<!-- 메뉴바(nav) -->
<%@ include file = "../../include/nav.jsp" %>

<div class="container" style="margin-top:40px">
  <div class="row">
    <div class="col-sm-4">
   <%--  <%    if(!mid_.equals("")) { %><h5 class="mb-4 welcome">${sName}님 환영합니다 :)</h5><%    } %> --%>
      <h2>About Me</h2>
      <h5>Photo of me:</h5>
     	<img src="homepage_images/8.jpg" alt="img1" width="350px" height="200px">
      <p>Some text about me in culpa qui officia deserunt mollit anim..</p>
      <h3 class="text-left">New members</h3>
      	<table class="table table-striped table-hover text-center">
      	  <tr class="thead-dark">
      	    <th>id</th>
      	    <th>name</th>
      	    <th>area</th>
      	  </tr>
	        <c:forEach var="vo" items="${recentVos}">
	          <tr>
	            <td>${vo.mid}</td>
	            <td>${vo.name}</td>
	            <td>${vo.address}</td>
	          </tr>
	        </c:forEach>
        </table>
    	<!-- <p class="welcome">가입을 환영합니다 :)</p>  -->
      <hr class="d-sm-none">
      <!-- <h5>Photo of me:</h5>
     	<img src="homepage_images/3.jpg" alt="img1" width="350px" height="350px">
      <p>Some text about me in culpa qui officia deserunt mollit anim..</p> -->
    </div>
    <div class="col-sm-8">
     	<c:if test="${level <= 4}"><h6 class="mb-4 welcome">${sNickName}님 환영합니다 :) </h6></c:if>
      <h2>TITLE HEADING</h2>
      <h5>Title description, Dec 7, 2017</h5>
      <!-- <div class="fakeimg">Fake Image</div> -->
      <img src="homepage_images/16.jpg" alt="img1" height="400px">
      <p>Some text..</p>
      <p>Sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco.</p>
      <br>
      <h2>TITLE HEADING</h2>
      <h5>Title description, Sep 2, 2017</h5>
      <!-- <div class="fakeimg">Fake Image</div> -->
      <!-- <img src="homepage_images/16.jpg" alt="img1" height="400px"> -->
      <p>Some text..</p>
      <p>Sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco.</p>
    </div>
  </div>
</div>
<%@ include file = "../../include/footer.jsp" %>
</body>
</html>
