<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>menubar for admin</title>

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


</style>

<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	//로그인 페이지로 이동
	function movePage() {
		location.href = "loginPage.do";
	}
	
	//회원 가입 페이지로 이동
	function movePage2() {
		location.href = "enrollPage.do";
	}
	
	//아이디 비밀번호 찾기
	function movePage3(){
		location.href = "findaccount.do";
	}
	
	//탈퇴하기 체크 알림
	function checkAlert(button){
		user_id = button.id.substring(4);
		console.log(user_id);
		
		var answer = confirm(" 정말 탈퇴하시겠습니까? \n 탈퇴 시 개인정보는 1년 간 보관되며, 이후에 완전히 삭제됩니다.");
		
		if(answer == true){
			alert(" 탈퇴 되었습니다. \n 지금까지 휘모리를 사랑해주셔서 감사합니다. :D");
			location.href = "${ pageContext.servletContext.contextPath }/udelete.do?user_id=" + user_id;
		}
	}
</script>
</head>
<body>
			<!-- 아무도 로그인이 되지 않은 경우 -->
			<c:if test="${ empty loginUser }">
			</c:if>

			<!-- 관리자로 로그인이 된 상태인 경우 (마이페이지 및 메뉴 항목 수정 예정)//이름 출력 -->
			<c:if test="${ !empty sessionScope.loginUser and loginUser.admin_yn eq 'Y' }">
        <ul class="nav justify-content-end">
         <li class="nav-item" ><a class="nav-link scrollto" aria-current="page" href="${ pageContext.servletContext.contextPath }/myinfo.do?user_id=${loginUser.user_id}">내 정보 수정</a></li>
          <li class="nav-item" ><a class="nav-link scrollto" aria-current="page" href="${ pageContext.servletContext.contextPath }/ulist.do">회원 관리</a></li>
          <li class="nav-item" ><a class="nav-link scrollto" aria-current="page" href="${ pageContext.servletContext.contextPath }/rplista.do?page=1">역사 왜곡 제보 내역</a></li>
          <li class="nav-item" ><a class="nav-link scrollto" aria-current="page" href="${ pageContext.servletContext.contextPath }/qlista.do?page=1">1:1 답변 내역</a></li>
          <li class="nav-item" ><a class="nav-link scrollto" aria-current="page" href="${ pageContext.servletContext.contextPath }/udlist.do">탈퇴 회원 관리</a></li>
          <li><button type="button" id="uid_${ sessionScope.loginUser.user_id }" class="btn btn-light" onclick="checkAlert(this)" >
                       회원 탈퇴</button></li>
                       <li class="nav-item" ><a class="nav-link scrollto" aria-current="page" href="#">　　</a></li>
                       <li class="nav-item" ><a class="nav-link scrollto" aria-current="page" href="#">　　</a></li>
                       <li class="nav-item" ><a class="nav-link scrollto" aria-current="page" href="#">　　</a></li>
          <!-- <li><a class="nav-link scrollto" href="${ pageContext.servletContext.contextPath }/qlist.do?page=1">검색 키워드 관리</a></li> -->
		</ul>
			</c:if>
			<!-- 일반 회원이 로그인 된 경우 (마이페이지 및 메뉴 항목 수정 예정)-->
			<c:if test="${ !empty sessionScope.loginUser and loginUser.admin_yn eq 'N' }"> 
        <ul class="nav justify-content-end">
          <li class="nav-item" ><a class="nav-link scrollto" aria-current="page" href="${ pageContext.servletContext.contextPath }/myinfo.do?user_id=${loginUser.user_id}">내 정보 수정</a></li>
          <li class="nav-item" ><a class="nav-link scrollto" aria-current="page" href="${ pageContext.servletContext.contextPath }/rplistu.do?page=1">제보 내역</a></li>
          <li class="nav-item" ><a class="nav-link scrollto" aria-current="page" href="${ pageContext.servletContext.contextPath }/qlistu.do?page=1">1:1 문의 내역</a></li>
          <li class="nav-item" ><button type="button" id="uid_${ sessionScope.loginUser.user_id }" class="btn btn-light" onclick="checkAlert(this)" >
                       회원 탈퇴</button></li>
                       <li class="nav-item" ><a class="nav-link scrollto" aria-current="page" href="#">　　</a></li>
           <li class="nav-item" ><a class="nav-link scrollto" aria-current="page" href="#">　　</a></li>
           <li class="nav-item" ><a class="nav-link scrollto" aria-current="page" href="#">　　</a></li>
          <!-- <a class="nav-link scrollto" href="${ pageContext.servletContext.contextPath }/udelete.do?user_id=${sessionScope.loginUser.user_id}">탈퇴 하기</a> -->
          <!-- <li><a class="nav-link scrollto" href="${ pageContext.servletContext.contextPath }/qlist.do?page=1">검색 키워드 관리</a></li> -->
		</ul>
			</c:if>
  
<br>
<br>
<br>
<br>
<br>
<br>
<br>



</body>
</html>