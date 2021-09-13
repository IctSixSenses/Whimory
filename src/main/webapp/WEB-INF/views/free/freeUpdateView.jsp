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
<h2 align="center">${ requestScope.free.free_no } 번 게시글 수정 페이지</h2>

<!-- 원글 수정 폼 -->
<form action="fupdate.do" method="post" enctype="multipart/form-data">
	<input type="hidden" name="free_no" value="${ free.free_no }">
	<input type="hidden" name="page" value="${ page }">
	<input type="hidden" name="free_org_file" value="${ free.free_org_file }">
	<input type="hidden" name="free_re_file" value="${ free.free_re_file }">
	<table align="center" width="700" border="1" cellspacing="0" cellpadding="5">
		<tr><th width="120">제 목</th>
		   <td><input type="text" name="free_title" size="50" value="${ free.free_title }"></td>
		</tr>
		<tr><th>작성자</th>
		   <td><input type="text" name="user_id" readonly value="${ free.user_id }"></td>
		</tr>
		<tr>
			<th>파일선택</th>
			<td>
			<c:if test="${ !empty free.free_org_file }">		
				${ free.free_org_file } &nbsp; 
				<input type="checkbox" name="delflag" value="yes"> 파일삭제
				<br>
			</c:if>
			<input type="file" name="upfile">		
			</td>
		</tr>
		<tr><th>내 용</th>
		<td><textarea rows="7" cols="50" name="free_content">${ free.free_content }</textarea></td></tr>
		<tr><th colspan="2">
		<input type="submit" value="수정하기"> &nbsp; 
		<input type="reset" value="다시수정"> &nbsp;
		<input type="button" value="수정취소" onclick="javascript:history.go(-1); return false;">
		</th></tr>
	</table>
</form>





</body>
</html>