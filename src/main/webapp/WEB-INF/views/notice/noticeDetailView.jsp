<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Whimory Notice</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" 
	rel="stylesheet" 
	integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" 
	crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/css/bootstrap-select.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA==" crossorigin="anonymous" />
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Do+Hyeon|Jua|Nanum+Gothic|Sunflower:300" rel="stylesheet">
<style type="text/css">
/* 폰트 적용 */
html head{
	font-family: Roboto, Nanum Gothic;
}
html body{
	font-family: Roboto, Nanum Gothic;
}
</style>
<script type="text/javascript" src="${ pageContext.request.contextPath }/resources/js/jquery-3.6.0.min.js"></script>

</head>

<body>
<c:import url="/WEB-INF/views/common/menubar.jsp" />
<hr style="clear:both"><br>

<%-- 게시글 상세보기 --%>
<table class="table" style="width:1000px;"  align="center">
	<tr><td colspan="10" align="center" style="font-size: 17pt; background: WhiteSmoke">
		<font size="5">${ notice.notice_title }</font>
	</td></tr>
	<tr>
		<td colspan="3" align="left">작성자 &nbsp; ${ notice.user_id }</td>
		<td colspan="7" align="right">
			<c:if test="${ notice.notice_modify eq null }">
				등록일 &nbsp;<fmt:formatDate value="${ notice.notice_date }" pattern="yyyy.MM.dd." />
				 &nbsp;&nbsp; 조회수 ${ notice.notice_readcount }	
			</c:if>
			<c:if test="${ notice.notice_modify ne null }">
				수정일 &nbsp;<fmt:formatDate value="${ notice.notice_modify }" pattern="yyyy.MM.dd." />
				 &nbsp;&nbsp; 조회수 ${ notice.notice_readcount }	
			</c:if>
		</td>
	</tr>
	<tr height="200px"><td colspan="10">${ notice.notice_content }</td></tr>
	<tr>
		<td colspan="10" style="text-align:left;">
			<c:if test="${ !empty notice.notice_org_file }">
				<c:url var="nfd" value="nfdown.do">
					<c:param name="ofile" value="${ notice.notice_org_file }"/>
					<c:param name="rfile" value="${ notice.notice_re_file }"/>
				</c:url>		
				<a href="${ nfd }">${ notice.notice_org_file }</a>
			</c:if>
			<c:if test="${ empty notice.notice_org_file }">
				&nbsp;
			</c:if>
		</td>
	</tr>
	<tr>
		<%-- 관리자일 때 수정/삭제/글쓰기 버튼 보임 --%>
		<c:if test="${ loginUser.admin_yn eq 'Y' }">
			<td colspan="10" align="right">
				<c:url var="nup" value="nupview.do">
					<c:param name="notice_no" value="${ notice.notice_no }" />
				</c:url>
				<button class="btn btn-outline-success" onclick="javascript:location.href='${nup}' return false;">수정</button>
				<c:url var="ndel" value="ndelete.do">
					<c:param name="notice_no" value="${ notice.notice_no }" />
				</c:url>
				<button class="btn btn-outline-success" onclick="javascript:location.href='${ndel}' return false;">삭제</button>
				<c:url var="nwm" value="nwmove.do" />
				<button class="btn btn-success" onclick="javascript:location.href='${nwm}' return false;">글쓰기</button>
			</td>
		</c:if>
	</tr>
</table>
<div align="center">
	<button class="btn btn-success" onclick="javascript:location.href='nlist.do'">목록</button>
</div>




<br><br><br><hr style="clear:both">
<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>






