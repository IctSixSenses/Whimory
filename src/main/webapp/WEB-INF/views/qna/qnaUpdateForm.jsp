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

<table align="center" width="800" border="1" cellspacing="0" cellpadding="5">
<tr><th>작성자</th>
   <td><input type="text" name="user_id" readonly value="${ sessionScope.loginUser.user_id }"></td></tr>

<tr>
	<th>질문 분류</th>
	<td>
		<form>
			<select name="qq_category">
				<option value="whimory1">정보게시판</option>
				<option value="whimory2">공지사항</option>
				<option value="whimory3">언론보도</option>
				<option value="whimory4">자유 토론 게시판</option>
				<option value="whimory5">역사 왜곡 제보하기</option>
				<option value="etc">기타</option>
			</select>
		</form>
		</td>
</tr>

<tr><th>제 목</th>
<td><input type="text" name="qq_title" size="50" value="${ question.qq_title }"></td></tr>

   <th>첨부파일</th>
   <td>
      <c:if test="${ !empty question.qq_org_file }">
         ${ question.qq_org_file } &nbsp; 
         <input type="file" name="upfile"> 
         <input type="checkbox" name="delFlag" value="yes"> 
         파일삭제
      </c:if>
      <%-- <% }else{ %> --%>
      <c:if test="${ empty question.qq_org_file }">
         첨부된 파일이 없습니다. &nbsp; 
         <input type="file" name="upfile">   
      </c:if>      
      <%-- <% } %> --%>
   </td>
</tr>
<tr><th>내 용</th>
   <td><textarea rows="5" cols="50" name="qq_content">${ question.qq_content }</textarea></td></tr>
<tr><th colspan="2">
	<input type="button" value="수정취소" 
      onclick="javascript:history.go(-1); return false;"> &nbsp;
   <input type="submit" value="수정하기">
</th></tr>
</table>
</form>
<br>
<hr>
<c:import url="../common/footer.jsp" />
</body>
</html>