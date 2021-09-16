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
<c:import url="../common/menubar.jsp" />
<hr>

<h1 align="center">언론보도 등록</h1><br>

<!-- form에서 입력값들과 파일을 함께 전송하려면 반드시 속성을 추가해야 함: enctype="multipart/form-data" -->
<form action="winsert.do" method="post" enctype="multipart/form-data">
<table align="center" width="700" border="1" cellspacing="0" cellpadding="5">
<tr><th>관리자ID</th>
	<td><input type="text" name="user_id" readonly value="${ loginUser.user_id }"></td>
</tr>

<tr><th>제   목</th>
	<td><input type="text" name="news_title" size="50"></td>
</tr>

<tr><th>첨부파일</th>
	<td><input type="file" name="upfile">
	</td>
</tr>
<tr><th>내   용</th>
	<td><textarea rows="5" clos="400" name="news_content"></textarea></td>
</tr>
<tr><th>보도일</th>
	<td><input type="text" name="news_at_date" size="20"></td>
</tr>
<tr><th>원본 링크</th>
	<td><input type="text" name="news_link" size="50"></td>
</tr>
<tr><th colspan="2">
	<input type="button" value="작성취소" onclick="javascript:history.go(-1); return false;"> &nbsp;
	<input type="submit" value="등록하기">
	</th>
	
	</tr>

	
	
	
</table>

</form>
<br><br><br>

<hr>
<c:import url="../common/footer.jsp" />
</body>
</html>