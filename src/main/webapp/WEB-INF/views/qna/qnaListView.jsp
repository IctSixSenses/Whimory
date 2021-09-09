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
<script type="text/javascript">
function showWriteForm(){
   location.href = "${ pageContext.servletContext.contextPath }/qwform.do";
}

function goLogin(){
	   location.href = "${ pageContext.servletContext.contextPath }/login.do";
	}
</script>
</head>
<body>
<c:import url="/WEB-INF/views/common/menubar.jsp" />
<hr>
<h2 align="center">무엇이든 물어보세요</h2>
<!-- 게시글 쓰기(등록)은 로그인한 회원만 가능함 -->
<c:if test="${ empty sessionScope.loginUser }">
   <div style="align:center;text-align:center;">
      <button onclick="goLogin();">글쓰기</button>
   </div>
</c:if>

<c:if test="${ !empty sessionScope.loginUser }">
   <div style="align:center;text-align:center;">
      <button onclick="showWriteForm();">글쓰기</button>
   </div>
</c:if>
<br>
<table class="table table-hover">
<tr class="table-light">
	<th>작성자</th>
	<th>질문 분류</th>
	<th>제목</th>
	<th>작성일</th>
	<th>답변여부</th>
</tr>
<c:forEach items="${ requestScope.list }" var="q">
<tr>
<td align="center">${ q.user_id }</td>

<td align="center">${  q.qq_category }</td>

<%-- <td>
<!-- 글 쓴 회원과 로그인 회원이 일치해야 상세보기할 수 있게 함 -->
<c:if test="${ !empty sessionScope.loginUser and sessionScope.loginUser eq q.user_id }">
   <c:url var="qdetail" value="qdetail.do">
      <c:param name="qq_no" value="${ q.qq_no }"/>
      <c:param name="page" value="${ currentPage }" />
   </c:url>
   <a href="${ qdetail }">${ q.qq_title }</a>
</c:if>
<c:if test="${ empty sessionScope.loginUser or sessionScope.loginUser ne q.user_id }">
   ${ q.qq_title }
</c:if>
</td> --%>

<c:url value="/qdetail.do" var="qdetail">
      <c:param name="qq_no" value="${ q.qq_no }" />
   </c:url>
   <td align="center"><a href="${ qdetail }">${ q.qq_title }</a></td>

<td align="center">
<fmt:formatDate value="${  q.qq_date }" type="date" pattern="yyyy-MM-dd" /></td>
<td align="center">${  q.qq_yn }</td>
</td>
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


    








