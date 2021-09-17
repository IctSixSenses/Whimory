<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	
	<script type="text/javascript">
	function movePage2() {
		location.href = "enrollPage.do";
	}
	</script>
</head>
<body>
<c:import url="/WEB-INF/views/common/menubar.jsp" />
<hr>
<!-- title -->
<h1 align="center">휘모리 Whimory 로그인</h1>
<br>
<!-- 로그인 창 -->
<div id="login" align="center">
<form action="login.do" method="post">
<label>아이디 : <input type="text" name="user_id"></label><br><br>
<label>비밀번호 : <input type="password" name="user_pwd"></label><br><br>
<input class="btn btn-outline-primary" type= "submit" value = "로그인">
<br><br>
</form>

<!-- 회원가입 버튼 -->
	<form class="d-flex" style="align:center">
		<button class="btn btn-outline-success" onclick="movePage2()">회원가입</button>
	</form>
</div>
<hr>
<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>