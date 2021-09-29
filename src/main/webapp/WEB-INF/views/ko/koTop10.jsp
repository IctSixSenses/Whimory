<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Whimory KO</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

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

<!-- 폰트 적용 -->
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Do+Hyeon|Jua|Nanum+Gothic|Sunflower:300" rel="stylesheet">

<style type="text/css">
html head{
	font-family: Roboto, Nanum Gothic;
}
html body{
	font-family: Roboto, Nanum Gothic;
}
.btn-get-started{
	text-decoration: none;
	font-family: Nanum Gothic;
}
</style>



<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
<script>
$(function(){
	   $.ajax({
	      url: "ktop10.do",
	      type: "post",
	      dataType: "json",
	      success: function(data){
	         console.log("success: " + data);
	         
	         // object --> string
	         var str = JSON.stringify(data);
	         
	         // string --> json
	         var json = JSON.parse(str);
	         
	         values = "";
	         for(var i in json.list){
	            
	            if(i == 0){
	               values += "<div class='carousel-item active'"
	                 	+ "style='background-image: url(${ pageContext.request.contextPath }/resources/ko_upfiles/" + json.list[i].ko_re_file + ");'>"
	                 	+ "<div class='carousel-container'><div class='carousel-content'>"
	                    + "<h2 class='animate__animated animate__fadeInDown'>"
	                    + decodeURIComponent(json.list[i].ko_title).replace(/\+/gi, " ")
	                    + "</h2><p class='animate__animated animate__fadeInUp'>"
	                    + decodeURIComponent(json.list[i].ko_summary).replace(/\+/gi, " ")
	                    + "</p><a href='kdetail.do?ko_no=" + json.list[i].ko_no 
	                    + "' class='btn-get-started scrollto animate__animated animate__fadeInUp'>더 알아보기</a></div></div></div>"
	            } else if(i == 1) {
	               values += "<div class='carousel-item'"
	                 	+ "style='background-image: url(${ pageContext.request.contextPath }/resources/main_images/koimage_14.jpg);'>" 
	                 	+ "<div class='carousel-container'><div class='carousel-content'>"
	                    + "<h2 class='animate__animated animate__fadeInDown'>"
	                    + decodeURIComponent(json.list[i].ko_title).replace(/\+/gi, " ")
	                    + "</h2><p class='animate__animated animate__fadeInUp'>"
	                    + decodeURIComponent(json.list[i].ko_summary).replace(/\+/gi, " ") 
	                    + "</p><a href='kdetail.do?ko_no=" + json.list[i].ko_no
	                    + "' class='btn-get-started scrollto animate__animated animate__fadeInUp'>더 알아보기</a></div></div></div>"
	            } else if(i == 2) {
	               values += "<div class='carousel-item'"
	                 	+ "style='background-image: url(${ pageContext.request.contextPath }/resources/main_images/koimage_02.jpg);'>" 
	                  	+ "<div class='carousel-container'><div class='carousel-content'>"
	                    + "<h2 class='animate__animated animate__fadeInDown'>"
	                    + decodeURIComponent(json.list[i].ko_title).replace(/\+/gi, " ")
	                    + "</h2><p class='animate__animated animate__fadeInUp'>"
	                    + decodeURIComponent(json.list[i].ko_summary).replace(/\+/gi, " ")
	                    + "</p><a href='kdetail.do?ko_no=" + json.list[i].ko_no
	                    + "' class='btn-get-started scrollto animate__animated animate__fadeInUp'>더 알아보기</a></div></div></div>"
	            } else if(i == 3) {
	               values += "<div class='carousel-item'"
	                 	+ "style='background-image: url(${ pageContext.request.contextPath }/resources/main_images/koimage_07.jpeg);'>" 
	                  	+ "<div class='carousel-container'><div class='carousel-content'>"
	                    + "<h2 class='animate__animated animate__fadeInDown'>"
	                    + decodeURIComponent(json.list[i].ko_title).replace(/\+/gi, " ")
	                    + "</h2><p class='animate__animated animate__fadeInUp'>"
	                    + decodeURIComponent(json.list[i].ko_summary).replace(/\+/gi, " ")
	                    + "</p><a href='kdetail.do?ko_no=" + json.list[i].ko_no
	                    + "' class='btn-get-started scrollto animate__animated animate__fadeInUp'>더 알아보기</a></div></div></div>"
	            } else if(i == 4) {
	               values += "<div class='carousel-item'"
	                 	+ "style='background-image: url(${ pageContext.request.contextPath }/resources/main_images/koimage_09.jpg);'>" 
	                  	+ "<div class='carousel-container'><div class='carousel-content'>"
	                    + "<h2 class='animate__animated animate__fadeInDown'>"
	                    + decodeURIComponent(json.list[i].ko_title).replace(/\+/gi, " ")
	                    + "</h2><p class='animate__animated animate__fadeInUp'>"
	                    + decodeURIComponent(json.list[i].ko_summary).replace(/\+/gi, " ") 
	                    + "</p><a href='kdetail.do?ko_no=" + json.list[i].ko_no
	                    + "' class='btn-get-started scrollto animate__animated animate__fadeInUp'>더 알아보기</a></div></div></div>"
	            } else if(i == 5) {
	               values += "<div class='carousel-item'"
	                	+ "style='background-image: url(${ pageContext.request.contextPath }/resources/main_images/koimage_17.jpg);'>" 
	                	+ "<div class='carousel-container'><div class='carousel-content'>"
	                    + "<h2 class='animate__animated animate__fadeInDown'>"
	                    + decodeURIComponent(json.list[i].ko_title).replace(/\+/gi, " ")
	                    + "</h2><p class='animate__animated animate__fadeInUp'>"
	                    + decodeURIComponent(json.list[i].ko_summary).replace(/\+/gi, " ") 
	                    + "</p><a href='kdetail.do?ko_no=" + json.list[i].ko_no
	                    + "' class='btn-get-started scrollto animate__animated animate__fadeInUp'>더 알아보기</a></div></div></div>"
	            }else if(i == 7) {
		           values += "<div class='carousel-item'"
			            + "style='background-image: url(${ pageContext.request.contextPath }/resources/main_images/koimage_05.jpg);'>" 
	                 	+ "<div class='carousel-container'><div class='carousel-content'>"
	                    + "<h2 class='animate__animated animate__fadeInDown'>"
	                    + decodeURIComponent(json.list[i].ko_title).replace(/\+/gi, " ")
	                    + "</h2><p class='animate__animated animate__fadeInUp'>"
	                    + decodeURIComponent(json.list[i].ko_summary).replace(/\+/gi, " ") 
	                    + "</p><a href='kdetail.do?ko_no=" + json.list[i].ko_no
	                    + "' class='btn-get-started scrollto animate__animated animate__fadeInUp'>더 알아보기</a></div></div></div>"
	            } else {
	               values += "<div class='carousel-item'" 
		                + "style='background-image: url(${ pageContext.request.contextPath }/resources/ko_upfiles/" + json.list[i].ko_re_file + ");'>"
		                + "<div class='carousel-container'><div class='carousel-content'>"
		                + "<h2 class='animate__animated animate__fadeInDown'>"
		                + decodeURIComponent(json.list[i].ko_title).replace(/\+/gi, " ")
		                + "</h2><p class='animate__animated animate__fadeInUp'>"
		                + decodeURIComponent(json.list[i].ko_summary).replace(/\+/gi, " ")
		                + "</p><a href='kdetail.do?ko_no=" + json.list[i].ko_no 
		                + "' class='btn-get-started scrollto animate__animated animate__fadeInUp'>더 알아보기</a></div></div></div>"
	           }
         }
         
         $(".carousel-inner").html($(".carousel-inner").html() + values);
         
      },
      error: function(jqXHR, textstatus, errorthrown){
         console.log("error: " + jqXHR + ", " + textstatus + ", " + errorthrown);
      }
   });
});
</script>
</head>
<body>
<section id="hero">
	<div class="hero-container" style="width:100%;">
		<div id="heroCarousel" data-bs-interval="3500" class="carousel slide carousel-fade" data-bs-ride="carousel">
			
			<ol class="carousel-indicators" id="hero-carousel-indicators">
				<li data-bs-target="#heroCarousel" data-bs-slide-to="0" class="active" aria-current="true"></li>
				<li data-bs-target="#heroCarousel" data-bs-slide-to="1"></li>
				<li data-bs-target="#heroCarousel" data-bs-slide-to="2"></li>
				<li data-bs-target="#heroCarousel" data-bs-slide-to="3"></li>
				<li data-bs-target="#heroCarousel" data-bs-slide-to="4"></li>
				<li data-bs-target="#heroCarousel" data-bs-slide-to="5"></li>
				<li data-bs-target="#heroCarousel" data-bs-slide-to="6"></li>
				<li data-bs-target="#heroCarousel" data-bs-slide-to="7"></li>
				<li data-bs-target="#heroCarousel" data-bs-slide-to="8"></li>
				<li data-bs-target="#heroCarousel" data-bs-slide-to="9"></li>
				
			</ol>
			
			<div class="carousel-inner" role="listbox">
				<!-- ajax 내용이 추가되는 곳 -->
			</div>
			
			<a class="carousel-control-prev" href="#heroCarousel" role="button" data-bs-slide="prev">
				<span class="carousel-control-prev-icon ri-arrow-left-line" aria-hidden="true"></span>
			</a>
			
			<a class="carousel-control-next" href="#heroCarousel" role="button" data-bs-slide="next">
				<span class="carousel-control-next-icon ri-arrow-right-line" aria-hidden="true"></span>
			</a>

		</div>
	</div>
</section>





</body>
</html>