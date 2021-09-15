<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="views/common/error.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Whimory</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.0.min.js"></script>

</head>
<body>
	<header> 
	<c:import url="/WEB-INF/views/common/menubar.jsp" />
	<hr style="clear: both;">
	
	<!-- 현주 추가 : 로그인하기 버튼 -->
	<c:import url="/WEB-INF/views/user/loginbutton.jsp" />
	
	<!-- 검색창 부분 -->
	<form class="d-flex" style="align:center">
		<input class="form-control me-2" type="search"
			placeholder="검색어를 입력하세요." aria-label="Search" style="width: 200px" >
		<button class="btn btn-outline-success" type="submit">Search</button>
	</form>
	
	</header>
	
	<section>
	<!-- 본격 메인 페이지 구성 -->
	
	
		<!-- 다슬: 정보 게시판 부분 -->
		<c:import url="/WEB-INF/views/ko/koTop10.jsp" />
	
	
	</section>
	

	<br><br><br><br><br><br><br><br><br><br><br><br>
	<hr style="clear: both;">
	<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>