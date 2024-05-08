<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<div id="header" class="jumbotron text-center" style="margin-bottom:0;background-image:url('${ctp}/homepage_images/15.jpg')">
	<!-- <img src="homepage_images/15.jpg" alt="img1"> -->
  <h1 style="color:white">Mina's First Homepage</h1>
<!--   <h1 style="color:white">여름은 향기를 남기고</h1> -->
  <p style="color:white" class="title">hello world <i class="fa-regular fa-face-smile"></i></p> 
</div>
<style>
	h1 {
		font-family: "DM Serif Display", serif;
	  font-weight: 400;
	  font-style: normal;
	}
	.title {
	  font-family: "Source Code Pro", monospace;
	  font-optical-sizing: auto;
	  font-weight: <weight>;
	  font-style: normal;
	}
</style>