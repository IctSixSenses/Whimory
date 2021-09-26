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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" 
	rel="stylesheet" 
	integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" 
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

<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.0.min.js"></script>

<style type="text/css">
html head{
	font-family: Roboto, Nanum Gothic;
}
html body{
	font-family: Roboto, Nanum Gothic;
}
.hero-container{
    width: 750px;
    align: center;
  }
.icn1, .icn2, .icn3{
	color: #01b1d7;
	width: 25px;
	height: 25px;
}
.wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
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
</style>

<!--js-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" 
		integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" 
		crossorigin="anonymous">
</script>

<!--separate-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.min.js" 
		integrity="sha384-skAcpIdS7UcVUC05LJ9Dxay8AXcDYfBJqt1CJ85S/CFujBsIzCIv+l9liuYLaMQ/" 
		crossorigin="anonymous">
</script>


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
				}else if(i == 2) {
					values += "<div class='carousel-item'"
						+ "style='background-image: url(${ pageContext.request.contextPath }/resources/main_images/koimage_02.jpg);'>" 
						+ "<div class='carousel-container'><div class='carousel-content'>"
				        + "<h2 class='animate__animated animate__fadeInDown'>"
				        + decodeURIComponent(json.list[i].ko_title).replace(/\+/gi, " ")
				        + "</h2><p class='animate__animated animate__fadeInUp'>"
				        + decodeURIComponent(json.list[i].ko_summary).replace(/\+/gi, " ")
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
				        + decodeURIComponetn(json.list[i].ko_summary).replace(/\+/gi, " ") 
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
				} else if(i == 7) {
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
						+ "style='background-image: url(${ pageContext.request.contextPath }/resources/ko_upfiles/" + json.list[i].re_re_file + ");'>"
						+ "<div class='carousel-container'><div class='carousel-content'>"
				        + "<h2 class='animate__animated animate__fadeInDown'>"
				        + decodeURIComponent(json.list[i].ko_title).replace(/\+/gi, " ")
				        + "</h2><p class='animate__animated animate__fadeInUp'>"
				        + decodeURIComponent(json.list[i].ko_summary).replace(/\+/gi, " ")
				        + "</p><a href='kdetail.do?ko_no=" + json.list[i].ko_no 
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
}); //정보게시판 ajax 종료


</script>
</head>
<body>
	<header> 
	<c:import url="/WEB-INF/views/common/menubar.jsp" />
	
	
	</header>

  <!-- ======= 정보게시판 top10 시작 =======  -->
	<div align="center">
		<section id="hero" style="width:850px; height:520px">
			<div class="hero-container" style="width:850px; height:520px">
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
	</div>
  <!-- ======= 정보게시판 top10 종료 =======  -->
  
  
  
  
  
  
  
  
  
  
    <!-- ======= 언론보도 newTop5 시작 =======  -->
	<div class="page-head-blog">
	
              <div class="single-blog-page">
                <!-- recent start -->
                <div class="left-blog">
                  <h4>recent post</h4>
                  <div class="recent-post">
                    <!-- start single post -->
                    <div class="recent-single-post">
                      <div class="post-img">
                        <a href="#">
                          <img src="assets/img/blog/1.jpg" alt="">
                        </a>
                      </div>
                      <div class="pst-content">
                        <p><a href="#"> Redug Lerse dolor sit amet consect adipis elit.</a></p>
                      </div>
                    </div>
                    <!-- End single post -->
                    <!-- start single post -->
                    <div class="recent-single-post">
                      <div class="post-img">
                        <a href="#">
                          <img src="assets/img/blog/2.jpg" alt="">
                        </a>
                      </div>
                      <div class="pst-content">
                        <p><a href="#"> Redug Lerse dolor sit amet consect adipis elit.</a></p>
                      </div>
                    </div>
                    <!-- End single post -->
                    <!-- start single post -->
                    <div class="recent-single-post">
                      <div class="post-img">
                        <a href="#">
                          <img src="assets/img/blog/3.jpg" alt="">
                        </a>
                      </div>
                      <div class="pst-content">
                        <p><a href="#"> Redug Lerse dolor sit amet consect adipis elit.</a></p>
                      </div>
                    </div>
                    <!-- End single post -->
                    <!-- start single post -->
                    <div class="recent-single-post">
                      <div class="post-img">
                        <a href="#">
                          <img src="assets/img/blog/4.jpg" alt="">
                        </a>
                      </div>
                      <div class="pst-content">
                        <p><a href="#"> Redug Lerse dolor sit amet consect adipis elit.</a></p>
                      </div>
                    </div>
                    <!-- End single post -->
                  </div>
                </div>
                <!-- recent end -->
              </div>
              
            </div>
  <!-- ======= 언론보도 newTop5 종료 =======  -->
  
  
  
  
  
  
  
  
  
  
  
  
  
  
	

	<!-- 은별: 언론보도 newTop3 부분 -->
	<section>
		<c:import url="/WEB-INF/views/news/news3.jsp" />
	</section>


<br><br><br><br><br><br><br><br><br><br><br><br>


<!-- 언론보도 NewTop5 -->



<!-- 구글 캘린더 -->



<!-- 명언카드 -->



<!-- 영화추천 작업 -->


 <main id="main"><!-- Start #main -->


<!-- ======= 팀원 소감 및 한마디 Section ======= -->
    <section id="testimonials" class="testimonials">
      <div class="container position-relative">

        <div class="testimonials-slider swiper" data-aos="fade-up" data-aos-delay="100">
          <div class="swiper-wrapper">

            <div class="swiper-slide">
              <div class="testimonial-item">
                <img src="${ pageContext.request.contextPath }/resources/plugins/assets/img/testimonials/testimonials-1.jpg" class="testimonial-img" alt="">
                <h3>Seoyoen Na</h3>
                <h4>Team Leader</h4>
                <p>
                  <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                  Proin iaculis purus consequat sem cure digni ssim donec porttitora entum suscipit rhoncus. Accusantium quam, ultricies eget id, aliquam eget nibh et. Maecen aliquam, risus at semper.
                  <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                </p>
              </div>
            </div><!-- 서연 -->

            <div class="swiper-slide">
              <div class="testimonial-item">
                <img src="${ pageContext.request.contextPath }/resources/plugins/assets/img/testimonials/testimonials-2.jpg" class="testimonial-img" alt="">
                <h3>Daseul Kim</h3>
                <h4>Team Crew</h4>
                <p>
                  <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                  동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세 무궁화 삼천리 화려강산 대한사람 대한으로 길이 보전하세.
                  <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                </p>
              </div>
            </div><!-- 다슬 -->

            <div class="swiper-slide">
              <div class="testimonial-item">
                <img src="${ pageContext.request.contextPath }/resources/plugins/assets/img/testimonials/testimonials-3.jpg" class="testimonial-img" alt="">
                <h3>Eunbyeol Kim</h3>
                <h4>Team Crew</h4>
                <p>
                  <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                  은별이가 랩을 한다 홍홍홍. 형돈이도 랩을 한다 홍홍홍
                  <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                </p>
              </div>
            </div><!-- 은별 -->

            <div class="swiper-slide">
              <div class="testimonial-item">
                <img src="${ pageContext.request.contextPath }/resources/plugins/assets/img/testimonials/testimonials-4.jpg" class="testimonial-img" alt="">
                <h3>Hyunju Park</h3>
                <h4>Team Crew</h4>
                <p>
                  <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                  아리랑 아리랑 아라리요 아리랑 고개로~홍 넘~어간다.
                  <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                </p>
              </div>
            </div><!-- 현주 -->

            <div class="swiper-slide">
              <div class="testimonial-item">
                <img src="${ pageContext.request.contextPath }/resources/plugins/assets/img/testimonials/testimonials-5.jpg" class="testimonial-img" alt="">
                <h3>Seongin Choi</h3>
                <h4>Team Crew</h4>
                <p>
                  <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                  눼....
                  <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                </p>
              </div>
            </div><!-- 성인 -->

          </div>
          <div class="swiper-pagination"></div>
        </div>

      </div>
    </section>
<!-- ======= 팀원 소감 및 한마디 Section 종료 ======= -->




<!-- ======= 서연 Contact 및 Kakao Map API 시작 ======= -->
<section id="contact" class="contact">
	 <div class="contact-inner area-padding">
        <div class="contact-overly"></div>
        <div class="container">
          <div class="container">
	        <div class="section-title">
	          <span>Contact</span>
	          <h2>Contact</h2>
	          <p>대한민국의 왜곡된 역사 및 정보 제보는 메일을 통해서도 하실 수 있습니다.</p>
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
                    <span>월-금 (09:00-17:00)</span>
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
                    서울시 마포구 양화로 127, 첨단빌딩 7층<br>
                    <span>Seoul, KOREA</span>
                  </p>
                </div>
                
              </div>
            </div>
          </div>
          <div class="row">

            <!-- Start Kakao Map -->
            <div class="col-md-6">
            	<div id="map" style="width:100%;height:380px; margin:auto; margin-top:10px;"></div>
    			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d8120677b0a538dacf6e008c5b150910"></script>
            	<script>
					var mapContainer = document.getElementById('map'), // 지도의 중심좌표(지도를 담을 영역의 DOM 레퍼런스)
				    mapOption = { //지도를 생성할 때 필요한 기본 옵션
				        center: new kakao.maps.LatLng(37.55501701165485, 126.92054269768846), // 지도의 중심좌표
				        level: 3 // 지도의 확대 레벨(확대, 축소 정도)
				    }; 

					var map = new kakao.maps.Map(mapContainer, mapOption); // 지도 생성 및 객체 리턴
	
					// 지도에 마커 표시
					var marker = new kakao.maps.Marker({
					    map: map, 
					    position: new kakao.maps.LatLng(37.55501701165485, 126.92054269768846)
					});
	
					// 커스텀 오버레이에 표시할 컨텐츠 
					var content = '<div class="wrap">' + 
					            '    <div class="info">' + 
					            '        <div class="title">' + 
					            '            휘모리(Whimory)' + 
					            '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
					            '        </div>' + 
					            '        <div class="body">' + 
					            '            <div class="img">' +
					            '                <img src="${ pageContext.request.contextPath }/resources/images/logo03.png" width="73" height="70">' +
					            '           </div>' + 
					            '            <div class="desc">' + 
					            '                <div class="ellipsis">서울시 마포구 양화로 127, </div>' + 
					            '                <div class="ellipsis">첨단빌딩 7층</div>' + 
					            '                <div class="jibun ellipsis"> Tel.+82 02 1234 5678 </div>' +  
					            '            </div>' + 
					            '        </div>' + 
					            '    </div>' +    
					            '</div>';
	
					// 마커 위에 커스텀오버레이 표시 => 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용하여 위치 설정 
					var overlay = new kakao.maps.CustomOverlay({
					    content: content,
					    map: map,
					    position: marker.getPosition()       
					});
	
					// 마커를 클릭했을 때 커스텀 오버레이 표시
					kakao.maps.event.addListener(marker, 'click', function() {
					    overlay.setMap(map);
					});
					    
					// 맵을 클릭했을 때 커스텀 오버레이 닫기
					kakao.maps.event.addListener(map, 'click', function() {
					    overlay.setMap(null);
					});
				
				</script>
            </div>
            <!-- End Kakao Map -->

            <!-- Start  contact -->
            <div class="col-md-6">
              <div class="form contact-form">
                <form action="forms/contact.php" method="post" role="form" class="php-email-form">
                  <div class="form-group">
                    <input type="text" name="name" class="form-control" id="name" placeholder="본인 이름" required="">
                  </div>
                  <div class="form-group mt-3">
                    <input type="email" class="form-control" name="email" id="email" placeholder="본인 이메일" required="">
                  </div>
                  <div class="form-group mt-3">
                    <input type="text" class="form-control" name="subject" id="subject" placeholder="제목" required="">
                  </div>
                  <div class="form-group mt-3">
                    <textarea class="form-control" name="message" rows="4" placeholder="내용" required=""></textarea>
                  </div>
                  <div class="my-3">
                    <div class="loading">Loading</div>
                    <div class="error-message"></div>
                    <div class="sent-message">메일이 전송되었습니다. 감사합니다!</div>
                  </div>
                  <div class="text-center"><button type="submit">전송하기</button></div>
                </form>
              </div>
            </div>
            <!-- End Left contact -->
          </div>
        </div>
      </div>
    </section>

  </main><!-- End #main -->
<!-- ======= 서연 Contact 및 Kakao Map API 종료 ======= -->


<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>