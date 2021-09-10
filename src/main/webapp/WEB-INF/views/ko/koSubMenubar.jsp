<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Whimory</title>
<style type="text/css">
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

</style>
</head>
<body>

<div class="submenu">
<ul>
	<li><font size="5"><b>Korea Origin</b></font></li>
	<hr align="center">
	<li><h5>
		<c:url var="klist" value="klist.do" />
		<a href="${ klist }">전체보기</a>
	</h5></li>
	<li><h5>
		<c:url var="history" value="kcate.do">
			<c:param name="cate" value="history" />
		</c:url>
		<a href="${ history }">역사</a>
	</h5></li>
	<li><h5>
		<c:url var="culture" value="kcate.do">
			<c:param name="cate" value="culture" />
		</c:url>
		<a href="${ culture }">문화</a>
	</h5></li>
	<li><h5>
		<c:url var="food" value="kcate.do">
			<c:param name="cate" value="food" />
		</c:url>
		<a href="${ food }">음식</a>
	</h5></li>
	<li><h5>
		<c:url var="culheri" value="kcate.do">
			<c:param name="cate" value="culheri" />
		</c:url>
		<a href="${ culheri }">문화재</a>
	</h5></li>	
</ul>
</div>

</body>
</html>