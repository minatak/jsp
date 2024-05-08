<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file = "/include/certification.jsp" %> 
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>update.jsp</title>
  <%@ include file = "/include/bs4.jsp" %>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class="container">
  <form name="myform" method="post" action="updateOk.do5">
    <table class="table table-bordered text-center">
      <tr>
        <td colspan="2"><font size="5">회 원 정 보 수 정</font></td>
      </tr>
      <tr>
        <th>아이디</th>
        <td><input type="text" name="mid" value="hkd1234" class="form-control" disabled/></td>
      </tr>
      <tr>
        <th>비밀번호</th>
        <td><input type="password" name="pwd" value="1234" class="form-control" disabled/></td>
      </tr>
      <tr>
        <th>성명</th>
        <td><input type="text" name="name" value="홍길동" class="form-control" disabled/></td>
      </tr>
      <tr>
        <th>나이</th>
        <td><input type="number" name="age" value="30" class="form-control" disabled/></td>
      </tr>
      <tr>
        <th>성별</th>
        <td>
        	<input type="radio" name="gender" value="남자" checked disabled/> 남자 &nbsp;
        	<input type="radio" name="gender" value="여자" disabled/> 여자
        </td>
      </tr>
      <tr>
        <td colspan="2">
        	<div class="row">
        		<div class="col text-left">
		          <input type="submit" value="수정하기" class="btn btn-success mr-2" />
		          <input type="button" value="돌아가기" onclick="location.href='test5.do5';" class="btn btn-primary mr-4"/>
        		</div>
        	</div>
        </td>
      </tr>
    </table>
  </form>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>

