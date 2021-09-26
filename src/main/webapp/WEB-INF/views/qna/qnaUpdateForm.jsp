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

<h1 align="center">질문 수정할게요!</h1>
<br>
<!-- form 에서 입력값들과 파일을 함께 전송하려면
반드시 속성을 추가해야 함 : enctype="multipart/form-data" -->
<form action="qupdate.do" method="post" enctype="multipart/form-data">
	<input type="hidden" name="qq_no" value="${ question.qq_no }">   
	<c:if test="${ !empty question.qq_org_file }">
		<input type="hidden" name="qq_org_file" value="${ question.qq_org_file }">
		<input type="hidden" name="qq_re_file" value="${ question.qq_re_file }">
	</c:if>

<table class="table" style="table-layout: fixed; width:800px" align="center" cellspacing="0" cellpadding="3">
	<tr>
		<th width="100">작성자</th>
		<input type="hidden" name="user_id" id="user_id" value="${ loginUser.user_id }">
		<td colspan="10">${ sessionScope.loginUser.user_id }</td>
	</tr>
	
	<tr>
		<th>질문 분류</th>
		<td colspan="10">
			<form>
				<select name="qq_category">
					<option value="정보게시판">정보게시판</option>
					<option value="공지사항">공지사항</option>
					<option value="언론보도">언론보도</option>
					<option value="자유 토론 게시판">자유 토론 게시판</option>
					<option value="역사 왜곡 제보하기">역사 왜곡 제보하기</option>
					<option value="기타">기타</option>
				</select>
			</form>
			</td>
	</tr>
	
	<tr>
		<th>제 목</th>
		<td colspan="10"><input type="text" name="qq_title" size="80" value="${ question.qq_title }"></td>
	</tr>
	<tr>
	   <th>첨부파일</th>
	   <td colspan="10">
	      <c:if test="${ !empty question.qq_org_file }">
	         ${ question.qq_org_file } &nbsp; 
	         <input type="checkbox" name="delFlag" value="yes"> 파일삭제
	         <input type="file" name="upfile"> 
	      </c:if>
	      <%-- <% }else{ %> --%>
	      <c:if test="${ empty question.qq_org_file }">
	         첨부된 파일이 없습니다. &nbsp; 
	         <input type="file" name="upfile">   
	      </c:if>      
	      <%-- <% } %> --%>
	   </td>
	</tr>
	<tr>
		<th>내 용</th>
	    <td colspan="10"><textarea rows="7" cols="80" name="qq_content">${ question.qq_content }</textarea></td>
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
<br>
<hr>
<c:import url="../common/footer.jsp" />
</body>
</html>