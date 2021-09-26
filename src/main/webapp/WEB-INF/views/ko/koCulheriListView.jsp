<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%-- <c:set var="listCount" value="${ listCount }" /> --%>
<c:set var="category" value="${ category }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Whimory KO</title>
<!-- Favicons -->
<link href="${ pageContext.request.contextPath }/resources/images/tgmark.png" rel="icon">

<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" 
	rel="stylesheet" 
	integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" 
	crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Do+Hyeon|Jua|Nanum+Gothic|Sunflower:300" rel="stylesheet">
<style type="text/css">

/* 폰트 적용 */
html head{
	font-family: Roboto, Nanum Gothic;
}
html body{
	font-family: Roboto, Nanum Gothic;
}

/* 본문 css */
.k-list {
	clear: left;
	position: relative;
	width: 1000px;
	left: 230px;
	top: -100px;
}

.ko_image {
	width: 300px;
	height: 210px;
	align: center;
}

div table tr td a {
	text-decoration: none;
	color: black;
}

div table tr td a:hover {
	color: black;
}
</style>
<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.0.min.js"></script>

</head>

<body>
<c:import url="/WEB-INF/views/common/menubar.jsp" />
<br><br>

<%-- 서브 메뉴바 --%>
<c:import url="/WEB-INF/views/ko/koSubMenubar.jsp" />

<%-- 게시글 목록 --%>
<section class="k-list">

<h2 align="center">Korea Origin</h2><br><br>

<div id="klist-row">
	<c:set var="i" value="0" />
	<c:set var="j" value="3" />
	<table width="1000px">
		<tr style="height: 50px; border-bottom: 0.5px solid gray">
		<td colspan="2"><font size="5">문화재</font>
			&nbsp;&nbsp;
			<c:if test="${ loginUser.admin_yn ne null and loginUser.admin_yn eq 'Y' }">
				<c:url var="kwf" value="kwmove.do" />
				<button class="btn btn-outline-primary" onclick="javascript:location.href='${kwf}'">글쓰기</button>
			</c:if>
		</td>
		<td colspan="7" align="right">
			<div style="width: 450px;">
				<form action="ksearchword.do" method="post" align="right">
					<input type="hidden" name="ko_category" value="${ category }">
					<input type="search" name="ko_title" size="30" placeholder="검색어를 입력하세요" style="width: 250px; float: left;" class="form-control">
					<input type="submit" class="btn btn-outline-primary" style="float: left;" value="검색">
					<input type="reset" class="btn btn-primary" onclick="resetList(); return false;" style="float: left;" value="전체 목록">
				</form>
			</div>
		</td>
		</tr>
		<c:forEach items="${ list }" var="k" >
			<c:if test="${ i % j == 0 }">
				<tr style="height:370px;">
			</c:if>
			<td colspan="3" style="width:350px; align:center;">
				<c:url var="kdetail" value="kdetail.do">
					<c:param name="ko_no" value="${ k.ko_no }" />
				</c:url>
				<a href="${ kdetail }">
					<img class="ko_image" src="${ pageContext.servletContext.contextPath }/resources/ko_upfiles/${ k.ko_re_file }"><br>
					<div style="height:10px;"></div>
					<font size="4pt"><b>${ k.ko_title }</b></font>
				</a><br><div style="height:6px;"></div>
				<div style="background: WhiteSmoke; width: 300px;">
					<c:forTokens items="${ k.ko_hashtag }" delims="," var="hashtag">
						<c:out value="#${hashtag}" />
					</c:forTokens>
				</div>
			</td>
			<c:if test="${ i % j == j - 1 }">
				</tr>
			</c:if>
			<c:set var="i" value="${ i+1 }" />
		</c:forEach>
	</table>
</div>


</section>





<br><br><br><br><br>
<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>




