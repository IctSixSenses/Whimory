<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="views/common/error.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
  
<title>Whimory</title>

<!-- Favicons -->
<link href="${ pageContext.request.contextPath }/resources/images/tgmark.png" rel="icon">
  
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

<!-- Google Font -->
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Do+Hyeon|Jua|Nanum+Gothic|Sunflower:300" rel="stylesheet">

<style type="text/css">
html head{
	font-family: Roboto, Nanum Gothic;
}
html body{
	font-family: Roboto, Nanum Gothic;
}
.icn1, .icn2, .icn3{
	color: #01b1d7;
	width: 25px;
	height: 25px;
}
.wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '??????', sans-serif;line-height: 1.5;}
.wrap * {padding: 0;margin: 0;}
.wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
.wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
.info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
.info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
.info .close:hover {cursor: pointer;}
.info .body {position: relative;overflow: hidden;}
.info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
.desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
.desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
.info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
.info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
.info .link {color: #5085BB;}

.btn-get-started{
	text-decoration: none;
	font-family: Nanum Gothic;
}
.fndiv{
	width:1280px;
	height:450px;
	position: relative; 
	left:130px;
}
</style>

<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
            
</head>
<body>
	<header> 
	<c:import url="/WEB-INF/views/common/menubar.jsp" />
	<br><br>
	</header>

  	<!-- ======= ??????????????? top10 =======  -->
 	<c:import url="/WEB-INF/views/ko/koTop10.jsp" />
 

  	<!-- ======= ???????????? ??????????????? Top3 & ?????????????????? Top5 =======  -->
  	
	<br><br><br><br>
	<div class="fndiv">
 		<c:import url="/WEB-INF/views/news/news3.jsp" />
 		<div style="float:left; width:60px; height:400px" ></div>
 		<c:import url="/WEB-INF/views/free/freeTop5.jsp" />  
	</div>
	

	<!-- ======= ???????????? ======= -->
    <c:import url="/WEB-INF/views/common/card.jsp" />
	<br><br><br><br><br>

	<table align="center" width="1000px" >	
  		<tr><td>
  			<h2 align="center" style="font-family:Nanum Gothic; font-weight:530; color:#01b1d7;;">????????? ?????? ???????????? ????????? ??????. - ?????? ?????????</h2>
  			<div style="width:1000px; height:20px"></div>
  			<h3 align="center" style="font-family:Nanum Gothic; font-weight:530; color:#333333;">?????????, ??????????????? ????????? ?????? ??????????????????.</h3>
  		</td></tr>
  	</table><br>

  <!-- ======= ???????????? ======= -->
 	<c:import url="/WEB-INF/views/common/calendar.jsp" />
	<br><br><br><br>


<main id="main"><!-- Start #main -->

<!-- ======= ?????? ?????? ??? ????????? Section ======= -->
    <section id="testimonials" class="testimonials">
      <div class="container position-relative">

        <div class="testimonials-slider swiper" data-aos="fade-up" data-aos-delay="100">
          <div class="swiper-wrapper">

            <div class="swiper-slide">
              <div class="testimonial-item">
                <img src="${ pageContext.request.contextPath }/resources/main_images/SY.jpg" class="testimonial-img" alt="">
                <h3>????????? (Seoyoen Na)</h3>
                <h4>Team Leader</h4>
                <p>
                  <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                  ?????? ??? ?????????????????? ?????? ???????????????:) ????????? ????????? ??? ????????? ?????????! ????????????!! 
                  <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                </p>
              </div>
            </div><!-- ?????? -->

            <div class="swiper-slide">
              <div class="testimonial-item">
                <img src="${ pageContext.request.contextPath }/resources/main_images/DS.jpg" class="testimonial-img" alt="">
                <h3>????????? (Daseul Kim)</h3>
                <h4>Team Crew</h4>
                <p>
                  <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                  ?????? ??????????????? ??????????????? ??????????????? ????????? ??? ????????? ?????? ??????????????????!
                  <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                </p>
              </div>
            </div><!-- ?????? -->

            <div class="swiper-slide">
              <div class="testimonial-item">
                <img src="${ pageContext.request.contextPath }/resources/main_images/EB.jpg" class="testimonial-img" alt="">
                <h3>????????? (Eunbyeol Kim)</h3>
                <h4>Team Crew</h4>
                <p>
                  <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                  ?????? ??? ????????? ?????????, ????????? ?????????!
                  <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                </p>
              </div>
            </div><!-- ?????? -->

            <div class="swiper-slide">
              <div class="testimonial-item">
                <img src="${ pageContext.request.contextPath }/resources/main_images/HJ.jpg" class="testimonial-img" alt="">
                <h3>????????? (HyunJoo Park)</h3>
                <h4>Team Crew</h4>
                <p>
                  <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                  ????????? ?????? ?????? ???????????? ??????
                  <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                </p>
              </div>
            </div><!-- ?????? -->

            <div class="swiper-slide">
              <div class="testimonial-item">
                <img src="${ pageContext.request.contextPath }/resources/main_images/SI2.jpg" class="testimonial-img" alt="">
                <h3>????????? (Seongin Choi)</h3>
                <h4>Team Crew</h4>
                <p>
                  <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                  ????????? ?????? "?????? ????????? 6??????"
                  <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                </p>
              </div>
            </div><!-- ?????? -->

          </div>
          <div class="swiper-pagination"></div>
        </div>

      </div>
    </section>
<!-- ======= ?????? ?????? ??? ????????? Section ?????? ======= -->


<!-- ======= ?????? Contact ??? Kakao Map API ?????? ======= -->
<section id="contact" class="contact">
	 <div class="contact-inner area-padding">
        <div class="contact-overly"></div>
        <div class="container">
          <div class="container">
	        <div class="section-title">
	          <span>Contact</span>
	          <h2>Contact</h2>
	          <p>??????????????? ????????? ?????? ??? ?????? ????????? ????????? ???????????? ?????? ??? ????????????.</p>
	        </div>
	      </div>
          
          <br>
          <div class="row">
            <!-- Start contact icon column -->
            <div class="col-md-4">
              <div class="contact-icon text-center">
                <div class="single-icon">
                  <i class="ri-phone-line icn1"></i>
                  <p>
                    +82 02 1234 5678<br>
                    <span>???-??? (09:00-17:00)</span>
                  </p>
                </div>
              </div>
            </div>
            
            <!-- Start contact icon column -->
            <div class="col-md-4">
              <div class="contact-icon text-center">
                <div class="single-icon">
                  <i class="bi bi-envelope icn2"></i>
                  <p>
                    Email: 0308tjdus@gmail.com<br>
                    <span>Web: www.whimory.com</span>
                  </p>
                </div>
              </div>
            </div>
            
            <!-- Start contact icon column -->
            <div class="col-md-4">
              <div class="contact-icon text-center">
                <div class="single-icon">
                  <i class="bi bi-geo-alt icn3"></i>
                  <p>
                    ????????? ????????? ????????? 127, ???????????? 7???<br>
                    <span>Seoul, KOREA</span>
                  </p>
                </div>
                
              </div>
            </div>
          </div>
          
          <div class="row">

			<!-- Start ???????????? api -->
            <div class="col-md-6">
            	<div id="map" style="width:100%;height:380px; margin:auto; margin-top:10px;"></div>
    			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d8120677b0a538dacf6e008c5b150910"></script>
            	<script>
					var mapContainer = document.getElementById('map'), // ????????? ????????????(????????? ?????? ????????? DOM ????????????)
				    mapOption = { //????????? ????????? ??? ????????? ?????? ??????
				        center: new kakao.maps.LatLng(37.55501701165485, 126.92054269768846), // ????????? ????????????
				        level: 3 // ????????? ?????? ??????(??????, ?????? ??????)
				    }; 

					var map = new kakao.maps.Map(mapContainer, mapOption); // ?????? ?????? ??? ?????? ??????
	
					// ????????? ?????? ??????
					var marker = new kakao.maps.Marker({
					    map: map, 
					    position: new kakao.maps.LatLng(37.55501701165485, 126.92054269768846)
					});
	
					// ????????? ??????????????? ????????? ????????? 
					var content = '<div class="wrap">' + 
					            '    <div class="info">' + 
					            '        <div class="title">' + 
					            '            ?????????(Whimory)' + 
					            '            <div class="close" onclick="closeOverlay()" title="??????"></div>' + 
					            '        </div>' + 
					            '        <div class="body">' + 
					            '            <div class="img">' +
					            '                <img src="${ pageContext.request.contextPath }/resources/images/logo03.png" width="73" height="70">' +
					            '           </div>' + 
					            '            <div class="desc">' + 
					            '                <div class="ellipsis">????????? ????????? ????????? 127, </div>' + 
					            '                <div class="ellipsis">???????????? 7???</div>' + 
					            '                <div class="jibun ellipsis"> Tel.+82 02 1234 5678 </div>' +  
					            '            </div>' + 
					            '        </div>' + 
					            '    </div>' +    
					            '</div>';
	
					// ?????? ?????? ????????????????????? ?????? => ????????? ???????????? ????????? ??????????????? ?????????????????? CSS??? ???????????? ?????? ?????? 
					var overlay = new kakao.maps.CustomOverlay({
					    content: content,
					    map: map,
					    position: marker.getPosition()       
					});
	
					// ????????? ???????????? ??? ????????? ???????????? ??????
					kakao.maps.event.addListener(marker, 'click', function() {
					    overlay.setMap(map);
					});
					    
					// ?????? ???????????? ??? ????????? ???????????? ??????
					kakao.maps.event.addListener(map, 'click', function() {
					    overlay.setMap(null);
					});
				
				</script>
            </div>
 			<!-- End ???????????? api -->

            <!-- Start  contact -->
            <div class="col-md-6">
              <div class="form contact-form">
                <form action="forms/contact.php" method="post" role="form" class="php-email-form">
                  <div class="form-group">
                    <input type="text" name="name" class="form-control" id="name" placeholder="?????? ??????" required="">
                  </div>
                  <div class="form-group mt-3">
                    <input type="email" class="form-control" name="email" id="email" placeholder="?????? ?????????" required="">
                  </div>
                  <div class="form-group mt-3">
                    <input type="text" class="form-control" name="subject" id="subject" placeholder="??????" required="">
                  </div>
                  <div class="form-group mt-3">
                    <textarea class="form-control" name="message" rows="4" placeholder="??????" required=""></textarea>
                  </div>
                  <div class="my-3">
                    <div class="loading">Loading</div>
                    <div class="error-message"></div>
                    <div class="sent-message">????????? ?????????????????????. ???????????????!</div>
                  </div>
                  <div class="text-center"><button type="submit">????????????</button></div>
                </form>
              </div>
            </div>
            <!-- End Left contact -->
          </div>
        </div>
      </div>
    </section>

  </main><!-- End #main -->
<!-- ======= ?????? Contact ??? Kakao Map API ?????? ======= -->


<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>