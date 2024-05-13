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
  <script>
    'use strict';
    
    $(function(){
    	$("#userDispaly").hide();
    	
    	$("#userInfor").on("click", function(){
    		if($("#userInfor").is(':checked')) {
    			$("#totalList").hide();
    			$("#userDispaly").show();
    		}
    		else {
    			$("#totalList").show();
    			$("#userDispaly").hide();
    		}
    	});
    });
    
    // 각 레벨(등급)별 회원 보기...
    function levelItemCheck() {
    	let level = $("#levelItem").val();
    	location.href = "MemberList.ad?level="+level;
    }
    
    // 회원별 각각의 등급 변경처리(ajax처리)
    function levelChange(e) {
    	let ans = confirm("선택한 회원의 등급을 변경하시겠습니까?");
    	if(!ans) {
    		location.reload();
    		return false;
    	}
    	
    	
    	let items = e.value.split("/");
    	
    	console.log("items[0] : " + items[0])
    	
    	let query = {
    			level : items[0],
    			idx   : items[1]
    	}
    	
    	$.ajax({
    		url  : "MemberLevelChange.ad",
    		type : "get",
    		data : query,
    		success:function(res) {
    			if(res != "0") {
    				alert("등급 수정 완료!");
    				location.reload();
    			}
    			else alert("등급 수정 실패~~");
    		},
    		error : function() {
    			alert("전송오류!");
    		}
    	});
    }
    
    
    // 선택 회원별 각각의 등급 변경처리(ajax처리) / 전체선택 -> 전체변경 되게 !
    function selectLevelChange(e) {
    	
    	let level = document.getElementById("selectLevel").value;
    	let checkedItems = "";
    	
			for(let i=0; i<=${vos.size()}; i++) {
				if(document.getElementById("select"+i).checked) {
					checkedItems += document.getElementById("select"+i).value + "/";
				}
			}
    	
    	if(checkedItems == "") {
    		alert("회원을 선택해주세요.");
    		return false;
    	}
    	
    	let ans = confirm("선택한 회원의 등급을 변경하시겠습니까?");
    	if(!ans) {
    		location.reload();
    		return false;
    	}
    	
    	$.ajax({
    		url  : "SelectLevelChange.ad",
    		type : "get",
    		data : {
    			level : level,
    			checkedItems : checkedItems
    		},
    		success:function(res) {
    			if(res != "0") {
    				alert("등급 수정 완료!");
    				location.reload();
    			}
    			else alert("등급 수정 실패");
    		},
    		error : function() {
    			alert("전송오류!");
    		}
    	});
    }
    
    // 30일 경과회원 삭제처리
    function memberDeleteOk(idx) {
    	let ans = confirm("선택하신 회원을 영구 삭제 하시겠습니까?");
    	if(ans) {
    		$.ajax({
    			url  : "MemberDeleteOk.ad",
    			type : "post",
    			data : {idx : idx},
    			success:function(res) {
    				if(res != "0") {
    					alert("영구 삭제 되었습니다.");
    					location.reload();
    				}
    				else alert("삭제 실패");
    			}
    		});
    	}
    }
    
		// 전체선택 버튼 처리
    $(function(){
    	$("#allSelect").on("click", function() {
      	if ($(this).is(':checked')) {
        	$("input[name='levelCheck']").prop('checked', true);
        } else {
	        $("input[name='levelCheck']").prop('checked', false);
        }
      });
    });
		
  </script>
</head>
<body>
<p><br/></p>
<div class="container">
  <div class="row">
    <div class="col text-right">
      <select name="levelItem" id="levelItem" onchange="levelItemCheck()">
        <option value="999" ${level > 4  ? "selected" : ""}>전체보기</option>
        <option value="1"   ${level == 1 ? "selected" : ""}>준회원</option>
        <option value="2"   ${level == 2 ? "selected" : ""}>정회원</option>
        <option value="3"   ${level == 3 ? "selected" : ""}>우수회원</option>
        <option value="99"  ${level == 99 ? "selected" : ""}>탈퇴신청회원</option>
        <option value="0"   ${level == 0 ? "selected" : ""}>관리자</option>
      </select>
    </div>
  </div>
  <hr/>
  <div id="totalList">
	  <h3 class="text-center">전체 회원 리스트</h3>
	  <div><input type="checkbox" name="allSelect" id="allSelect" /> 전체선택</div>
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
	      <th>활동여부</th>
	      <th>현재등급</th>
	    </tr>
	    <c:forEach var="vo" items="${vos}" varStatus="st">
	        <c:if test="${vo.userDel == 'OK'}"><c:set var="active" value="탈퇴신청"/></c:if>
	        <c:if test="${vo.userDel != 'OK'}"><c:set var="active" value="활동중"/></c:if>
		      <tr>
		      	<td>
			      	<c:if test="${vo.level != 0}"><input type="checkbox" name="levelCheck" id="select${vo.idx}" value="${vo.idx}" /></c:if>
			      	<c:if test="${vo.level == 0}"><input type="checkbox" disabled></c:if>
			        ${vo.idx}
		        </td>
		        <td><a href="MemberSearch.mem?mid=${vo.mid}">${vo.mid}</a></td>
		        <td>${vo.nickName}</td>
		        <td>${vo.name}</td>
		        <td>${fn:substring(vo.birthday,0,10)}</td>
		        <td>${vo.gender}</td>
		        <td>${fn:substring(vo.lastDate,0,10)}</td>
		        <td>${vo.todayCnt}</td>
		        <td>
		          <c:if test="${vo.userDel == 'OK'}"><font color="red"><b>${active}</b></font></c:if>
		          <c:if test="${vo.userDel != 'OK'}">${active}</c:if>
		          <c:if test="${vo.deleteDiff >= 30 && vo.userDel != 'OK'}"><br/>
		            (<a href="javascript:memberDeleteOk(${vo.idx})">30일경과</a>)
		          </c:if>
		        </td>
		        <td>
		        	<c:if test="${vo.level != 0}">
		          <form name="levelForm">
		          	<select name="level" onchange="levelChange(this)">
		          	  <option value="1/${vo.idx}" ${vo.level == 999   ? "selected" : ""}>전체회원</option>
		          	  <option value="1/${vo.idx}" ${vo.level == 1   ? "selected" : ""}>준회원</option>
		          	  <option value="2/${vo.idx}" ${vo.level == 2   ? "selected" : ""}>정회원</option>
		          	  <option value="3/${vo.idx}" ${vo.level == 3   ? "selected" : ""}>우수회원</option>
		          	  <option value="0/${vo.idx}" ${vo.level == 0   ? "selected" : ""}>관리자</option>
		          	  <option value="99/${vo.idx}" ${vo.level == 99 ? "selected" : ""}>탈퇴신청회원</option>
		          	</select>
		          </form>
		          </c:if>
		          <c:if test="${vo.level == 0}">관리자</c:if>
		        </td>
		      </tr>
	    </c:forEach>
	    <tr><td colspan="10" class="m-0 p-0"></td></tr>
	  </table>
  </div>
  <div>
  	<form name="levelForm"> 
  		선택 회원의 등급을 
	  	<select name="selectLevel" id="selectLevel" onchange="selectLevelChange(this)">
	  	  <option value="1/${vo.idx}" ${vo.level == -1   ? "selected" : ""}>등급선택</option>
	  	  <option value="1/${vo.idx}" ${vo.level == 1   ? "selected" : ""}>준회원</option>
	  	  <option value="2/${vo.idx}" ${vo.level == 2   ? "selected" : ""}>정회원</option>
	  	  <option value="3/${vo.idx}" ${vo.level == 3   ? "selected" : ""}>우수회원</option>
	  	  <option value="0/${vo.idx}" ${vo.level == 0   ? "selected" : ""}>관리자</option>
	  	  <option value="99/${vo.idx}" ${vo.level == 99 ? "selected" : ""}>탈퇴신청회원</option>
	  	</select>
		  으로 바꾸기
	  </form>
  </div>
</div>
<p><br/></p>
</body>
</html>