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
<style type="text/css">
.k-list {
	clear: left;
	position: relative;
	width: 1000px;
	left: 230px;
}

.ko_image {
	width: 270px;
	height: 190px;
	align: center;
}

a {
	text-decoration: none;
	color: black;
}
</style>
<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.0.min.js"></script>

</head>

<body>
<c:import url="/WEB-INF/views/common/menubar.jsp" />
<hr style="clear: both;">
<br><br>

<%-- 서브 메뉴바 --%>
<c:import url="/WEB-INF/views/ko/koSubMenubar.jsp" />

<%-- 게시글 목록 --%>
<section class="k-list">

<div id="klist-row">
	<c:set var="i" value="0" />
	<c:set var="j" value="3" />
	<table width="1000px">
		<tr style="border-bottom: 0.5px solid gray">
		<td><font size="5">역사</font></td>
		<td align="right">
			<c:if test="${ loginUser.admin_yn ne null and loginUser.admin_yn eq 'Y' }">
				<c:url var="kwf" value="kwmove.do" />
				<button onclick="javascript:location.href='${kwf}'">글쓰기</button>
			</c:if>
		</td>
		<td colspan="2" align="right">
			<form action="ksearchword.do" method="post" align="right">
				<input type="hidden" name="ko_category" value="${ category }">
				<input type="search" name="ko_title" placeholder="검색어를 입력하세요">
				<input type="submit" value="검색">
			</form>
		</td>
		</tr>
		<c:forEach items="${ list }" var="k" >
			<c:if test="${ i % j == 0 }">
				<tr style="height:370px">
			</c:if>
			<td style="width:350px; align:center;">
				<c:url var="kdetail" value="kdetail.do">
					<c:param name="ko_no" value="${ k.ko_no }" />
				</c:url>
				<a href="${ kdetail }">
					<img class="ko_image" src="${ pageContext.servletContext.contextPath }/resources/ko_upfiles/${ k.ko_re_file }">
					<br>${ k.ko_title }
				</a><br>
				<div style="background: skyblue;">${ k.ko_hashtag }</div>
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
<hr style="clear: both;">
<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>




