<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Whimory</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
<script type="text/javascript" src="${ pageContext.request.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
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
</head>
<body>
<c:import url="../common/menubar.jsp" />
<br><br><br><br><br><br><br>
<h1 align="center">언론보도 수정</h1>
<br>
<!-- form 에서 입력값들과 파일을 함께 전송하려면
반드시 속성을 추가해야 함 : enctype="multipart/form-data" -->
<form action="wupdate.do" method="post" enctype="multipart/form-data">
	<input type="hidden" name="news_no" value="${ news.news_no }">   
	<c:if test="${ !empty news.news_org_file }">
		<input type="hidden" name="news_org_file" value="${ news.news_org_file }">
		<input type="hidden" name="news_re_file" value="${ news.news_re_file }">
	</c:if>

	<table class="table" style="table-layout: fixed; width:800px" align="center" cellspacing="0" cellpadding="3">
	<tr>
		<th>관리자ID</th>
			<input type="hidden" name="user_id" id="user_id" value="${ loginUser.user_id }">
			<td colspan="7">${ loginUser.user_id }</td>
		</tr>
	
	<tr>
		<th>제 목</th>
		<td colspan="7"><input type="text" name="news_title" size="80" value="${ news.news_title }"></td>
	</tr>
	
	<tr>
	   <th>첨부파일</th>
	   <td colspan="7">
	      <c:if test="${ !empty news.news_org_file }">
	         ${ news.news_org_file } &nbsp; 
	         <input type="checkbox" name="delFlag" value="yes"> 파일삭제
	         <input type="file" name="upfile">
	      </c:if>
	      <%-- <% }else{ %> --%>
	      <c:if test="${ empty news.news_org_file }">
	         첨부된 파일이 없습니다. &nbsp; 
	         <input type="file" name="upfile">   
	      </c:if>      
	      <%-- <% } %> --%>
	   </td>
	</tr>
	<tr>
		<th>내 용</th>
	   	<td colspan="7"><textarea rows="10" cols="80" name="news_content">${ news.news_content }</textarea></td></tr>
	<tr>
		<th>보도일</th>
		<td colspan="7"><input type="text" name="news_at_date" size="50" value="${ news.news_at_date }"></td></tr>
	<tr>
		<th>원본 링크</th>
		<td colspan="7"><input type="text" name="news_link" size="80" value="${ news.news_link }"></td></tr>   
	<tr>
		<th colspan="10">
			<div align="center" width="800px">
				<input type="button" value="수정취소" onclick="javascript:history.go(-1); return false;" class="btn btn-outline-danger"> &nbsp;
			   	<input type="submit" value="수정하기" class="btn btn-outline-primary">
		   	</div>
	</th></tr>
	</table>
</form>
<br>
<hr>
<c:import url="../common/footer.jsp" />
</body>
</html>