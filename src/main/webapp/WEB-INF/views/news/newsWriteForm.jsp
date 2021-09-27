<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Whimory</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
<!-- Bootstrap CSS -->
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Do+Hyeon|Jua|Nanum+Gothic|Sunflower:300" rel="stylesheet">
<style type="text/css">
html head{
	font-family: Roboto, Nanum Gothic;
}
html body{
	font-family: Roboto, Nanum Gothic;
} 
table tr td a { text-decoration:none } 
</style> 
<script type="text/javascript" src="${ pageContext.request.contextPath }/resources/js/jquery-3.6.0.min.js"></script>

</head>
<body>
<c:import url="../common/menubar.jsp" />

<br><br><br><br><br><br><br>
<h1 align="center">언론보도 등록 페이지</h1><br>

<!-- form에서 입력값들과 파일을 함께 전송하려면 반드시 속성을 추가해야 함: enctype="multipart/form-data" -->
<form action="winsert.do" method="post" enctype="multipart/form-data">
<table class="table" style="table-layout: fixed; width:900px" align="center" cellspacing="0" cellpadding="3">
	<tr>
		<th align="rigth">관리자ID</th>
		<input type="hidden" name="user_id" id="user_id" value="${ loginUser.user_id }">
		<td colspan="7">${ loginUser.user_id }</td>
	</tr>
	
	<tr>
		<th align="rigth">제   목</th>
		<td colspan="7"><input type="text" name="news_title" size="80"></td>
	</tr>
	
	<tr>
		<th align="rigth">첨부파일</th>
		<td colspan="7"><input type="file" name="upfile"></td>
	</tr>
	<tr>
		<th align="rigth">내   용</th>
		<td colspan="7"><textarea rows="7" cols="82" name="news_content"></textarea></td>
	</tr>
	<tr><th align="rigth">보도일</th>
		<td colspan="7"><input type="text" name="news_at_date" size="20"></td>
	</tr>
	<tr>
		<th align="rigth">원본 링크</th>
		<td colspan="7"><input type="text" name="news_link" size="80"></td>
	</tr>
	
	<tr><th colspan="10">
		<div width="850" align="center">
		<input type="reset" value="작성취소" class="btn btn-outline-danger"> &nbsp;
		<input type="submit" value="등록하기" class="btn btn-outline-info">
		</th>
		
		</tr>
	
		
		
		
</table>

</form>
<br><br><br>

<hr>
<c:import url="../common/footer.jsp" />
</body>
</html>