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
<hr>
<h1 align="center">내 정보 수정</h1>
<br>
<form method="post" action="uupdate.do">
<input type="hidden" name="origin_userpwd" value="${ requestScope.user.user_pwd }">
<table id="outer" align="center" width="500" cellspacing="5" cellpadding="0">
<tr>
	<th width="120">이 름</th>
	<td><input type="text" name="user_name" 
	value="${ requestScope.user.user_name }" readonly></td>
</tr>
<tr>
	<th>아이디</th>
	<td><input type="text" name="user_id" 
	value="${ requestScope.user.user_id }" readonly></td>
</tr>
<tr>
	<th>암 호</th>
	<td><input type="password" name="user_pwd" id="user_pwd" value="" required></td>
</tr>
<tr>
	<th>암호확인</th>
	<td><input type="password" id="userpwd2" onblur="validate();" required></td>
</tr>
<tr>
	<th>성 별</th>
	<td>
	<c:if test="${ user.gender eq 'M' }">	
		<input type="radio" name="gender" value="M" checked> 남자 &nbsp; 
	    <input type="radio" name="gender" value="F"> 여자
	</c:if>
	<c:if test="${ user.gender eq 'F' }">	  
		<input type="radio" name="gender" value="M"> 남자 &nbsp; 
	    <input type="radio" name="gender" value="F" checked> 여자
	</c:if>
	</td>
</tr>
<tr>
	<th>생 일</th>
	<td><input type="date" name="birth"
	value="${ requestScope.user.birth }"></td>
</tr>
<tr>
	<th>전화번호</th>
	<td><input type="tel" name="phone" 
	value="${ requestScope.user.phone }" readonly></td>
</tr>
<tr>
	<th>이메일</th>
	<td><input type="email" name="email" 
	value="${ requestScope.user.email }" readonly></td>
</tr>
<tr>
	<th>이메일 인증 여부</th>
	<td><input type="text" name="auth_status" value="${ user.auth_status }" readonly></td>
</tr>
<tr>
	<th colspan="2">
		<a href="javascript:history.go(-1);">이전 페이지로 이동</a> &nbsp; 
		<input type="submit" value="수정하기"> &nbsp; 
		<input type="reset" value="수정취소"> &nbsp; 		
		<a href="main.do">시작 페이지로</a> &nbsp;
		
		<c:url var="mdelete" value="mdel.do">
			<c:param name="userid" value="${ user.user_id }" />
		</c:url>
		<a href="${ udelete }">탈퇴하기</a>
	</th>	
</tr>
</table>
</form>
<hr>
<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>