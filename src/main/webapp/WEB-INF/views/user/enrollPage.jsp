<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
    <%request.setCharacterEncoding("UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign up Whimory</title>
<style>
html head{
	font-family: Roboto, Nanum Gothic;
}
html body{
	font-family: Roboto, Nanum Gothic;
} 
table tr td a, div a { 
	text-decoration:none;
	color: black; 
} 
</style>
<script type="text/javascript">

//이메일 전송 인증번호 저장을 위한 코드
//var code = "";

/*이메일로 인증번호 전송*/
 /*
 
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
*/
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
	
	//아이디 중복체크
	function dupIdCheck(){
		$.ajax({
			url: "idchk.do",
			type: "post",
			data: {user_id: $("#user_id").val()},
			success: function(data){
				console.log("success : " + data);
				if(data == "ok"){
					alert("사용 가능한 아이디입니다.");
					$("#user_pwd").focus();
				}else{
					alert("이미 사용중인 아이디입니다.\n다시 입력하세요.");
					$("#user_id").select();
				}
			},
			error: function(jqXHR, textstatus, errorthrown){
				console.log("error : " + jqXHR + ", " + textstatus
						+ ", " + errorthrown);
			}
		});
		
		return false;  //클릭 이벤트가 전달되어서 submit 이 동작되지 않게 함
	}
	
//입력하지 않았을 경우 alert 처리
	function checkform(){
		if(document.join.user_name.value==""){
			alert('이름을 입력하세요.');
			document.join.user_name.focus();
		}
		else if(document.join.user_id.value==""){
			alert('아이디를 입력하세요.');
			document.join.user_id.focus();
		}
		else if(document.join.user_pwd.value==""){
			alert('비밀번호를 입력하세요.');
			document.join.user_pwd.focus();
		}
		else if(document.join.userpwd2.value==""){
			alert('비밀번호 확인을 입력하세요.');
			document.join.userpwd2.focus();
		}
		else if(document.join.gender.value==""){
			alert('성별을 입력하세요.');
			document.join.gender.focus();
		}
		else if(document.join.birth.value==""){
			alert('생년월일을 입력하세요.');
			document.join.birth.focus();
		}
		else if(document.join.phone.value==""){
			alert('전화번호를 입력하세요.');
			document.join.phone.focus();
		}
		else if(document.join.email.value==""){
			alert('이메일을 입력하세요.');
			document.join.email.focus();
		}
		
		else{
			alert('회원가입이 완료되었습니다. 로그인 페이지로 이동합니다.');
			document.join.submit();	
		}
	}
	
</script>
</head>
<body>
<c:import url="/WEB-INF/views/common/menubar.jsp" />
<br><br><br><br><br><br><br>
<br><br>
<!-- 회원가입폼 -->
<h2 align="center" style="font-family:Nanum Gothic; font-weight:630; color:#333333;">휘모리(Whimory) 회원가입</h2>
<br>
<center>모든 정보를 작성해주셔야 회원 가입이 완료됩니다. :D </center>
<br><br>

<form method="post" name = "join" action="uinsert.do">
<input type="hidden" name="origin_userpwd" value="${ requestScope.user.user_pwd }">
<table id="outer" align="center" cellspacing="5" cellpadding="0">
<tr height = "60">
	<th width="120">이 름</th>
	<td><input type="text" name="user_name" id="user_name" required></td>
</tr>
<tr height = "60">
	<th>아이디</th>
	<td>
	<input type="text" name="user_id" id="user_id" placeholder = "8~15자로 입력해주세요.">
	
	<button class="btn btn-outline-success"
					onclick="dupIdCheck();">중복확인</button></td>
</tr>
<tr height = "60">
	<th>암 호</th>
	<td><input type="password" name="user_pwd" id="userpwd" placeholder="8~20자로 입력해주세요." required></td>
</tr>
<tr height = "60">
	<th>암호확인</th>
	<td><input type="password" id="userpwd2" onblur="validate();" required></td>
</tr>
<tr height = "60">
	<th>성 별</th>
	<td><input type="radio" name="gender" value="M" checked> 남자 &nbsp; 
	    <input type="radio" name="gender" value="F"> 여자</td>
</tr>
<tr height = "60">
	<th>생년월일</th>
	<td><input type="date" name="birth" id="birth" required></td>
</tr>
<tr height = "60">
	<th>전화번호</th>
	<td><input type="tel" name="phone" id="phone" placeholder=" '-' 빼고 입력해주세요." required></td>
</tr>
<tr height = "60">
	<th>이메일</th>
	<td><input type="email" class="mail_input" name="email" id="email" placeholder = "xxx@whimory.com" required></td>
	<!-- <td><input type="button" class="mail_check_button" value="인증하기"></td> -->
</tr>
<!--  <tr height = "60">
	<th>인증번호 입력</th>
	<td><input type="text" name="mailcheck" class = "mail_check_input_box"></td>
	<td><input type="button" value="확인"></td>
</tr> -->
<tr>
<th>&nbsp;</th>
<td>&nbsp;</td>
</tr>
<tr>
<th>&nbsp;</th>
<td>&nbsp;</td>
</tr>
<tr height = "60">
	<th colspan="2">
		<a href="javascript:history.go(-1);" style="weight:bolder; color:black; text-decoration:none;">이전 페이지</a> &nbsp;
		<button class="btn btn-danger"
					onclick="reset">취소하기</button> &nbsp;
		<button class="btn btn-primary"
					onclick="checkform();">회원가입</button>  	&nbsp;
		<a href="main.do" style="weight : bolder; color:black; text-decoration:none;">메인 페이지</a>
	</th>	
</tr>
</table>
</form>
<br><br><br><br>

<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>