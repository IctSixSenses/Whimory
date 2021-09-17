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

<h1 align="center">${ report.report_no }번 제보글 수정 페이지</h1><br>

<form action="rpupdate.do" method="post" enctype="multipart/form-data">
<input type="hidden" name="report_no" value="${ report.report_no }">
<input type="hidden" name="report_org_file" value="${ report.report_org_file }">
<input type="hidden" name="report_re_file" value="${ report.report_re_file }">
<input type="hidden" name="page" value="${ page }">

<table align="center" width="500" border="1" cellspacing="0" cellpadding="5">
<tr><th>제   목</th>
	<td><input type="text" name="report_title" size="50" value="${ report.report_title }"></td>
</tr>
<tr><th>작성자</th>
	<td><input type="text" name="user_id" readonly value="${ report.user_id }"></td>
</tr>
<tr><th>첨부파일</th><td>
	<c:if test="${ !empty report.report_org_file }">
		${ report.report_org_file } &nbsp;
		<input type="checkbox" name="delFlag" value="yes">파일 삭제<br>
		변경: <input type="file" name="upfile">
	</c:if>
	<c:if test="${ empty report.report_org_file }">
		첨부된 파일 없음 <br>
		추가: <input type="file" name="upfile">
	</c:if>
</td></tr>
<tr><th>내   용</th>
	<td><textarea rows="5" cols="50" name="report_content">${ report.report_content }</textarea></td>
</tr>
<tr><th colspan="2">
	<input type="submit" value="수정하기"> &nbsp;
	<input type="reset" value="수정취소"> &nbsp;
	<input type="button" value="이전 페이지로" onclick="javascript:history.go(-1); return false;"> &nbsp;
	<input type="button" value="목록으로" onclick="javascript:location.href='rplist.do?page=${ page }'; return false;">
</th></tr>
</table>

</form>

<hr>
<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>