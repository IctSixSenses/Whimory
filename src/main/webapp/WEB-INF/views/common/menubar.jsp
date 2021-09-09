<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Whimory</title>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<style type="text/css">

ul#menubar a img#logo{
	width:50;
	height:50;
	align: center;
}
li#menu1 a, #menu2 a, #menu3 a, #menu4 a, #menu5 a{
	font-size: 13pt;
	font-family: Arial;
}

</style>
</head>
<body>
<br><br>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0" id="menubar">
     	<a class="navbar-brand" title="메인 페이지로 이동" href="#">
     		<img src="${ pageContext.servletContext.contextPath }/resources/images/logo01.png" width="120" height="40">
     	</a>&nbsp;&nbsp;
        <li class="nav-item" id="menu1"><a class="nav-link" href="#">공지사항</a></li>&nbsp;&nbsp;
		<li class="nav-item" id="menu2"><a class="nav-link" href="#">언론보도</a></li>&nbsp;&nbsp;
        <li class="nav-item" id="menu3"><a class="nav-link" href="#">역사 왜곡 제보하기</a></li>&nbsp;&nbsp;
        <li class="nav-item" id="menu4"><a class="nav-link" href="#">자유 토론 공간</a></li>&nbsp;&nbsp;
        <li class="nav-item" id="menu5"><a class="nav-link" href="${ pageContext.servletContext.contextPath }/qlist.do?page=1">Q&A</a></li>
      </ul>
    </div>

  </div>
</nav>





</body>
</html>