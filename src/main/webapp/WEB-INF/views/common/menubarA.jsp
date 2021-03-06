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
	//????????? ???????????? ??????
	function movePage() {
		location.href = "loginPage.do";
	}
	
	//?????? ?????? ???????????? ??????
	function movePage2() {
		location.href = "enrollPage.do";
	}
	
	//????????? ???????????? ??????
	function movePage3(){
		location.href = "findaccount.do";
	}
	
	//???????????? ?????? ??????
	function checkAlert(button){
		user_id = button.id.substring(4);
		console.log(user_id);
		
		var answer = confirm(" ?????? ????????????????????????? \n ?????? ??? ??????????????? 1??? ??? ????????????, ????????? ????????? ???????????????.");
		
		if(answer == true){
			alert(" ?????? ???????????????. \n ???????????? ???????????? ?????????????????? ???????????????. :D");
			location.href = "${ pageContext.servletContext.contextPath }/udelete.do?user_id=" + user_id;
		}
	}
</script>
</head>
<body>
			<!-- ????????? ???????????? ?????? ?????? ?????? -->
			<c:if test="${ empty loginUser }">
			</c:if>

			<!-- ???????????? ???????????? ??? ????????? ?????? (??????????????? ??? ?????? ?????? ?????? ??????)//?????? ?????? -->
			<c:if test="${ !empty sessionScope.loginUser and loginUser.admin_yn eq 'Y' }">
        <ul class="nav justify-content-end">
         <li class="nav-item" ><a class="nav-link scrollto" aria-current="page" href="${ pageContext.servletContext.contextPath }/myinfo.do?user_id=${loginUser.user_id}">??? ?????? ??????</a></li>
          <li class="nav-item" ><a class="nav-link scrollto" aria-current="page" href="${ pageContext.servletContext.contextPath }/ulist.do">?????? ??????</a></li>
          <li class="nav-item" ><a class="nav-link scrollto" aria-current="page" href="${ pageContext.servletContext.contextPath }/rplista.do?page=1">?????? ?????? ?????? ??????</a></li>
          <li class="nav-item" ><a class="nav-link scrollto" aria-current="page" href="${ pageContext.servletContext.contextPath }/qlista.do?page=1">1:1 ?????? ??????</a></li>
          <li class="nav-item" ><a class="nav-link scrollto" aria-current="page" href="${ pageContext.servletContext.contextPath }/udlist.do">?????? ?????? ??????</a></li>
          <li><button type="button" id="uid_${ sessionScope.loginUser.user_id }" class="btn btn-light" onclick="checkAlert(this)" >
                       ?????? ??????</button></li>
                       <li class="nav-item" ><a class="nav-link scrollto" aria-current="page" href="#">??????</a></li>
                       <li class="nav-item" ><a class="nav-link scrollto" aria-current="page" href="#">??????</a></li>
                       <li class="nav-item" ><a class="nav-link scrollto" aria-current="page" href="#">??????</a></li>
          <!-- <li><a class="nav-link scrollto" href="${ pageContext.servletContext.contextPath }/qlist.do?page=1">?????? ????????? ??????</a></li> -->
		</ul>
			</c:if>
			<!-- ?????? ????????? ????????? ??? ?????? (??????????????? ??? ?????? ?????? ?????? ??????)-->
			<c:if test="${ !empty sessionScope.loginUser and loginUser.admin_yn eq 'N' }"> 
        <ul class="nav justify-content-end">
          <li class="nav-item" ><a class="nav-link scrollto" aria-current="page" href="${ pageContext.servletContext.contextPath }/myinfo.do?user_id=${loginUser.user_id}">??? ?????? ??????</a></li>
          <li class="nav-item" ><a class="nav-link scrollto" aria-current="page" href="${ pageContext.servletContext.contextPath }/rplistu.do?page=1">?????? ??????</a></li>
          <li class="nav-item" ><a class="nav-link scrollto" aria-current="page" href="${ pageContext.servletContext.contextPath }/qlistu.do?page=1">1:1 ?????? ??????</a></li>
          <li class="nav-item" ><button type="button" id="uid_${ sessionScope.loginUser.user_id }" class="btn btn-light" onclick="checkAlert(this)" >
                       ?????? ??????</button></li>
                       <li class="nav-item" ><a class="nav-link scrollto" aria-current="page" href="#">??????</a></li>
           <li class="nav-item" ><a class="nav-link scrollto" aria-current="page" href="#">??????</a></li>
           <li class="nav-item" ><a class="nav-link scrollto" aria-current="page" href="#">??????</a></li>
          <!-- <a class="nav-link scrollto" href="${ pageContext.servletContext.contextPath }/udelete.do?user_id=${sessionScope.loginUser.user_id}">?????? ??????</a> -->
          <!-- <li><a class="nav-link scrollto" href="${ pageContext.servletContext.contextPath }/qlist.do?page=1">?????? ????????? ??????</a></li> -->
		</ul>
			</c:if>
<br><br>



</body>
</html>