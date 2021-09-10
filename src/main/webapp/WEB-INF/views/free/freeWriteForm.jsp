<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<h2 align="center">자유 토론 게시글 등록 페이지</h2>

<!-- form 에서 입력값들과 파일을 같이 전송하려면, 반드시 enctype="multipart/form-data" 속성 추가 -->
<form action="finsert.do" method="post" enctype="multipart/form-data">
<table align="center" width="500" border="1" cellspacing="0" cellpadding="5">
	<tr><th>제 목</th>
		<td><input type="text" name="free_title" size="50"></td>
	</tr>
	<tr><th>작성자</th>
	   <td><input type="text" name="user_id" readonly value="${ loginUser.user_id }"></td>
	</tr>
	<tr>
		<th>파일선택 : </th>
		<td><input type="file" name="upfile">		
		</td>
	</tr>
	<tr><th>내 용</th>
		<td><textarea rows="5" cols="50" name="free_content"></textarea></td>
	</tr>
	<tr><th colspan="2" align="center">
		<input type="reset" value="다시작성"> &nbsp;
		<input type="submit" value="등록하기"> &nbsp; 
		<input type="button" value="목록" onclick="javascript:history.go(-1); return false;">
	</th></tr>
</table>





<hr>
<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>