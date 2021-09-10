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
</head>

<body>
<c:import url="/WEB-INF/views/common/menubar.jsp"/>
<hr>
<h2 align="center">${ requestScope.free.free_no } 번 게시글 상세보기</h2>
<br>

<table align="center" width="700" border="1" cellspacing="0" cellpadding="5">
	<tr><th width="150">제 목</th><td>${ free.free_title }</td></tr>
	<tr><th>작성자</th><td>${ free.user_id }</td></tr>
	<tr><th>등록일</th>
	<td><fmt:formatDate value="${ free.free_date }" type="date" pattern="yyyy/MM/dd" /></td></tr>
	<tr>
		<th>첨부파일</th>
		<td>
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
	<tr><th>내 용</th><td>${ free.free_content }</td></tr>
	<tr><th colspan="2">
	<c:if test="${ !empty sessionScope.loginUser }">
		<c:if test="${ loginUser.user_id eq free.user_id }">
		    <c:url var="ubup" value="/fupview.do">
		    	<c:param name="free_no" value="${ free.free_no }"/>
		    	<c:param name="page" value="${ currentPage }"/>
		    </c:url>
		    <a href="${ ubup }">[수정페이지로 이동]</a>
		    &nbsp; &nbsp; 
		    <c:url var="ubd" value="/fdelete.do">
		    	<c:param name="free_no" value="${ free.free_no }"/>
		    	<c:param name="free_re_file" value="${ free.free_re_file }"/>
		    </c:url>
		    <a href="${ ubd }">[글삭제]</a>
		    &nbsp; &nbsp; 
	    </c:if>
	</c:if> 
	&nbsp; &nbsp; 
	<c:url var="ubl" value="/flist.do">  	
	  	<c:param name="page" value="${ currentPage }"/>
	</c:url>
	<button onclick="javascript:location.href='${ ubl }'">목록</button>
	</th></tr>
</table>


<hr>
<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>