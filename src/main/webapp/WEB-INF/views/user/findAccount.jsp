<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디/비밀번호 찾기</title>
<script type="text/javascript"
	src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function() {

		$("input[name=item]").on("change", function() {

			$("input[name=item]").each(function(index) {
				if ($(this).is(":checked")) {
					$("form.sform").eq(index).css("display", "block");
				} else {
					$("form.sform").eq(index).css("display", "none");
				}
			});
		});
	});
</script>
<style>
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

	<!-- 
	<fieldset id="ss">
<legend>검색할 항목을 선택하세요.</legend>
<input type="radio" name="item" id="uid"> 회원 아이디 &nbsp; 
<input type="radio" name="item" id="upwd"> 성별 &nbsp; 
</fieldset>
-->

	<div class="container">
		<div class="col-md-6 mx-auto text-center">
			<div>
				<h2>휘모리(Whimory) 계정 찾기</h2>
				<br>
				<h3>아이디 찾기</h3>
				<br>
			</div>
		</div>
		<div class="row">
			<div class="col-md-4 mx-auto">
				<div class="myform form ">
					<!-- 아이디 찾기 창 -->
					<form action="findid.do" method="post">
						<div class="form-group">
							<input type="text" name="user_name" class="form-control my-input"
								id="user_name" placeholder="이름" />
						</div>
						<div class="form-group">
							<input type="email" name="email" class="form-control my-input"
								id="email" placeholder="이메일" />
						</div>
						<div class="text-center">
							<button type="submit" class="send-button">아이디 찾기</button>
							<div style="height: 10px;"></div>
						</div>
					</form>
					<div class="col-md-12 ">
						<div class="login-or">
							<hr class="hr-or">
							<span class="span-or">or</span>
						</div>
					</div>

					<div class="myform form ">
						<!-- 비밀번호 찾기 창 -->
						<br>
						<div class="col-md-6 mx-auto text-center">
							<div>
								<h3>비밀번호 찾기</h3>
							</div>
						</div>
						<br>
						<form action="findpwd.do" method="post">
							<div class="form-group">
								<input type="text" name="user_id" class="form-control my-input"
									id="user_id" placeholder="아이디" />
							</div>
							<div class="form-group">
								<input type="email" name="email" class="form-control my-input"
									id="email" placeholder="이메일" />
							</div>
							<div class="text-center">
								<button type="submit" class="send-button">비밀번호 찾기</button>
								<div style="height: 10px;"></div>
							</div>
						</form>
					</div>

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