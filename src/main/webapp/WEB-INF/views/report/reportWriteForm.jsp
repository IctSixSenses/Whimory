<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Whimory</title>
</head>
<body>
<c:import url="/WEB-INF/views/common/menubar.jsp" />
<hr>

<h1 align="center">게시글 등록 페이지</h1><br>

<!-- form에서 입력값들과 파일을 함께 전송하려면 반드시 속성을 추가해야 함: enctype="multipart/form-data" -->
<form action="rpinsert.do" method="post" enctype="multipart/form-data">
<table align="center" width="500" border="1" cellspacing="0" cellpadding="5">
<tr><th>제   목</th>
	<td><input type="text" name="report_title" size="50"></td>
</tr>
<tr><th>작성자</th>
	<td><input type="text" name="user_id" readonly value="${ loginUser.user_id }"></td>
</tr>
<tr><th>첨부파일</th>
	<td><input type="file" name="upfile"></td>
</tr>
<tr><th>내   용</th>
	<td><textarea rows="5" cols="50" name="report_content"></textarea></td>
</tr>
<tr><th colspan="2">
	<input type="submit" value="등록하기"> &nbsp;
	<input type="reset" value="작성취소"> &nbsp;
	<input type="button" value="목록으로" onclick="javascript:location.href='rplist.do?page=1'; return false;"></th></tr>
</table>
</form>

<hr>
<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>