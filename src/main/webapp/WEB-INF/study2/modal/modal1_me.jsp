<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>modal1.jsp</title>
  <%@ include file = "/include/bs4.jsp" %>
	<script>
		'use strict';
		
		document.getElementById("btnModal1").onclick = function() {
		    var modal = document.getElementById("myModal1");
		    if (modal.classList.contains("fade")) {
		        modal.classList.remove("fade");
		    } else {
		        modal.classList.add("fade");
		    }
		};
	</script>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class="container">
  <h2>Modal 연습1</h2>
  <hr/>
  <p>
    <input type="button" id="btnModal1" value="표준모달창" class="btn btn-primary" data-toggle="modal" data-target="#myModal1" />
    <input type="button" value="부드러운모달창" class="btn btn-primary" data-toggle="modal" data-target="#myModal2" />
  </p>
</div>
<p><br/></p>

<!-- The Modal -->
  <div class="modal" id="myModal1">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">Modal Heading</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          Modal body..
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>

<jsp:include page="/include/footer.jsp" />
</body>
</html>
