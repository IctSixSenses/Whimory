<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Whimory</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
<script type="text/javascript" src="${ pageContext.request.contextPath }/resources/js/jquery-3.6.0.min.js"></script>

<!-- Bootstrap CSS -->
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Do+Hyeon|Jua|Nanum+Gothic|Sunflower:300" rel="stylesheet">
<style type="text/css">
html head{
	font-family: Roboto, Nanum Gothic;
}
html body{
	font-family: Roboto, Nanum Gothic;
} 
table tr td a { text-decoration:none } 
</style> 

</head>
<body>
<c:import url="../common/menubar.jsp" />


<br><br><br><br><br><br><br>

<table class="table" style="table-layout:fixed; width:850px;" align="center">
	<tr>
		<td colspan="10"><h2 align="center">${ news.news_title }</h2></td>
	</tr>
	<tr>
		<td colspan="10" align="right" style="font-size:15pt;">
			<c:if test="${ empty news.news_modify }">
				<fmt:formatDate value="${ news.news_date}" pattern="yyyy.MM.dd" />
			</c:if>
			<c:if test="${ !empty news.news_modify }">
				<fmt:formatDate value="${ news.news_modify }" pattern="yyyy.MM.dd" />
			</c:if>
		</td>
	</tr>
	
	<c:if test="${ news.news_org_file != null }">
	<tr>
		<td colspan="10" align="center"><img src="${ pageContext.servletContext.contextPath }/resources/news_upfiles/${ news.news_re_file }" style="width:750px;height:550px"></td>
	</tr>
	</c:if>
	<c:if test="${ news.news_org_file == null }">
	</c:if>
	
	<tr>
		<td colspan="10">${ news.news_content }</td>
	</tr> 
	<tr>
		<td colspan="10" align="left">보도일 &nbsp; ${ news.news_at_date }</td>
	</tr>
	<tr>
		<td colspan="10" align="left" style="font-size:10pt;">원본 출처 :  <a href="${ news.news_link }">${ news.news_link }</a></td>
	</tr>
		
	
	<tr><th colspan="10">
		<div width="850" align="center">
			
			<%-- 이전페이지로 이동 --%>
			<button onclick="javascript:history.go(-1);" class="btn btn-info">목록보기</button> &nbsp; 
			
		</div>
	
	

</table>





<hr>
<c:import url="../common/footer.jsp" />
</body>
</html>