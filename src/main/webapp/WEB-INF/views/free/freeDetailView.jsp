<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 

<c:set var="currentPage" value="${ requestScope.currentPage }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Whimory</title>
<link rel="stylesheet"
     href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
</head>

<body>
<c:import url="/WEB-INF/views/common/menubar.jsp"/>
<hr>
<h3 align="center">${ requestScope.free.free_no }번 게시글 상세보기</h3>
<br>

<!-- 수정/삭제 버튼 -->
<table width="1000px" align="center">
	<tr align="right">
		<td colspan="10" align="right">
			<c:if test="${ !empty sessionScope.loginUser }">
				<c:if test="${ loginUser.user_id eq free.user_id }">
				    <c:url var="ubup" value="/fupview.do">
				    	<c:param name="free_no" value="${ free.free_no }"/>
				    	<c:param name="page" value="${ currentPage }"/>
				    </c:url>
				    <button onclick="javascript:location.href='${ ubup }'" class="btn btn-outline-primary">수정하기</button>
				</c:if>
				<c:if test="${ loginUser.user_id eq free.user_id or sessionScope.loginUser.admin_yn eq 'Y'}"> 
				    <c:url var="ubd" value="/fdelete.do">
				    	<c:param name="free_no" value="${ free.free_no }"/>
				    	<c:param name="free_re_file" value="${ free.free_re_file }"/>
				    </c:url>
				    <button onclick="javascript:location.href='${ ubd }'" class="btn btn-outline-danger">삭제하기</button>&nbsp; 
			    </c:if>
			</c:if> 
		</td>
	</tr>
</table>

<table class="table" style="table-layout: fixed; width:1000px" align="center" cellspacing="0" cellpadding="3">
	<tr>
		<td colspan="10" align="center" style="font-size: 16pt; background: WhiteSmoke" >${ free.free_title }</td>
	</tr>
	<tr>
		<th colspan="1" align="right">작성자</th>
		<td colspan="9">${ free.user_id }</td></tr>
	<tr>
		<th colspan="1" align="right">등록일</th>
		<td colspan="9"><fmt:formatDate value="${ free.free_date }" type="date" pattern="yyyy/MM/dd" /></td>
	</tr>
	<tr>
		<th colspan="1" align="right">첨부파일</th>
		<td colspan="9">
			<c:if test="${ !empty free.free_org_file }">
				<c:url var="ubf" value="/ffdown.do">
					<c:param name="ofile" value="${ free.free_org_file }"/>
					<c:param name="rfile" value="${ free.free_re_file }"/>
				</c:url>		
				<a href="${ ubf }">${ free.free_org_file }</a>
			</c:if>
			<c:if test="${ empty free.free_org_file }">
			&nbsp;
			</c:if>
		</td>
	</tr>
	<tr>
		<th colspan="1">내용</th>
		<td colspan="9" align="left" height="280px">${ free.free_content }</td>
	</tr>
	<tr>
		<c:if test="${ !empty sessionScope.loginUser }">
			<td colspan="10" align="center">
				<c:url var="ubl" value="/flist.do">  	
				  	<c:param name="page" value="${ currentPage }"/>
				</c:url>
				<button onclick="javascript:location.href='${ ubl }'" class="btn btn-primary">목록보기</button>&nbsp;
			</td> 
		</c:if>
	</tr>
</table>

<%-- 댓글 등록 폼 --%>
<div align="center" width="1000px">함께 이야기 해봐요😆</div>

<c:if test="${ !empty loginUser }">
	<form action="frinsert.do" method="post">
		<table class="table" style="table-layout: fixed; width:1000px" align="center" cellspacing="0" cellpadding="3">
			<tr>
				<td colspan="1" align="center">${ loginUser.user_id }</td>
				<td colspan="8"><textarea rows="3" cols="105"name="freply" placeholder="댓글을 입력하세요"></textarea></td>	
				<td colspan="1"><input type="submit" value="등록" class="button"></td>
			</tr>
		</table>
	</form>
</c:if>

<!-- 댓글 목록 -->
<table class="table" style="table-layout: fixed; width:1000px" align="center" cellspacing="0" cellpadding="3">
   <c:forEach items="${ frlist }" var="frli">
		<tr>
			<td colspan="1" align="center">${ frli.user_id }</td>
			<td colspan="8">${ frli.free_reply_content }</td>	
			<c:if test="${ loginUser.user_id eq frli.user_id or loginUser.admin_yn eq 'Y'}"> 
				<td colspan="1">
					<c:url var="frdel" value="/frdelete.do">
				    	<c:param name="free_no" value="${ frli.free_no }"/>
				    </c:url>
				    <button onclick="javascript:location.href='${ frdel }'" class="btn btn-outline-danger">삭제</button>&nbsp; 
				</td>
			</c:if>
		</tr>
	</c:forEach>
</table>







<hr>
<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>