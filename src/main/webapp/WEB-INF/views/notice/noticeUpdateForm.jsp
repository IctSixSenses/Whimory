<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Whimory</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
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
<h3 align="center" style="font-family:Nanum Gothic; font-weight:530; color:#333333;">공지사항 수정</h3>
<br>
<!-- form 에서 입력값들과 파일을 함께 전송하려면
반드시 속성을 추가해야 함 : enctype="multipart/form-data" -->
<form action="nupdate.do" method="post" enctype="multipart/form-data">
	<input type="hidden" name="notice_no" value="${ notice.notice_no }">   
	<c:if test="${ !empty notice.notice_org_file }">
		<input type="hidden" name="notice_org_file" value="${ notice.notice_org_file }">
		<input type="hidden" name="notice_re_file" value="${ notice.notice_re_file }">
	</c:if>

<table class="table" style="table-layout: fixed; width:800px" align="center" cellspacing="0" cellpadding="3">
	<tr>
		<th width="100">글제목</th>
		<td colspan="10"><input type="text" name="notice_title" size="80" value="${ notice.notice_title }"></td>
	</tr>
	<tr>
		<th>작성자</th>
		<input type="hidden" name="user_id" id="user_id" value="${ loginUser.user_id }">
		<td colspan="10">${ sessionScope.loginUser.user_id }</td>
	</tr>
	
	
	<tr>
	   <th>첨부파일</th>
	   <td colspan="10">
	      <c:if test="${ !empty notice.notice_org_file }">
	         ${ notice.notice_org_file } &nbsp; 
	         <input type="checkbox" name="delFlag" value="yes"> 파일삭제
	         <input type="file" name="upfile"> 
	      </c:if>
	      <%-- <% }else{ %> --%>
	      <c:if test="${ empty notice.notice_org_file }">
	         첨부된 파일이 없습니다. &nbsp; 
	         <input type="file" name="upfile">   
	      </c:if>      
	      <%-- <% } %> --%>
	   </td>
	</tr>
	<tr>
		<th>내 용</th>
	    <td colspan="10"><textarea rows="7" cols="80" name="notice_content">${ notice.notice_content }</textarea></td>
	</tr>
	<tr>
		<th colspan="10">
			<div align="center" width="800px">
				<input type="button" value="수정취소" onclick="javascript:history.go(-1); return false;" class="btn btn-outline-danger"> &nbsp;
		   		<input type="submit" value="수정하기" class="btn btn-outline-primary">
		   	</div>
		</th>
	</tr>
</table>
</form>
<br><br><br><br><br>
<c:import url="../common/footer.jsp" />
</body>
</html>