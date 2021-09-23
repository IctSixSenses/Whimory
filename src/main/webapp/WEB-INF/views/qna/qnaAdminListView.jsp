<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- model에 담긴 변수 다 꺼내옴 -->
<c:set var="listCount" value="${ requestScope.listCount }" />
<c:set var="startPage" value="${ requestScope.startPage }" />
<c:set var="endPage" value="${ requestScope.endPage }" />
<c:set var="maxPage" value="${ requestScope.maxPage }" />
<c:set var="currentPage" value="${ requestScope.currentPage }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Whimory</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/css/bootstrap-select.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA==" crossorigin="anonymous" />
<!-- Bootstrap CSS -->
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Do+Hyeon|Jua|Nanum+Gothic|Sunflower:300" rel="stylesheet">
<style type="text/css">
html head{
	font-family: Roboto, Nanum Gothic;
}
html body{
	font-family: Roboto, Nanum Gothic;
} 
table tr td a { text-decoration:none } 
</style> 
<script type="text/javascript" src="${ pageContext.request.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
</head>
<body>
<c:import url="/WEB-INF/views/common/menubar.jsp" />
<hr>
<h2 align="center">QNA 답변내역</h2>

<br>
<table class="table table-lightgray table-hover" style="table-layout: fixed; width:1200px" align="center" cellspacing="0" cellpadding="3" >
	<thead>
		<tr align="center" class="thead-light">
			<th width="100px">작성자</th>
			<th width="200px">질문 분류</th>
			<th width="700px">제목</th>
			<th width="120px">작성일</th>
			<th width="80px">답변여부</th>
		</tr>
	</thead>
	
	<c:forEach items="${ requestScope.list }" var="q">
		<tr align="center">
			<td>${ q.user_id }</td>
			<td>${  q.qq_category }</td>	
			<c:url value="/qdetail.do" var="qdetail">
		      <c:param name="qq_no" value="${ q.qq_no }" />
		      <c:param name="page" value="${ currentPage }" />
		   </c:url>
		   <td align="center"><a href="${ qdetail }">${ q.qq_title }</a></td>
		   
		<td align="center">
		<fmt:formatDate value="${  q.qq_date }" type="date" pattern="yyyy-MM-dd" /></td>
		
		<td align="center">${  q.qq_yn }</td>
		
		
		</tr>
	</c:forEach>
</table>
<br>
<!-- 페이징 처리 -->
<div style="text-align:center;">
<c:if test="${ currentPage <= 1 }">
   [맨처음]&nbsp;
</c:if>
<c:if test="${ currentPage > 1 }">
   <c:url var="ubl" value="/qlist.do">
      <c:param name="page" value="1" />
   </c:url>
   <a href="${ ubl }">[맨처음]</a>
</c:if>
<!-- 이전 그룹으로 이동 처리 -->
<c:if test="${ (currentPage - 10) < startPage and (currentPage - 10) > 1 }">
   <c:url var="ubl2" value="/qlist.do">
      <c:param name="page" value="${ startPage - 10 }"/>
   </c:url>
   <a href="${ ubl2 }">[이전그룹]</a>
</c:if>
<c:if test="${ !((currentPage - 10) < startPage and (currentPage - 10) > 1) }">
   [이전그룹]&nbsp;
</c:if>
<!-- 현재 페이지가 속한 페이지그룹의 숫자 출력 처리 -->
<c:forEach var="p" begin="${ startPage }" end="${ endPage }" step="1">
   <c:if test="${ p eq currentPage }">   
      <font color="red" size="4"><b>[${ p }]</b></font>
   </c:if>
   <c:if test="${ p ne currentPage }">
      <c:url var="ubl3" value="/qlist.do">
         <c:param name="page" value="${ p }"/>
      </c:url>
      <a href="${ ubl3 }">${ p }</a>
   </c:if>
</c:forEach>
<!-- 다음 그룹으로 이동 처리 -->
<c:if test="${ (currentPage + 10) > endPage && (currentPage + 10) < maxPage }">
   <c:url var="ubl4" value="/qlist.do">
      <c:param name="page" value="${ endPage + 10 }"/>
   </c:url>
   <a href="${ ubl4 }">[다음그룹]</a>
</c:if>
<c:if test="${ !((currentPage + 10) > endPage && (currentPage + 10) < maxPage) }">
   [다음그룹]&nbsp;
</c:if>
<!-- 맨끝 페이지로 이동 처리 -->
<c:if test="${ currentPage >= maxPage }">
   [맨끝]&nbsp;
</c:if>   
<c:if test="${ currentPage < maxPage }">
   <c:url var="ubl5" value="/qlist.do">
      <c:param name="page" value="${ maxPage }"/>
   </c:url>
   <a href="${ ubl5 }">[맨끝]</a>
</c:if>
</div>
<hr>
<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>


    








