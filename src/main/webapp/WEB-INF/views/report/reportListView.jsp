<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Whimory</title>
</head>
<body>
<c:import url="/WEB-INF/views/common/menubar.jsp" />
<hr>
<h1 align="center">역사왜곡 제보 게시판</h1>
<h2 align="center">총 게시글 갯수: ${ listCount }</h2>
<c:if test="${ !empty loginUser }">
	<div style="align: center; text-align: center;">
		<button onclick="javascript:location.href='rpwf.do';">글쓰기</button>
	</div>
</c:if>
<br>
<table align="center" border="1" cellspacing="0" cellpadding="5" width="700">
<tr>
	<th></th>
	<th>번호</th>
	<th>제목</th>
	<th>작성자</th>
	<th>등록날짜</th>
	<th>첨부파일</th>
	<th>조회수</th>
</tr>
<c:forEach items="${ list }" var="r">
<tr>
	<td>
		<c:if test="${ r.admin_comment != null }">
			※
		</c:if>
	</td>
	<td>${ r.report_no }</td>
	<td>
		<c:url var="rpdetail" value="rpdetail.do">
			<c:param name="report_no" value="${ r.report_no }" />
			<c:param name="page" value="${ currentPage }" />
		</c:url>
		<a href="${ rpdetail }">${ r.report_title }</a>
	</td>
	<td>${ r.user_id }</td>
	<td>${ r.report_date }</td>
	<td>${ r.report_org_file }</td>
	<td>${ r.report_readcount }</td>
</tr>
</c:forEach>
</table>
<br>

<%-- 페이징 처리 --%>
<div style="text-align:center;">
	<c:if test="${ currentPage <= 1 }">
		[첫 페이지] &nbsp;
	</c:if>
	<c:if test="${ currentPage > 1 }">
		<c:url var="rplist.do" value="/rplist.do">
			<c:param name="page" value="${ startPage }" />
		</c:url>
		<a href="${ rplist }">[첫 페이지]</a> &nbsp;
	</c:if>
	
	<%-- 이전 페이지 그룹으로 이동 --%>
	<c:if test="${ (currentPage - 10) < startPage && (currentPage - 10) > 1 }">
		<c:url var="rplist" value="/rplist.do">
			<c:param name="page" value="${ startPage - 10 }" />
		</c:url>
		<a href="${ rplist }">[이전]</a> &nbsp;
	</c:if>
	<c:if test="${ (currentPage - 10) >= startPage && (currentPage - 10) <= 1 }">
		[이전] &nbsp;
	</c:if>
	
	<%-- 현재 페이지 숫자 출력 --%>
	<c:forEach var="p" begin="${ startPage }" end="${ endPage }">
		<c:if test="${ p == currentPage }">
			<font color="red" size="4">[${ p }]</font>
		</c:if>
		<c:if test="${ p != currentPage }">
			<c:url var="rplist" value="/rplist.do">
				<c:param name="page" value="${ p }" />
			</c:url>
			<a href="${ rplist }">${ p }</a>
		</c:if>
	</c:forEach> &nbsp;
	
	<%-- 다음 페이지 그룹으로 이동 --%>
	<c:if test="${ (currentPage + 10) > endPage && (currentPage + 10) < maxPage }">
		<c:url var="rplist" value="/rplist.do">
			<c:param name="page" value="${ endPage + 10 }" />
		</c:url>
		<a href="${ rplist }">[다음]</a> &nbsp;
	</c:if>
	<c:if test="${ (currentPage + 10) <= endPage && (currentPage + 10) >= maxPage }">
		[다음] &nbsp;
	</c:if>
	
	<c:if test="${ currentPage >= maxPage }">
		[마지막 페이지] &nbsp;
	</c:if>
	<c:if test="${ currentPage < maxPage }">
		<c:url var="rplist" value="/rplist.do">
			<c:param name="page" value="${ maxPage }" />
		</c:url>
		<a href="${ rplist }">[마지막 페이지]</a> &nbsp;
	</c:if>
	
</div>

<hr>
<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>