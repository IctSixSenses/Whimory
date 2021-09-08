<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%-- <c:set var="listCount" value="${ listCount }" /> --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Whimory</title>
<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	var count = $('#klist-detail').length
	if(count % 3 == 0){
		$('#klist-row').html($('#klist-row').html() + '<br>');
	}
});

function moveWriteForm(){
	location.href="${pageContext.servletContext.contextPath}/kwmove.do";
}
</script>
<style>
.submenu {
	width: 200px;
	position: absolute;
	top: 250px;
	text-align: center;
}

.submenu ul li {
	list-style-type: none;
	text-align: center;
}

.submenu ul li h5 a {
	text-decoration: none;
	width: 90px;
	height: 30px;
	display: block;
	color: black;
	margin: 0;
	padding-top: 5px;
	align: center;
}

.submenu h5 a:hover {
	text-decoration: none;
	width: 90px;
	height: 30px;
	display: block;
	text-align: center;
	font-weight: bold;
	margin: 0;
	text-shadow: 1px 1px 1px white;
	background-color: pink;
	color: white;
}

.k-list {
	clear: left;
	position: relative;
	width: 1050px;
	left: 260px;
}

#ko_image {
	width: 270px;
	height: 190px;
	align: center;
}
</style>
</head>

<body>
<c:import url="/WEB-INF/views/common/menubar.jsp" />
<hr style="clear: both;">
<br><br>

<%-- 서브 메뉴바 --%>
<div class="submenu">
<ul>
	<li><font size="5"><b>Korea Origin</b></font></li>
	<hr align="center">
	<li><h5><a href="#">전체보기</a></h5></li>
	<li><h5><a href="#">역사</a></h5></li>
	<li><h5><a href="#">문화</a></h5></li>
	<li><h5><a href="#">음식</a></h5></li>
	<li><h5><a href="#">문화재</a></h5></li>
</ul>

</div>

<%-- 게시글 목록 --%>
<section class="k-list">

<div id="klist-row">
	<c:set var="i" value="0" />
	<c:set var="j" value="3" />
	<table>
		<tr style="border-bottom: 0.5px solid gray">
		<td><font size="5">전체 목록</font></td>
		<td colspan="2" align="right">
			<form action="ksearchword.do" method="post" align="right">
				<input type="hidden" name="ko_category" value="#">
				<input type="search" name="keyword" placeholder="검색어를 입력하세요">
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
					<img id="ko_image" src="${ pageContext.servletContext.contextPath }/resources/ko_upfiles/${ k.ko_re_file }">
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




