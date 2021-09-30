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
<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	
	$("input[name=item]").on("change", function(){
	
		$("input[name=item]").each(function(index){
			if($(this).is(":checked")){  
				$("form.sform").eq(index).css("display", "block");
			}else{
				$("form.sform").eq(index).css("display", "none");
			}
		});
	});
});
</script>
</head>
<body>
<c:import url="/WEB-INF/views/common/menubar.jsp" />
<br><br><br><br><br><br><br><br><br>

	<!-- 
	<fieldset id="ss">
<legend>검색할 항목을 선택하세요.</legend>
<input type="radio" name="item" id="uid"> 회원 아이디 &nbsp; 
<input type="radio" name="item" id="upwd"> 성별 &nbsp; 
</fieldset>
-->
	
	<h2 align="center" style="font-family:Nanum Gothic; font-weight:630; color:#333333;">휘모리(Whimory) 계정 찾기</h2>
	<br>

	<!-- 아이디 찾기 -->
	<br>
	<div id="idform" class="sform" align="center">
		<h3 align="center" style="font-family:Nanum Gothic; font-weight:630; color:#333333;">아이디 찾기</h3>
		<br>
		<form action="findid.do" method="post" accept-charset="utf-8">
			<label>이름 : <input type="text" name="user_name" placeholder="이름을 입력해주세요."></label><br>
			<br> <label>이메일 : <input type="text" name="email" placeholder="xxx@whimory.com"></label><br>
			<br> <input class="btn btn-outline-primary" type="submit"
				value="아이디 찾기"> <br>
			<br>
		</form>
	</div>

	<hr>
	<!-- 비밀번호 변경하기 -->
	<br>
	<div id="pwdform" class="sform" align="center">
		<h3 align="center" style="font-family:Nanum Gothic; font-weight:630; color:#333333;">비밀번호 찾기</h3>
		<br>
		<form action="findpwd.do" method="post"  accept-charset="utf-8">
			<label>아이디 : <input type="text" name="user_id" placeholder="아이디를 입력해주세요."></label><br>
			<br> <label>이메일 : <input type="text" name="email" placeholder="xxx@whimory.com"></label><br>
			<br> <input class="btn btn-outline-primary" type="submit"
				value="비밀번호 찾기"> <br>
			<br>
		</form>
	</div>
<br><br><br><br>
<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>