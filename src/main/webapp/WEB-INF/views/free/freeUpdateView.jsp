<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     

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

<script type="text/javascript" src="${ pageContext.request.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
</head>
<body>
<c:import url="/WEB-INF/views/common/menubar.jsp" />
<hr>
<h3 align="center">${ requestScope.free.free_no }번 게시글 수정 페이지</h3>
<br>

<!-- 원글 수정 폼 -->
<form action="fupdate.do" method="post" enctype="multipart/form-data">
	<input type="hidden" name="free_no" value="${ free.free_no }">
	<input type="hidden" name="page" value="${ page }">
	<input type="hidden" name="free_org_file" value="${ free.free_org_file }">
	<input type="hidden" name="free_re_file" value="${ free.free_re_file }">
	<table class="table" style="table-layout: fixed; width:800px" align="center" cellspacing="0" cellpadding="3">
		<tr>
			<th align="right">제 목</th>
			<td colspan="7"><input type="text" name="free_title" size="72" value="${ free.free_title }"></td>
		</tr>
		<tr>
			<th align="right">작성자</th>
			<input type="hidden" name="user_id" value="${ loginUser.user_id }">
			<td colspan="7">${ loginUser.user_id }</td>
		</tr>
		<tr>
			<th align="right">파일선택</th>
			<td colspan="7">
				<c:if test="${ !empty free.free_org_file }">		
					${ free.free_org_file } &nbsp; 
					<input type="checkbox" name="delflag" value="yes"> 파일삭제
				</c:if>	
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="file" name="upfile">
			</td>
		</tr>
		<tr>
			<th>내 용</th>
			<td><textarea rows="10" cols="73" name="free_content">${ free.free_content }</textarea></td>
		</tr>
		<tr>
			<th colspan="10">
				<div align="center" width="800px">
					<input type="reset" value="다시수정" class="btn btn-outline-primary"> &nbsp;
					<input type="submit" value="수정하기" class="btn btn-primary"> &nbsp; 
					<input type="button" value="수정취소" onclick="javascript:history.go(-1); return false;" class="btn btn-outline-danger">
				</div>
			</th>
		</tr>
	</table>
</form>





</body>
</html>