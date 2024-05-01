<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<table class="table table-hover text-center">
  	<tr class="table-dark text-dark">
    <th>no.</th>
    <th>id</th>
    <th>name</th>
    <th>age</th>
    <th>gender</th>
    <th>address</th>
  </tr>
  <c:forEach var="vo" items="${vos}" varStatus="st">
  	<tr>
  	  <td>${vo.idx}</td>
  	  <td>${vo.mid}</td>
  	  <td>${vo.name}</td>
  	  <td>${vo.age}</td>
  	  <td>${vo.gender}</td>
  	  <td>${vo.address}</td>
  	</tr>
  	</c:forEach>
 	  <tr><td colspan="6" class="m-0 p-0"></td></tr>
</table>