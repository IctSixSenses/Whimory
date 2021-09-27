<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Page</title>
<script type="text/javascript">
//유효성 검사
	function validate(){
		var pwd1 = document.getElementById("userpwd").value;
		var pwd2 = document.getElementById("userpwd2").value;
		
		if(pwd1 !== pwd2){
			alert("암호와 암호 확인이 일치하지 않습니다.\n" +
					"다시 입력하세요");
			document.getElementById("user_pwd").select();
		}		
	}
</script>
</head>
<body>
<c:import url="/WEB-INF/views/common/menubar.jsp" />
<br><br><br><br><br><br><br>
<c:import url="/WEB-INF/views/common/menubarA.jsp"/>
<h1 align="center">회원 정보 보기</h1>
<br>

<table id="outer" align="center" width="500" cellspacing="5" cellpadding="0">

<tr height = "60">
	<th width="120">이 름</th>
	<td><input type="text" name="user_name" 
	value="${ requestScope.user.user_name }" readonly></td>
</tr>
<tr height = "60">
	<th>아이디</th>
	<td><input type="text" name="user_id" 
	value="${ requestScope.user.user_id }" readonly></td>
</tr>
<tr height = "60">
	<th>성 별</th>
	<td>
	<c:if test="${ user.gender eq 'M' }">	
		<input type="radio" name="gender" value="M" checked readonly> 남자 &nbsp; 
	    <input type="radio" name="gender" value="F" readonly> 여자
	</c:if>
	<c:if test="${ user.gender eq 'F' }">	  
		<input type="radio" name="gender" value="M" readonly> 남자 &nbsp; 
	    <input type="radio" name="gender" value="F" checked readonly> 여자
	</c:if>
	</td>
</tr>
<tr height = "60">
	<th>생 일</th>
	<td><input type="date" name="birth"
	value="${ requestScope.user.birth }" readonly></td>
</tr>
<tr height = "60">
	<th>전화번호</th>
	<td><input type="tel" name="phone" 
	value="${ requestScope.user.phone }" readonly></td>
</tr>
<tr height = "60">
	<th>이메일</th>
	<td><input type="email" name="email" 
	value="${ requestScope.user.email }" readonly></td>
</tr>
<tr>
	<th colspan="2"> 	
		<button class="btn btn-outline-primary"
					onclick="javascript:history.go(-1);">회원 목록</button>
	</th>	
</tr>


</table>
<hr>
<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>