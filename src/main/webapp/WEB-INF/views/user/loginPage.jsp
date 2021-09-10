<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Whimory Login</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<script type="text/javascript"
	src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
</head>
<body>
<!-- title -->
<h1 align="center">휘모리 Whimory 로그인</h1>
<!-- 로그인 창 -->
<div id="login" align="center">
<form action="login.do" method="post">
<label>아이디 : <input type="text" name="user_id"></label><br>
<label>비밀번호 : <input type="password" name="user_pwd"></label><br>
<input class="btn btn-outline-primary" type= "submit" value = "로그인">
</form>
</div>
</body>
</html>