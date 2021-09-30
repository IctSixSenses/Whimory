<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Whimory</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Do+Hyeon|Jua|Nanum+Gothic|Sunflower:300" rel="stylesheet">
<style type="text/css">
html head{
	font-family: Roboto, Nanum Gothic;
}
html body{
	font-family: Roboto, Nanum Gothic;
} 
</style>
</head>
<body>
<c:import url="/WEB-INF/views/common/menubar.jsp" />
<br><br><br><br><br><br><br><br>
<h3 align="center" style="font-family:Nanum Gothic; font-weight:530; color:#333333;">${ report.report_no }번 제보글 수정 페이지</h3><br>

<form action="rpupdate.do" method="post" enctype="multipart/form-data">
<input type="hidden" name="report_no" value="${ report.report_no }">
<input type="hidden" name="report_org_file" value="${ report.report_org_file }">
<input type="hidden" name="report_re_file" value="${ report.report_re_file }">
<input type="hidden" name="page" value="${ page }">

<table class="table" style="table-layout: fixed; width:800px" align="center" cellspacing="0" cellpadding="3">
<tr><th align="right">제 목</th>
	<td colspan="7"><input type="text" name="report_title" size="72" value="${ report.report_title }"></td>
</tr>
<tr><th align="right">작성자</th>
	<td colspan="7"><input type="text" name="user_id" readonly value="${ report.user_id }"></td>
</tr>
<tr><th align="right">첨부파일</th>
	<td colspan="7">
		<c:if test="${ !empty report.report_org_file }">
			${ report.report_org_file } &nbsp;
			<input type="checkbox" name="delFlag" value="yes">파일 삭제<br>
			변경: <input type="file" name="upfile">
		</c:if>
		<c:if test="${ empty report.report_org_file }">
			첨부된 파일 없음 <br>
			추가: <input type="file" name="upfile">
		</c:if>
	</td>
</tr>
<tr><th align="right">내   용</th>
	<td colspan="7"><textarea rows="10" cols="73" name="report_content">${ report.report_content }</textarea></td>
</tr>
<tr><th colspan="10">
	<div align="center" width="800px">
		<input type="reset" value="다시수정" class="btn btn-outline-primary"> &nbsp;
		<input type="submit" value="수정하기" class="btn btn-primary"> &nbsp;
		<input type="button" value="수정취소" class="btn btn-outline-danger" onclick="javascript:history.go(-1); return false;"> &nbsp;
	</div>
</th></tr>
</table>

</form>
<br><br><br><br><br>
<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>