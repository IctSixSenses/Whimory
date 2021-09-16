<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign up Whimory</title>
<script type="text/javascript">

//이메일 전송 인증번호 저장을 위한 코드
var code = "";

/*이메일로 인증번호 전송*/
$(".mail_check_button").click(function(){
	var email = $(".mail_input").val(); //입력된 이메일
	var checkBox = $(".mail_check_input"); //인증번호 입력란
	var boxWrap = $(".mail_check_input_box") //인증번호 입력란 박스
	
	$.ajax({
		type : "GET", //url로 값 전송
		url : "mailCheck?email=" + email,
		success : function(data){
			console.log("data: " + data);
			checkBox.attr("disabled", false);
			boxWrap.attr("id", "mail_check_input_box_true");
			code = data;
		}
	})
})
</script>
</head>
<body>
<c:import url="/WEB-INF/views/common/menubar.jsp" />
<!-- 회원가입폼 -->
<h1 align="center">휘모리(Whimory) 회원가입</h1>
<table>
<form method="post" action="uinsert.do">
<input type="hidden" name="origin_userpwd" value="${ requestScope.user.user_pwd }">
<table id="outer" align="center" width="500" cellspacing="5" cellpadding="0">
<tr>
	<th width="120">이 름</th>
	<td><input type="text" name="user_name" ></td>
</tr>
<tr>
	<th>아이디</th>
	<td><input type="text" name="user_id"></td>
</tr>
<tr>
	<th>암 호</th>
	<td><input type="password" name="user_pwd" id="userpwd" required></td>
</tr>
<tr>
	<th>암호확인</th>
	<td><input type="password" id="userpwd2" onblur="validate();" required></td>
</tr>
<tr>
	<th>성 별</th>
	<td><input type="radio" name="gender" value="M" checked> 남자 &nbsp; 
	    <input type="radio" name="gender" value="F"> 여자</td>
</tr>
<tr>
	<th>나 이</th>
	<td><input type="number" name="age" min="19" max="200"></td>
</tr>
<tr>
	<th>전화번호</th>
	<td><input type="tel" name="phone"></td>
</tr>
<tr>
	<th>이메일</th>
	<td><input type="email" class="mail_input" name="email" ></td>
	<td><input type="button" class="mail_check_button" value="인증하기"></td>
</tr>
<tr>
	<th>인증번호 입력</th>
	<td><input type="text" name="mailcheck" class = "mail_check_input_box"></td>
	<td><input type="button" value="확인"></td>
</tr>
<tr>
	<th colspan="2">
		<a href="javascript:history.go(-1);">이전 페이지로 이동</a> &nbsp; 
		<input type="submit" value="회원가입"> &nbsp; 
		<input type="reset" value="취소하기"> &nbsp; 		
		<a href="main.do">시작 페이지로</a> &nbsp;
		
		<c:url var="mdelete" value="mdel.do">
			<c:param name="userid" value="${ user.user_id }" />
		</c:url>
	</th>	
</tr>
</table>
</form>
<hr>
</table>
<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>