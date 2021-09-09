<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Whimory</title>
<script type="text/javascript">
function showWriteForm(){
   location.href = "${ pageContext.servletContext.contextPath }/fwform.do";
}
</script>
</head>
<body>
<c:import url="/WEB-INF/views/common/menubar.jsp" />
<hr>
<h2 align="center">자유 토론 공간</h2>

<br>

<table align="center" border="1" cellspacing="0" cellpadding="5" width="860">
<tr><td colspan="8"><h5>&nbsp; 총 게시글 갯수 : ${ listCount }</h5></td></tr>
<tr align="center">
	<th width="80">번호</th>
	<th width="250">제목</th>
	<th width="100">작성자</th>
	<th width="130">등록일</th>
	<th width="100">첨부파일</th>
	<th width="100">조회수</th>
	<th width="100">추천수</th>
	<th width="100">신고수</th>
</tr>
<c:forEach items="${ list }" var="li">
<tr align="center">
	<td>${ li.free_no }</td>
	<td>
		<c:url var="fdetail" value="fdetail.do">
			<c:param name="free_no" value="${ li.free_no }" />
			<c:param name="page" value="${ currentPage }" />
		</c:url>
		<a href="${ fdetail }">${ li.free_title }</a>
	</td>
	<td>${ li.user_id }</td>
	<td>${ li.free_date }</td>
	<td>${ li.free_org_file }</td>
	<td>${ li.free_readcount }</td>
	<td>${ li.free_like }</td>
	<td>${ li.free_bad }</td>
</tr>
</c:forEach>
</table>
<br>

<!-- 페이징 처리 -->
<div style="text-align:center;">
   <c:if test="${ currentPage <= 1 }">
      [맨처음]
   </c:if>
   <c:if test="${ currentPage > 1 }">
      <c:url var="ubl" value="/flist.do">
         <c:param name="page" value="1" />
      </c:url>
      <a href="${ ubl }">[맨처음]</a>
   </c:if>
   
<!-- 이전 그룹으로 이동 처리 -->
<c:if test="${ (currentPage - 10) < startPage and (currentPage - 10) > 1 }">
   <c:url var="ubl2" value="/flist.do">
      <c:param name="page" value="${ startPage - 10 }"/>
   </c:url>
   <a href="${ ubl2 }">이전그룹</a>
</c:if>
<c:if test="${ !((currentPage - 10) < startPage and (currentPage - 10) > 1) }">
   &nbsp;&nbsp;이전그룹&nbsp;&nbsp;
</c:if>

<!-- 현재 페이지가 속한 페이지그룹의 숫자 출력 처리 -->
<c:forEach var="p" begin="${ startPage }" end="${ endPage }" step="1">
   <c:if test="${ p eq currentPage }">   
      <font weight="bolder" size="4"><b>${ p }</b></font>
   </c:if>
   <c:if test="${ p ne currentPage }">
      <c:url var="ubl3" value="/flist.do">
         <c:param name="page" value="${ p }"/>
      </c:url>
      <a href="${ ubl3 }">${ p }</a>
   </c:if>
</c:forEach>

<!-- 다음 그룹으로 이동 처리 -->
<c:if test="${ (currentPage + 10) > endPage && (currentPage + 10) < maxPage }">
   <c:url var="ubl4" value="/flist.do">
      <c:param name="page" value="${ endPage + 10 }"/>
   </c:url>
   <a href="${ ubl4 }">다음그룹</a>
</c:if>
<c:if test="${ !((currentPage + 10) > endPage && (currentPage + 10) < maxPage) }">
   &nbsp;&nbsp;다음그룹&nbsp;&nbsp;
</c:if>

<!-- 맨끝 페이지로 이동 처리 -->
<c:if test="${ currentPage >= maxPage }">
   [맨끝]
</c:if>   
<c:if test="${ currentPage < maxPage }">
   <c:url var="ubl5" value="/flist.do">
      <c:param name="page" value="${ maxPage }"/>
   </c:url>
   <a href="${ ubl5 }">[맨끝]</a>
</c:if>
</div>

<hr>
<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>