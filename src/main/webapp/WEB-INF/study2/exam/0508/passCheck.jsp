<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file = "/include/certification.jsp" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>passCheck.jsp</title>
  <%@ include file = "/include/bs4.jsp" %>
  <script>
    'use strict';
    
    function fCheck(idx) {
    	let pwd = myform.pwd.value;
    	if(pwd.trim() == "") {
    		alert("비밀번호를 입력하세요");
    		myform.pwd.focus();
    	}
    	else {
  			myform.idx.value = idx;
    		myform.action = "${ctp}/study/password/PassCheck";
  			myform.submit();
    	}
    }
  </script>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class="container">
  <h2>비밀번호 암호화 연습</h2>
  <p>(비밀번호를 10자 이내로 입력하세요)</p>
  <form name="myform" method="post">
    <table class="table table-bordered text-center">
      <tr>
        <td colspan="2"><font size="5">로 그 인</font></td>
      </tr>
      <tr>
        <th>아이디</th>
        <td><input type="text" name="mid" value="${sMid}" autofocus required class="form-control"/></td>
      </tr>
      <tr>
        <th>비밀번호</th>
        <td><input type="password" name="pwd" value="1234" required class="form-control"/></td>
      </tr>
      <tr>
        <td colspan="2">
        	<div class="m-3">
	          <input type="button" value="숫자비밀번호" onclick="fCheck(1)" class="btn btn-outline-primary mr-2"/>
	          <input type="button" value="문자비밀번호" onclick="fCheck(2)" class="btn btn-outline-warning mr-2"/>
	          <input type="button" value="조합비밀번호" onclick="fCheck(3)" class="btn btn-outline-info mr-2"/>        	
        	</div>
        	<div>
	          <input type="button" value="숫자비밀번호(AJAX)" onclick="aCheck(1)" class="btn btn-primary mr-2 btn-lg"/>
	          <input type="button" value="문자비밀번호(AJAX)" onclick="aCheck(2)" class="btn btn-success mr-2 btn-lg"/>
	          <input type="button" value="조합비밀번호(AJAX)" onclick="aCheck(3)" class="btn btn-info mr-2 btn-lg"/>        	
        	</div>
        </td>
      </tr>
    </table>
    <input type="hidden" name="idx" />
  </form>
  <br/>
  	<div>
  		<h3 class="text-center">암호화된 비밀번호</h3>
			<div>1 : <span id="numPwd1"></span></div>	  
			<div>2 : <span id="numPwd2"></span></div>	  
			<div>3 : <span id="numPwd3"></span></div>	
			<hr/>  
			<div>4 : <span id="strPwd1"></span></div>	  
			<div>5 : <span id="strPwd2"></span></div>	  
			<div>6 : <span id="strPwd3"></span></div>	  
			<hr/>  
			<div>7 : <span id="saltPwd1"></span></div>	  
			<div>8 : <span id="saltPwd2"></span></div>	  
			<div>9 : <span id="saltPwd3"></span></div>	  
	  </div>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>