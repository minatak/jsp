<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- t2_SessionSave.jsp -->
<%
	request.setCharacterEncoding("utf-8");
	
	String mid = request.getParameter("mid")==null ? "guest" : request.getParameter("mid");
	String nickName = request.getParameter("nickName")==null ? "손님" : request.getParameter("nickName");
	String name = request.getParameter("name")==null ? "손님" : request.getParameter("name");
	
	System.out.println("mid : "+mid);
	System.out.println("nickName : "+nickName);
	System.out.println("name : "+name);
	
	application.setAttribute("aMid", mid);
	application.setAttribute("aNickName", nickName);
	application.setAttribute("aName", name);
%>
<script>
  alert("세션이 생성/저장 되었습니다.");
  location.href = "t3_Application.jsp";
</script>