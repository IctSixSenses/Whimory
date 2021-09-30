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
<br><br><br><br><br><br><br><br>
<h3 align="center" style="font-family:Nanum Gothic; font-weight:530; color:#333333;">${ report.report_no }번 게시글 상세조회 페이지</h3><br>

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

<!-- 게시글 상세보기 -->
<table class="table" style="table-layout: fixed; width:1000px" align="center" cellspacing="0" cellpadding="3" >
	<tr>
		<td colspan="10" align="center" style="font-size: 17pt; background: WhiteSmoke" >${ report.report_title }</td>
	</tr>
	<tr>
		<td colspan="6"><b>작성자</b> &nbsp; ${ report.user_id }</td>
		<td colspan="4" align="right"> 
			<c:if test="${ report.report_modify eq null }">
				<b>등록일</b> &nbsp;<fmt:formatDate value="${ report.report_date }" pattern="yyyy-MM-dd" />
				 &nbsp;&nbsp;&nbsp;&nbsp; <b>조회수</b>&nbsp;&nbsp;${ report.report_readcount }&nbsp;&nbsp;
			</c:if>
			<c:if test="${ report.report_modify ne null }">
				<b>수정일</b> &nbsp;<fmt:formatDate value="${ report.report_modify }" pattern="yyyy-MM-dd" />
				 &nbsp;&nbsp;&nbsp;&nbsp; <b>조회수</b>&nbsp;&nbsp;${ report.report_readcount }&nbsp;&nbsp;
			</c:if>
		</td>	
	</tr>
	<tr>
		<td colspan="10">
			<c:if test="${ !empty report.report_org_file }">
				<c:url var="ubf" value="/rpfdown.do">
					<c:param name="ofile" value="${ report.report_org_file }"/>
					<c:param name="rfile" value="${ report.report_re_file }"/>
				</c:url>		
				<b>첨부파일</b> &nbsp;&nbsp; <a href="${ ubf }">${ report.report_org_file }</a>
			</c:if>
			<c:if test="${ empty report.report_org_file }">
			<b>첨부파일</b> &nbsp;&nbsp;&nbsp;&nbsp;- 
			</c:if>
		</td>
	</tr>
	<tr>
		<th>내용</th>
		<td colspan="9" align="left" height="280px">${ report.report_content }</td>
	</tr>
	<!-- 공감 기능 부분 -->
	<tr>
		<td colspan="10" align="right">
			<c:if test="${ !empty loginUser and loginUser.user_id != report.user_id }">
			<c:url var="rplike" value="rplike.do">
				<c:param name="report_no" value="${ report.report_no }" />
				<c:param name="user_id" value="${ loginUser.user_id }" />
				<c:param name="page" value="${ currentPage }" />
			</c:url>
				<img src="${ pageContext.request.contextPath }/resources/free_upfiles/like.PNG" onclick="javascript:location.href='${ rplike }';" width="28" height="28"> 공감 &nbsp;${ report.report_like }&nbsp;&nbsp;
			</c:if>
			<c:if test="${ empty loginUser or loginUser.user_id eq report.user_id }">
				<img src="${ pageContext.request.contextPath }/resources/free_upfiles/like.PNG"  width="28" height="28"> 공감 &nbsp;${ report.report_like }&nbsp;&nbsp;
			</c:if>
		</td>
	</tr>
	<tr rowspan="10">
		<td colspan="10" align="center">
			<button class="btn btn-primary" onclick="javascript:location.href='rplista.do?page=${ currentPage }';">목록으로</button>
		</td> 
	</tr>
</table>

<br>
<c:if test="${ !empty report.admin_comment }">
	<table class="table" style="table-layout: fixed; width:1000px" align="center" cellspacing="0" cellpadding="3" id="tbrpli">
	<tr>
		<th align="center">&nbsp;&nbsp;&nbsp;${ report.admin_id }</th>
		<td colspan="6">${ report.admin_comment }</td>
		<td colspan="2"><fmt:formatDate value="${ report.comment_date }" pattern="yyyy-MM-dd hh:mm:ss" /></td>
	<c:if test="${ loginUser.admin_yn eq 'Y' }">
		<c:url var="cmdelete" value="cmdelete.do">
		<c:param name="report_no" value="${ report.report_no }" />
		<c:param name="page" value="${ currentPage }" />
		</c:url>
		<td>
			<button onclick="javascript:location.href='${ cmdelete }'" class="btn btn-outline-danger">삭제</button>&nbsp;
		</td>
	</c:if>
	</tr>
	</table>
</c:if>
<c:if test="${ empty report.admin_comment }">
	<table align="center" width="1000px" height="110px" style="font-size:20px;" id="tbrpli" >
	<tr><td align="center"><font size="4"><b>등록된 답변이 없습니다.</b></font></td></tr>
	</table>
</c:if>
<c:if test="${ empty report.admin_comment && loginUser.admin_yn eq 'Y' }">
	<script>
  		document.getElementById('currentDate').value = new Date().toISOString().substring(0, 10);;
	</script>
	
	<form action="cmupdate.do" method="post">
	<input type="hidden" name="page" value="${ currentPage }">
	<input type="hidden" name="report_no" value="${ report.report_no }">
	<input type="hidden" name="admin_id" value="${ loginUser.user_id }">
	<table class="table" style="table-layout: fixed; width:1000px" align="center" cellspacing="0" cellpadding="3" id="tbrpli">
		<tr>
			<td align="center">${ loginUser.user_id }</td>
			<td colspan="8"><textarea rows="3" cols="96" name="admin_comment" placeholder="답변을 입력하세요."></textarea></td>	
			<td><input type="submit" value="등록" class="btn btn-outline-primary"></td>
		</tr>
	</table>
	</form>
</c:if>
<br><br><br><br>
<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>