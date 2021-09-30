<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<!-- Favicons -->
<link
	href="${ pageContext.request.contextPath }/resources/images/tgmark.png"
	rel="icon">

<!-- Bootstrap CSS -->
<link
	href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Do+Hyeon|Jua|Nanum+Gothic|Sunflower:300"
	rel="stylesheet">
<style type="text/css">
html head {
	font-family: Roboto, Nanum Gothic;
}

html body {
	font-family: Roboto, Nanum Gothic;
}

table tr td a, div a {
	text-decoration: none;
	color: black;
}

.send-button {
	font-family: Roboto, Nanum Gothic;
	background: skyblue;
	border: 1px solid #fff;
	border-radius: 5px;
	width: 300px;
	font-weight: 600;
	color: #fff;
	padding: 8px 25px;
}

.f-button {
	font-family: Roboto, Nanum Gothic;
	color: #000 !important;
	border: 1px solid #fff;
	border-radius: 5px;
	background: #fff !important;
	width: 300px;
	font-weight: 600;
	color: #fff;
	padding: 8px 25px;
	margin-bottom: 10px;
}

.e-button {
	color: #000 !important;
	border: 1px solid #fff;
	border-radius: 5px;
	background: #FFEFD5 !important;
	width: 300px;
	font-weight: bolder;
	color: #fff;
	padding: 8px 25px;
	margin-bottom: 10px;
}

.my-input {
	box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.1);
	cursor: text;
	padding: 8px 10px;
	margin-bottom: 20px;
	transition: border .1s linear;
}

.header-title {
	margin: 5rem 0;
}

div h2 {
	font-family: Roboto, Nanum Gothic;
	font-size: 30px;
	line-height: 40px;
	font-weight: bold;
	color: #404f52;
}

div h3 {
	font-family: Roboto, Nanum Gothic;
	color: #5e8396;
	font-size: 20px;
	line-height: 32px;
	font-weight: 400;
}

.login-or {
	position: relative;
	color: #aaa;
	margin-top: 10px;
	margin-bottom: 10px;
	padding-top: 10px;
	padding-bottom: 10px;
}

.span-or {
	display: block;
	position: absolute;
	left: 50%;
	top: -2px;
	margin-left: -25px;
	background-color: #fff;
	width: 50px;
	text-align: center;
}

.hr-or {
	height: 1px;
	margin-top: 0px !important;
	margin-bottom: 0px !important;
}
</style>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/css/bootstrap-select.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css"
	integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA=="
	crossorigin="anonymous" />
<script type="text/javascript"
	src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	function validate() {

		var pwdValue = document.getElementById("user_pwd").value;
		var pwdValue2 = document.getElementById("userpwd2").value;

		if (pwdValue !== pwdValue2) {
			alert("암호와 암호 확인의 값이 일치하지 않습니다.");
			document.getElementById("user_pwd").select();
			return false;
		}

		return true;
	}

	function checkform() {

		if (document.change.user_pwd.value == "") {
			alert('비밀번호를 입력하세요.');
			document.change.user_pwd.focus();
		} else if (document.change.userpwd2.value == "") {
			alert('비밀번호 확인을 입력하세요.');
			document.change.userpwd2.focus();
		} else {
			alert('비밀번호 수정이 완료되었습니다.\n로그인 페이지로 이동합니다.');
			document.change.submit();
		}
	}
</script>
</head>
<body>
	<c:import url="/WEB-INF/views/common/menubar.jsp" />
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>


	<div class="container">
		<div class="col-md-6 mx-auto text-center">
			<div>
				<h2>휘모리(Whimory) 회원 비밀번호 변경</h2>
				<br>
				<h3>${user.user_name}님 어서오세요.</h3>
				<br>
				<h3>새로운 비밀번호를 설정해주세요.</h3>
				<br>
			</div>
		</div>
		<div class="row">
			<div class="col-md-4 mx-auto">
				<div class="myform form ">
					<!-- 로그인 창 -->
					<form action="changePwd.do" name="change" method="post">
					<input type="hidden" name="user_id" value="${user.user_id}">
					<input type="hidden" name="origin_userpwd" value="${ requestScope.user.user_pwd }">
						<div class="form-group">
							<input type="password" name="user_pwd"
								class="form-control my-input" id="user_pwd" placeholder="비밀번호 (8~20자)" />
						</div>
						<div class="form-group">
							<input type="password" class="form-control my-input"
								id="userpwd2" placeholder="비밀번호 확인" />
						</div>
						<div class="text-center">
							<button type="button" onclick="javascript:checkform();"
								class="send-button">비밀번호 변경</button>
							<div style="height: 10px;"></div>

						</div>
					</form>

				</div>
			</div>
		</div>
	</div>

	<br>
	<br>
	<br>
	<br>
	<c:import url="/WEB-INF/views/common/footer.jsp" />

</body>
</html>