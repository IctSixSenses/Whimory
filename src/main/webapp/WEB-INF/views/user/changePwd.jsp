<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
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
<script type="text/javascript"
	src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

function validate(){
	
	var pwdValue = document.getElementById("user_pwd").value;
	var pwdValue2 = document.getElementById("userpwd2").value;

	if(pwdValue !== pwdValue2){
		alert("암호와 암호 확인의 값이 일치하지 않습니다.");
		document.getElementById("user_pwd").select();
		return false;
	}

	return true;
}
</script>
</head>
<body>
<c:import url="/WEB-INF/views/common/menubar.jsp" />
<hr>
<h3>
${user.user_name} 님 어서오세요.
</h3>
<div id="changpwd" align = "center">
<br>
<h3>새로운 비밀번호를 설정해주세요.</h3>
<form action="changePwd.do" method="post">
<input type= "hidden" name="user_id" value = "${user.user_id}"> <!-- 아이디 값을 넘겨줌 -->
<input type="hidden" name="origin_userpwd" value="${ requestScope.user.user_pwd }">
<label>비밀번호 : <input type="password" name="user_pwd"></label><br><br>
<label>비밀번호 확인 : <input type="password" id="userpwd2"></label><br><br>
<input class="btn btn-outline-primary" type= "submit" value = "비밀번호 변경">
<br><br>
</form>
</div>

<hr>
<c:import url="/WEB-INF/views/common/footer.jsp" />

</body>
</html>