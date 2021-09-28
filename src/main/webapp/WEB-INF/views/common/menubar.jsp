<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Whimory</title>

<!-- Favicons -->
<link href="${ pageContext.request.contextPath }/resources/images/tgmark.png" rel="icon">

<!-- Vendor CSS Files -->
<link href="${ pageContext.request.contextPath }/resources/plugins/assets/vendor/animate.css/animate.min.css" rel="stylesheet">
<link href="${ pageContext.request.contextPath }/resources/plugins/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="${ pageContext.request.contextPath }/resources/plugins/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
<link href="${ pageContext.request.contextPath }/resources/plugins/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
<link href="${ pageContext.request.contextPath }/resources/plugins/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
<link href="${ pageContext.request.contextPath }/resources/plugins/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
<link href="${ pageContext.request.contextPath }/resources/plugins/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

<!-- Template Main CSS File -->
<link href="${ pageContext.request.contextPath }/resources/plugins/assets/css/style.css" rel="stylesheet">

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
.maila{
	text-decoration: none;
}
.navbar li a {
	font-family: Roboto, Nanum Gothic;
	font-size: 13pt;
}
.kolo {
	text-decoration: none;
	font-size: 16pt;
	color: #404f52;
	background-color: white;
}
</style>

<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
</head>
<body>
    <!-- ======= Top Bar ======= -->
  <section id="topbar" class="fixed-top d-flex align-items-center">
    <div class="container d-flex justify-content-center justify-content-md-between">
      <div class="contact-info d-flex align-items-center">
        <img src="https://img.icons8.com/ios/50/000000/hand.png" width="20" height="20"/><span>&nbsp;본 사이트는 대한민국 정부와는 무관하며, 20대 청년들의 자발적인 의지로 개설되었습니다.</span></i>
      </div>
      <div class="social-links d-none d-md-flex">
        <a href="${ pageContext.servletContext.contextPath }/klist.do" class="kolo" title="정보게시판 바로가기"><b>KOREA ORIGIN</b>
        	<img src="${ pageContext.servletContext.contextPath }/resources/images/krflag.png" width="40" height="27" title="정보게시판 바로가기">
        	<font size="2rem" color="#212529">← 클릭시 정보게시판으로 이동</font></a>
      </div>
    </div>
  </section>
  
  <!-- ======= Header ======= -->
  <header id="header" class="fixed-top d-flex align-items-center" style="height:100px;">
    <div class="container d-flex align-items-center justify-content-between" style="height:50;">
    
      <div class="logo" >
        <a href="${ pageContext.servletContext.contextPath }/main.do"><img src="${ pageContext.request.contextPath }/resources/images/logo00.png" title="메인페이지로 이동" alt="휘모리" width="125" height="120"></a>
      </div>

	<nav id="navbar" class="navbar">
        <ul>
          <li><a class="nav-link scrollto active" href="main.do">Home</a></li>
          <li><a class="nav-link scrollto" href="${ pageContext.servletContext.contextPath }/nlist.do">공지사항</a></li>
          <li><a class="nav-link scrollto" href="${ pageContext.servletContext.contextPath }/wlist.do">언론보도</a></li>
          <li><a class="nav-link scrollto" href="${ pageContext.servletContext.contextPath }/rplist.do?page=1">역사 왜곡 제보하기</a></li>
          <li><a class="nav-link scrollto" href="${ pageContext.servletContext.contextPath }/flist.do?page=1">자유 토론 공간</a></li>
          <li><a class="nav-link scrollto" href="${ pageContext.servletContext.contextPath }/qlist.do?page=1">QNA</a></li>
		</ul>
    </nav><!-- .navbar -->

	<div id="loginform" align="right">
			<!-- 아무도 로그인이 되지 않은 경우 -->
			<c:if test="${ empty loginUser }">
				<button class="btn btn-outline-primary" onclick="javascript:location.href='loginPage.do';">로그인</button> &nbsp; &nbsp;
				<button class="btn btn-outline-primary" onclick="javascript:location.href='enrollPage.do';">회원가입</button> &nbsp; &nbsp;
				<button class="btn btn-outline-primary" onclick="javascript:location.href='findaccount.do';">아이디/비밀번호 찾기</button> &nbsp; &nbsp;
			</c:if>

			<!-- 관리자로 로그인이 된 상태인 경우 (마이페이지 및 메뉴 항목 수정 예정)//이름 출력 -->
			<c:if test="${ !empty sessionScope.loginUser and loginUser.admin_yn eq 'Y' }">
				${ sessionScope.loginUser.user_name } 님, 어서오세요! &nbsp; &nbsp;
					<button class="btn btn-outline-primary" onclick="javascript:location.href='logout.do';">로그아웃</button>  &nbsp; &nbsp;
					<button class="btn btn-outline-primary" onclick="javascript:location.href='ulist.do';">마스터페이지</button>
			</c:if>
			<!-- 일반 회원이 로그인 된 경우 (마이페이지 및 메뉴 항목 수정 예정) // 이름 출력 -->
			<c:if test="${ !empty sessionScope.loginUser and loginUser.admin_yn eq 'N' }">
				<c:url var= "callMyinfo" value="/myinfo.do">
					<c:param name="user_id" value="${loginUser.user_id}" />
				</c:url>
				${ sessionScope.loginUser.user_name } 회원님, 어서오세요! &nbsp; 
				<a href="${ callMyinfo }"><img src="${ pageContext.servletContext.contextPath }/resources/images/loginimg.png" title="마이페이지" width="40" height="40"></a>&nbsp;&nbsp;
				<button class="btn btn-outline-secondary" onclick="javascript:location.href='logout.do';">로그아웃</button> &nbsp; &nbsp; 
			</c:if>
		</div>
	
    </div>
  </header><!-- End Header -->
  


</body>
</html>