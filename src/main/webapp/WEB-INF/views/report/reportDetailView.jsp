<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Whimory</title>
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Do+Hyeon|Jua|Nanum+Gothic|Sunflower:300" rel="stylesheet">
<style type="text/css">
html head{
	font-family: Roboto, Nanum Gothic;
}
html body{
	font-family: Roboto, Nanum Gothic;
} 
table#tbrp, #tbrpli, #tbrpins{
	border-top: 1px solid white;
	border-bottom: 1px solid white;
}
</style>
</head>
<body>
<c:import url="/WEB-INF/views/common/menubar.jsp" />
<hr>
<h3 align="center">${ report.report_no }번 게시글 상세조회 페이지</h3><br>

<!-- 수정/삭제 버튼 -->
<table width="1000px" align="center">
	<tr align="right">
		<td colspan="10" align="right">
		<c:if test="${ !empty loginUser }">
			<c:if test="${ loginUser.user_id == report.user_id }">
				<c:url var="rpuf" value="rpuf.do">
					<c:param name="report_no" value="${ report.report_no }" />
					<c:param name="page" value="${ currentPage }" />
				</c:url>
			<button onclick="javascript:location.href='${ rpuf }';" class="btn btn-outline-primary">수정하기</button>
			</c:if>
			<c:if test="${ loginUser.user_id == report.user_id or loginUser.admin_yn eq 'Y' }">
				<c:url var="rpdelete" value="rpdelete.do">
					<c:param name="report_no" value="${ report.report_no }" />
					<c:param name="report_re_file" value="${ report.report_re_file }" />
				</c:url>
			<button onclick="javascript:location.href='${ rpdelete }';" class="btn btn-outline-danger">삭제하기</button>
			</c:if>
		</c:if>
		</td>
	</tr>
</table>

<table class="table" style="table-layout: fixed; width:1000px" align="center" cellspacing="0" cellpadding="3">
<tr>
	<td colspan="10" align="center" style="font-size: 17pt; background: WhiteSmoke">${ report.report_title }</td>
</tr>
<tr>
	<th>작성자</th><td colspan="9">${ report.user_id }</td>
</tr>
<tr>
	<th>등록날짜</th><td colspan="9"><fmt:formatDate value="${ report.report_date }" type="date" dateStyle="medium" /></td>
</tr>
<tr><th>첨부파일</th><td colspan="9">
	<c:if test="${ !empty report.report_org_file }">
		<c:url var="uf" value="fdown.do">
			<c:param name="ofile" value="${ report.report_org_file }" />
			<c:param name="rfile" value="${ report.report_re_file }" />
		</c:url>
		<a href="${ uf }">${ report.report_org_file }</a>
	</c:if>
	<c:if test="${ empty report.report_org_file }">
		&nbsp;
	</c:if>
</td></tr>
<tr>
	<th>내   용</th><td colspan="9" align="left" height="280px">${ report.report_content }</td>
</tr>
<tr>
	<td colspan="10" align="right">
		<c:if test="${ !empty loginUser and loginUser.user_id != report.user_id }">
			<c:url var="rplike" value="rplike.do">
				<c:param name="report_no" value="${ report.report_no }" />
				<c:param name="user_id" value="${ loginUser.user_id }" />
				<c:param name="page" value="${ currentPage }" />
			</c:url>
			<button class="btn btn-outline-primary" onclick="javascript:location.href='${ rplike }';">공감 ${ report.report_like }</button>
		</c:if>
		<c:if test="${ empty loginUser or loginUser.user_id eq report.user_id }">
			<button class="btn btn-outline-primary">공감 ${ report.report_like }</button>
		</c:if>
	</td>
</tr> 
</table>

<table align="center" width="1000px" height="110px" style="font-size:20px;" id="tbrp" >
	<tr rowspan="2">
		<td colspan="10" align="center">
			<button class="btn btn-outline-primary" onclick="javascript:location.href='rplist.do?page=${ currentPage }';">목록으로</button>
		</td> 
	</tr>
</table>

<br>
<c:if test="${ !empty report.admin_comment }">
	<table class="table" style="table-layout: fixed; width:1000px" align="center" cellspacing="0" cellpadding="3" id="tbrpli">
	<tr>
		<th align="center">${ report.admin_id }</th>
		<td colspan="6">${ report.admin_comment }</td>
		<td>${ report.comment_date }</td>
	<c:if test="${ loginUser.admin_yn eq 'Y' }">
		<td>
			<c:url var="cmdelete" value="cmdelete.do">
			<c:param name="report_no" value="${ report.report_no }" />
			<c:param name="page" value="${ currentPage }" />
			</c:url>
			<button class="btn btn-outline-danger" onclick="javascript:location.href='${ cmdelete }';">삭제하기</button>
		</td>
	</c:if>
	</tr>
	</table>
</c:if>
<c:if test="${ empty report.admin_comment && loginUser.admin_yn eq 'Y' }">
	<script>
  		document.getElementById('currentDate').value = new Date().toISOString().substring(0, 10);;
	</script>
	
	<form action="cmupdate.do" method="post">
	<table align="center">
	<tr>
		<input type="hidden" name="page" value="${ currentPage }">
		<input type="hidden" name="report_no" value="${ report.report_no }">
		<input type="hidden" name="admin_id" value="${ loginUser.user_id }">
		<td><textarea rows="5" cols="50" name="admin_comment"></textarea></td>
		<td colspan="2">
		&nbsp;<input type="submit" value="답변하기" class="btn btn-outline-primary">
		</td>
	</tr>
	</table>
	</form>
</c:if>

<hr>
<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>