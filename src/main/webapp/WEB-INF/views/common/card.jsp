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
       <p>때로는 명언을 통해 고난과 역경을 헤쳐나가기도 한답니다:)</p>
     </div>

     <div class="row">
     	<div class='col-lg-4'>
     		<div class='member d-flex align-items-start'>
     			<div class='pic'>
     				<img src='${ pageContext.servletContext.contextPath }/resources/card_images/image06.jpg' class='img-fluid' alt='도산 안창호'>
     			</div>
     			<div class='member-info'>
     				<h4>도산 안창호</h4>
     				<p><font size="3.8">큰일이건 작은 일이건 네가 하는 일을 정성껏 하여라.</font></p>
     				<div class='social'></div>
     			</div>
     		</div>
     	</div>
     	
     	<div class='col-lg-4'>
     		<div class='member d-flex align-items-start'>
     			<div class='pic'>
     				<img src='${ pageContext.servletContext.contextPath }/resources/card_images/image05.jpg' class='img-fluid' alt='신사임당'>
     			</div>
     			<div class='member-info'>
     				<h4>신사임당</h4>
     				<p><font size="3.8">기품을 지키되 사치하지 말고, 지성을 갖추되 자랑하지 말라.</font></p>
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
     				<p><font size="3.8">세월을 헛되이 보내지 마라, 청춘은 다시 돌아오지 않는다.</font></p>
     				<div class='social'></div>
     			</div>
     		</div>
     	</div>
     </div>
   </div>

</body>
</html>