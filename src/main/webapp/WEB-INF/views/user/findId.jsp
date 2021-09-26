<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<script type="text/javascript"
	src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<c:import url="/WEB-INF/views/common/menubar.jsp" />
	<hr>
	<div align="center">
		<h3>${ user.user_name }님의 아이디는 <br> 
		&nbsp; &nbsp; ${ user.user_id } 입니다.</h3>
		<button class="btn btn-outline-primary"
			onclick="javascript:location.href='findaccount.do';">비밀번호 찾기</button>
		&nbsp; &nbsp;
	</div>
	<hr>
	<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>