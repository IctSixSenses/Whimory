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

<!-- 댓글 목록 -->
<table class="table" style="table-layout: fixed; width:1000px" align="center" cellspacing="0" cellpadding="3">
   <c:forEach items="${ alist }" var="ali">
		<tr>
			<th colspan="2" align="center">&nbsp;&nbsp;&nbsp;${ ali.user_id }</th>
			<td colspan="8">${ ali.qa_content }</td>	
			<td colspan="2">${ ali.qa_date }</td>	
	
				<td colspan="2">
					<c:url var="adelete" value="/adelete.do">
						<c:param name="page" value="${ currentPage }"/>
						<c:param name="qq_no" value="${ ali.qq_no }"/>
				    	<c:param name="qa_no" value="${ ali.qa_no }"/>
				    </c:url>
				    <button onclick="javascript:location.href='${ adelete }'" class="btn btn-outline-danger">삭제</button>&nbsp; 
				</td>
		
		</tr>
	</c:forEach>
</table>
<%-- 댓글 등록 폼 --%>
<div align="center" width="1000px" style="font-size:20px;">답변을 남겨주세요</div>
<div align="center" width="1000px" height="20px"></div>

	<form action="ainsert.do" method="post">
		<input type="hidden" name="page" id="page" value="${ currentPage } ">
		<input type="hidden" name="qq_no" id="qq_no" value="${ question.qq_no }">
		<input type="hidden" name="user_id" id="user_id" value="${ loginUser.user_id }">
		<table class="table" style="table-layout: fixed; width:1000px" align="center" cellspacing="0" cellpadding="3">
			<tr style="border-top:none;">
				<td colspan="1" align="center">${ loginUser.user_id }</td>
				<td colspan="10"><textarea rows="3" cols="105" name="qa_content" placeholder="답변을 남겨주세요."></textarea></td>	
				<td colspan="1"><input type="submit" value="등록" class="button"></td>
			</tr>
		</table>
	</form>
<hr>
<c:import url="../common/footer.jsp" />
</body>
</html>