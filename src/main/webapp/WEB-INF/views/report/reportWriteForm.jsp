<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Whimory</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Do+Hyeon|Jua|Nanum+Gothic|Sunflower:300" rel="stylesheet">
<script type="text/javascript" src="${ pageContext.request.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
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
<br><br><br><br><br><br><br>
<h3 align="center">게시글 등록 페이지</h3><br>

<!-- form에서 입력값들과 파일을 함께 전송하려면 반드시 속성을 추가해야 함: enctype="multipart/form-data" -->
<form action="rpinsert.do" method="post" enctype="multipart/form-data">
<table class="table" style="table-layout: fixed; width:800px" align="center" cellspacing="0" cellpadding="3">
<tr><th align="right">제 목</th>
	<td colspan="7"><input type="text" name="report_title" size="72"></td>
</tr>
<tr><th align="right">작성자</th>
	<td colspan="7"><input type="text" name="user_id" readonly value="${ loginUser.user_id }"></td>
</tr>
<tr><th align="right">첨부파일</th>
	<td colspan="7"><input type="file" name="upfile"></td>
</tr>
<tr><th align="right">내   용</th>
	<td colspan="7"><textarea rows="10" cols="73" name="report_content"></textarea></td>
</tr>
<tr><th colspan="10">
	<div align="center" width="800px">
		<input type="submit" value="등록하기" class="btn btn-primary"> &nbsp;
		<input type="reset" value="다시쓰기" class="btn btn-outline-primary"> &nbsp;
		<input type="button" value="목록으로" class="btn btn-outline-danger" onclick="javascript:location.href='rplist.do?page=1'; return false;">
	</div>
	</th>
</tr>
</table>
</form>

<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>