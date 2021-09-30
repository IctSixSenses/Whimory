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
	<br><br><br><br><br><br><br><br><br>
	
	<div align="center">
	<h2 align="center" style="font-family:Nanum Gothic; font-weight:630; color:#333333;">휘모리(Whimory) 회원 아이디 확인</h2><br><br>
		<h4 align="center" style="font-family:Nanum Gothic; font-weight:630; color:#333333;">${ user.user_name }님의 아이디는</h4> <br><br> 
		<h3 align="center" style="font-family:Nanum Gothic; font-weight:630; color:blue;">${ user.user_id }</h3> <br><br>
		<h4 align="center" style="font-family:Nanum Gothic; font-weight:630; color:#333333;">입니다.</h4> 
		<br><br>
		<button class="btn btn-outline-primary"
			onclick="javascript:location.href='findaccount.do';">비밀번호 찾기</button>
		&nbsp; &nbsp;
	</div>
	<br><br><br>
	
	<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>