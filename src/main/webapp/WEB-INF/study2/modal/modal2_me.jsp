<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>modal2.jsp</title>
  <%@ include file = "/include/bs4.jsp" %>
  <script>
  	function fCheck1(name) {
  		// let name = myform.name.value;
			$("#myModal2 #modalName").text(name);
		}
  	function fCheck3() {
  		let name = myform.name.value;
  		let mid = myform.mid.value;
  		
  		if(name == "") {
  			alert("이름을 입력해주세요")
  			return;
  		}
  		else if(mid == "") {
  			alert("아이디를 입력해주세요")
  			return;
  		}
  		else {  			
				$("#myModal3 #modalName").text(name);
				$("#myModal3 #modalMid").text(mid);
  		}
		}
  </script>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class="container">
  <h2>Modal 연습2</h2>
  <hr/>
  <p>
    <input type="button" value="폼내용출력" class="btn btn-primary" data-toggle="modal" data-target="#myModal1" />
    <a href="#" onclick="fCheck1('홍길동')" class="btn btn-secondary" data-toggle="modal" data-target="#myModal2">폼 내용 출력 2</a>
    <a href="#" onclick="fCheck3()" class="btn btn-warning" data-toggle="modal" data-target="#myModal3">폼 내용 출력 3</a>
  </p>
  <hr/>
  <div>
  	<form name="myform">
  		<div>이름</div>
		  <div><input type="text" name="name" placeholder="이름을 입력하세요" class="form-control mb-3" /></div>
  		<div>아이디</div>
		  <div><input type="text" name="mid" placeholder="아이디를 입력하세요" class="form-control" /></div>
  	</form>
  </div>
</div>
<p><br/></p>

  <!-- The Modal -->
  <div class="modal fade" id="myModal1">
    <div class="modal-dialog modal-dialog-centered">
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
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>

  <!-- The Modal -->
  <div class="modal fade" id="myModal2">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">Modal Heading</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          성명 : <span id="modalName"></span>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>

  <!-- The Modal -->
  <div class="modal fade" id="myModal3">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">Modal Heading</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
        	** 입력하신 정보입니다 **
          <hr/>
          성명 : <b><span id="modalName"></span></b>
          <br/>
          아이디 : <b><span id="modalMid"></span></b>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>

<jsp:include page="/include/footer.jsp" />
</body>
</html>