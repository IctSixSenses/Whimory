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

<table align="center" width="700" border="1" cellspacing="0" cellpadding="5">
<tr><th>관리자ID</th>
   <td><input type="text" name="user_id" readonly value="${ sessionScope.loginUser.user_id }"></td></tr>


<tr><th>제 목</th>
<td><input type="text" name="news_title" size="50" value="${ news.news_title }"></td></tr>

   <th>첨부파일</th>
   <td>
      <c:if test="${ !empty news.news_org_file }">
         ${ news.news_org_file } &nbsp; 
         <input type="file" name="upfile">
         <input type="checkbox" name="delFlag" value="yes"> 
         파일삭제
      </c:if>
      <%-- <% }else{ %> --%>
      <c:if test="${ empty news.news_org_file }">
         첨부된 파일이 없습니다. &nbsp; 
         <input type="file" name="upfile">   
      </c:if>      
      <%-- <% } %> --%>
   </td>
</tr>
<tr><th>내 용</th>
   <td><textarea rows="5" cols="50" name="news_content">${ news.news_content }</textarea></td></tr>
<tr><th>보도일</th>
	<td><input type="text" name="news_at_date" size="50" value="${ news.news_at_date }"></td></tr>
<tr><th>원본 링크</th>
	<td><input type="text" name="news_link" size="50" value="${ news.news_link }"></td></tr>   
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