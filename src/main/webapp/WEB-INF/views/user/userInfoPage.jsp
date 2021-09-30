<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Page</title>
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Do+Hyeon|Jua|Nanum+Gothic|Sunflower:300" rel="stylesheet">
<style type="text/css">
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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/css/bootstrap-select.min.css">
<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
</head>
<body>
<c:import url="/WEB-INF/views/common/menubar.jsp" />
<br><br><br><br><br><br><br>
<c:import url="/WEB-INF/views/common/menubarA.jsp"/>
<h2 align="center" style="font-family:Nanum Gothic; font-weight:630; color:#333333;">회원 정보 보기</h2>
<br>
<div align="center">
<table id="outer" align="center"cellspacing="5" cellpadding="0">

<tr height = "60">
	<th width="120" align="right" class="table-light">이 름</th>
	<td align="left">
	${ requestScope.user.user_name }</td>
</tr>
<tr height = "60">
	<th width="120" align="right"  class="table-light">아이디</th>
	<td align="left">${ requestScope.user.user_id }</td>
</tr>
<tr height = "60">
	<th align="right"  class="table-light">성 별</th>
	<td align="left">
	<c:if test="${ user.gender eq 'M' }">	
		 남자
	</c:if>
	<c:if test="${ user.gender eq 'F' }">	   
	  여자
	</c:if>
	</td>
</tr>
<tr height = "60">
	<th align="right"  class="table-light">생 일</th>
	<td align="left">
	${ requestScope.user.birth }</td>
</tr>
<tr height = "60">
	<th align="right"  class="table-light">전화번호</th>
	<td align="left">
	${ requestScope.user.phone }</td>
</tr>
<tr height = "60">
	<th align="right"  class="table-light">이메일</th>
	<td align="left">${ requestScope.user.email }</td>
</tr>
<tr>
<th>&nbsp;</th>
<td>&nbsp;</td>
</tr>
<tr>
<th>&nbsp;</th>
<td>&nbsp;</td>
</tr>
<tr align="center">
	<th colspan="2"> 	
		<button class="btn btn-outline-primary"
					onclick="javascript:history.go(-1);">회원 목록</button>
	</th>	
</tr>


</table>
</div>
<br><br>

<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>