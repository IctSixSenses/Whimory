<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Whimory</title>
</head>
<body>
<c:import url="../common/menubar.jsp" />
<hr>

<h2 align="center">질문했어요!</h2><br>

<table align="center" width="700" border="1" cellspacing="0" cellpadding="5">
<tr><th width="120">작성자</th><td>${ question.user_id }</td></tr>
<tr><th>질문 분류</th><td>${ question.qq_category }</td></tr>
<tr><th>제목</th><td>${ question.qq_title }</td></tr>
<tr><th>첨부파일</th>
	<td>
		<c:if test="${ !empty question.qq_org_file }">
				<c:url var="qdown" value="/qfdown.do">
					<c:param name="ofile" value="${ question.qq_org_file }" />
					<c:param name="rfile" value="${ question.qq_re_file }" />
				</c:url>
				<a href="${ qdown }">${ question.qq_org_file }</a>
		</c:if>
		<c:if test="${ empty question.qq_org_file }">
				&nbsp;
		</c:if>
	</td>
</tr>
<tr><th>내용</th><td>${ question.qq_content }</td></tr>

<tr><th colspan="2">
<%-- 수정페이지로 이동 버튼 --%>
<c:url var="qupdate" value="/qupmove.do">
   <c:param name="qq_no" value="${ question.qq_no }" />
</c:url>
<button onclick="javascript:location.href='${ qupdate }';">수정하기</button> &nbsp; 
<%-- 삭제하기 버튼 --%>
<c:url var="qdelete" value="/qdelete.do">
   <c:param name="qq_no" value="${ question.qq_no }" />
   <c:if test="${ !empty question.qq_org_file }">
      <c:param name="rfile" value="${ question.qq_re_file }" />
   </c:if>
</c:url>
<button onclick="javascript:location.href='${ qdelete }';">삭제하기</button> &nbsp; 
<%-- 이전페이지로 이동 --%>
<button onclick="javascript:history.go(-1);">목록보기</button></th></tr>
</table>







<hr>
<c:import url="../common/footer.jsp" />
</body>
</html>