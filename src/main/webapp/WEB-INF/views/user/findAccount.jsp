<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디/비밀번호 찾기</title>
</head>
<body>
<c:import url="/WEB-INF/views/common/menubar.jsp" />
<hr>
<!-- 해당 과정에서 인증 절차가 어떻게 들어가면 되는지 고민중 -->
<!-- 아이디 찾기 -->
<h2 align="center">아이디 찾기</h2>
<br>
<div id="findid" align="center">
<form action="findid.do" method="post">
<label>이름 : <input type="text" name="user_name"></label><br><br>
<label>이메일 : <input type="text" name="email"></label><br><br>
<input class="btn btn-outline-primary" type= "submit" value = "아이디 찾기">
<br><br>
</form>
</div>

<hr>
<!-- 비밀번호 변경하기 -->
<h2 align = "center">비밀번호 찾기</h2>
<br>
<div id="findpwd" align="center">
<form action="findid.do" method="post">
<label>아이디 : <input type="text" name="user_name"></label><br><br>
<label>이메일 : <input type="text" name="email"></label><br><br>
<input class="btn btn-outline-primary" type= "submit" value = "비밀번호 찾기">
<br><br>
</form>
</div>
<hr>
<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>