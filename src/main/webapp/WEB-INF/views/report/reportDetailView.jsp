<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Whimory</title>
</head>
<body>
<c:import url="/WEB-INF/views/common/menubar.jsp" />
<hr>
<h1 align="center">${ report.report_no }번 게시글 상세조회 페이지</h1><br>

<table align="center" width="500" border="1" cellspacing="0" cellpadding="5">
<tr>
	<th width="120">제   목</th><td>${ report.report_title }</td>
</tr>
<tr>
	<th>작성자</th><td>${ report.user_id }</td>
</tr>
<tr>
	<th>등록날짜</th><td><fmt:formatDate value="${ report.report_date }" type="date" dateStyle="medium" /></td>
</tr>
<tr><th>첨부파일</th><td>
	<c:if test="${ !empty report.report_org_file }">
		<c:url var="uf" value="fdown.do">
			<c:param name="ofile" value="${ report.report_org_file }" />
			<c:param name="rfile" value="${ report.report_re_file }" />
		</c:url>
		<a href="${ uf }">${ report.report_org_file }</a>
	</c:if>
	<c:if test="${ empty report.report_org_file }">
		&nbsp;
	</c:if>
</td></tr>
<tr>
	<th>내   용</th><td>${ report.report_content }</td>
</tr>
<tr><th colspan="2">

	<c:if test="${ !empty loginUser }">
		<c:if test="${ loginUser.user_id == report.user_id }">
			<c:url var="rpuf" value="rpuf.do">
			<c:param name="report_no" value="${ report.report_no }" />
			<c:param name="page" value="${ currentPage }" />
		</c:url>
		<button onclick="javascript:location.href='${ rpuf }';">수정페이지로 이동</button>
		</c:if>
		<c:if test="${ loginUser.user_id == report.user_id }">
			<c:url var="rpdelete" value="rpdelete.do">
			<c:param name="report_no" value="${ report.report_no }" />
			<c:param name="report_re_file" value="${ report.report_re_file }" />
			</c:url>
			<button onclick="javascript:location.href='${ rpdelete }';">삭제하기</button>
		</c:if>
	</c:if> &nbsp; 

	<c:if test="${ !empty loginUser and loginUser.user_id != report.user_id }">
		<c:url var="rplike" value="rplike.do">
		<c:param name="report_no" value="${ report.report_no }" />
		<c:param name="page" value="${ currentPage }" />
		</c:url>
		<button onclick="javascript:location.href='${ rplike }';">공감 ${ report.report_like }</button>
	</c:if>
	<c:if test="${ empty loginUser or loginUser.user_id eq report.user_id }">
		<button>공감 ${ report.report_like }</button>
	</c:if>
	
	<button onclick="javascript:location.href='rplist.do?page=${ currentPage }';">목록으로</button>
		
</th></tr>
</table>

<br>
<c:if test="${ !empty report.admin_comment }">
	<table align="center" width="500" border="1" cellspacing="0" cellpadding="5">
	<tr>
		<td>${ report.admin_id }</td>
		<td>${ report.admin_comment }</td>
		<td>${ report.comment_date }</td>
	</tr>
	</table>
</c:if>

<hr>
<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>