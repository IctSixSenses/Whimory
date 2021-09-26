<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Whimory</title>

<!-- Favicons -->
<link href="${ pageContext.request.contextPath }/resources/images/tgmark.png" rel="icon">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<!-- Google Font -->
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Do+Hyeon|Jua|Nanum+Gothic|Sunflower:300" rel="stylesheet">

<style type="text/css">
html head{
	font-family: Roboto, Nanum Gothic;
}
html body{
	font-family: Roboto, Nanum Gothic;
}
.p1{
	font-size: 22pt;
	font-weight: bolder;
	color: #01b1d7;
}
</style>
</head>
<body>
<c:import url="/WEB-INF/views/common/menubar.jsp" />

<table align="center">
	<tr>
		<td><img src="${ pageContext.servletContext.contextPath }/resources/images/error_02.png" width="350" height="400"></td>
		<td width="30"></td>
		<td align="left" colspan="2">
			<p class="p1">현재 찾을 수 없는 페이지를 요청하셨습니다.</p><br>
			<font size="5"><b>Error 내용은 다음과 같습니다.</b></font><br> 
			<font size="4">&nbsp;&nbsp;&nbsp;- Type :
				<c:set var="e" value="<%= exception %>" />
					<c:if test="${ !empty e }"> 
					   JSP Error
					</c:if>
					<c:if test="${ empty e }">
						Servlet Error
					</c:if><br>
						 &nbsp;&nbsp;&nbsp;- Message : ${ message }</font><br><br>		 
			<font size="3.5">궁금한 점이 있으시면 언제든 QNA를 통해 문의바랍니다. 감사합니다.</font>
						 		   
		</td>
	</tr>
	<tr>
		<td align="center" colspan="4" height="100">
		<button class="btn btn-secondary" onclick="javascript:location.href='main.do';">메인페이지로 이동</button>
		</td>
	</tr>
</table>
<br>
<br>
<br>

<c:import url="footer.jsp" />
</body>
</html>