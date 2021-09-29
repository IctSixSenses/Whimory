<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Whimory</title>
<!-- Vendor CSS Files -->
<link href="assets/vendor/animate.css/animate.min.css" rel="stylesheet">
<link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
<link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
<link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
<link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
<link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

<!-- Template Main CSS File -->
<link href="assets/css/style.css" rel="stylesheet">

<!-- Bootstrap CSS -->
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Do+Hyeon|Jua|Nanum+Gothic|Sunflower:300" rel="stylesheet">

<style type="text/css">
html head{
	font-family: Roboto, Nanum Gothic;
}
html body{
	font-family: Roboto, Nanum Gothic;
} 
</style> 
</head>

<body>

   <div class="team container" id="team">
     <div class="section-title">
       <span>역사에서 배우는 삶의 지혜</span>
       <h2>역사에서 배우는 삶의 지혜</h2>
       <p>때로는 명언을 통해 고난과 역경을 헤쳐나가기도 한답디다:)</p>
     </div>

     <div class="row">
     	<div class='col-lg-4'>
     		<div class='member d-flex align-items-start'>
     			<div class='pic'>
     				<img src='${ pageContext.servletContext.contextPath }/resources/card_images/image01.jpg' class='img-fluid' alt='다산 정약용'>
     			</div>
     			<div class='member-info'>
     				<h4>다산 정약용</h4>
     				<p>겸손은 사람을 머물게 하고, 칭찬은 <br>사람을 가깝게 하고,넓음은 사람을 <br>따르게 하고, 깊음은 사람을 <br>감동케 한다.</p>
     				<div class='social'></div>
     			</div>
     		</div>
     	</div>
     	
     	<div class='col-lg-4'>
     		<div class='member d-flex align-items-start'>
     			<div class='pic'>
     				<img src='${ pageContext.servletContext.contextPath }/resources/card_images/image02.jpg' class='img-fluid' alt='도산 안창호'>
     			</div>
     			<div class='member-info'>
     				<h4>도산 안창호</h4>
     				<p>큰일이건 작은 일이건 네가 하는 일을 정성껏 하여라.</p>
     				<div class='social'></div>
     			</div>
     		</div>
     	</div>
     	
     	<div class='col-lg-4'>
     		<div class='member d-flex align-items-start'>
     			<div class='pic'>
     				<img src='${ pageContext.servletContext.contextPath }/resources/card_images/image03.jpg' class='img-fluid' alt='안중근 의사'>
     			</div>
     			<div class='member-info'>
     				<h4>안중근 의사</h4>
     				<p>세월을 헛되이 보내지 마라, 청춘은 다시 돌아오지 않는다.</p>
     				<div class='social'></div>
     			</div>
     		</div>
     	</div>
     </div>
   </div>

</body>
</html>