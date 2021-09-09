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
<!-- 
	<c:if test="${ !empty loginMember }">
		<c:if test="${ loginMember.userid == board.board_writer }">
			<c:url var="ubup" value="bupview.do">
			<c:param name="board_num" value="${ board.board_num }" />
			<c:param name="page" value="${ currentPage }" />
		</c:url>
		<a href="${ ubup }">[수정페이지로 이동]</a>
		</c:if>
		<c:if test="${ loginMember.userid == board.board_writer }">
			<c:url var="ubd" value="bdelete.do">
			<c:param name="board_num" value="${ board.board_num }" />
			<c:param name="board_level" value="${ board.board_level }" />
			<c:param name="board_rename_filename" value="${ board.board_rename_filename }" />
			</c:url>
			<a href="${ ubd }">[삭제]</a>
		</c:if>
		<c:if test="${ loginMember.userid != board.board_writer }">
			<c:url var="brf" value="breplyform.do">
			<c:param name="bnum" value="${ board.board_num }" />
			<c:param name="page" value="${ currentPage }" />
			</c:url>
			<a href="${ brf }">[댓글 달기]</a>
		</c:if>
	</c:if> &nbsp; 
-->
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