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
.fndiv{
	width:1280px;
	height:450px;
	position: relative; 
	left:130px;
}
</style>

<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
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
            
</head>
<body>
	<header> 
	<c:import url="/WEB-INF/views/common/menubar.jsp" />
	<br><br>
	</header>

  	<!-- ======= 정보게시판 top10 =======  -->
 	<c:import url="/WEB-INF/views/ko/koTop10.jsp" />
 

  	<!-- ======= 언론보도 최신게시글 Top3 & 자유토론공간 Top5 =======  -->
  	
	<br><br><br><br>
	<div class="fndiv">
 		<c:import url="/WEB-INF/views/news/news3.jsp" />
 		<div style="float:left; width:60px; height:400px" ></div>
 		<c:import url="/WEB-INF/views/free/freeTop5.jsp" />  
	</div>
	
	

	<!-- ======= 명언카드 ======= -->
    <c:import url="/WEB-INF/views/common/card.jsp" />
	<br><br><br><br><br>

	<table align="center" width="1000px" >	
  		<tr><td>
  			<h2 align="center" style="font-family:Nanum Gothic; font-weight:530; color:#01b1d7;;">역사를 잊은 민족에게 미래는 없다. - 단재 신채호</h2>
  			<div style="width:1000px; height:20px"></div>
  			<h3 align="center" style="font-family:Nanum Gothic; font-weight:530; color:#333333;">여러분, 대한민국의 역사를 함께 기억해주세요.</h3>
  		</td></tr>
  	</table><br>

  <!-- ======= 역사달력 ======= -->
 	<c:import url="/WEB-INF/views/common/calendar.jsp" />
	<br><br><br><br>



<main id="main"><!-- Start #main -->

<!-- ======= 팀원 소감 및 한마디 Section ======= -->
    <section id="testimonials" class="testimonials">
      <div class="container position-relative">

        <div class="testimonials-slider swiper" data-aos="fade-up" data-aos-delay="100">
          <div class="swiper-wrapper">

            <div class="swiper-slide">
              <div class="testimonial-item">
                <img src="${ pageContext.request.contextPath }/resources/main_images/SY.jpg" class="testimonial-img" alt="">
                <h3>나서연 (Seoyoen Na)</h3>
                <h4>Team Leader</h4>
                <p>
                  <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                  다들 잘 따라와주셔서 정말 감사합니다:) 다함께 성장한 것 같아서 신나요! 코딩뿌셔!! 
                  <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                </p>
              </div>
            </div><!-- 서연 -->

            <div class="swiper-slide">
              <div class="testimonial-item">
                <img src="${ pageContext.request.contextPath }/resources/main_images/DS.jpg" class="testimonial-img" alt="">
                <h3>김다슬 (Daseul Kim)</h3>
                <h4>Team Crew</h4>
                <p>
                  <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                  짧은 기간이지만 식스센스로 프로젝트를 진행할 수 있어서 너무 즐거웠습니다!
                  <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                </p>
              </div>
            </div><!-- 다슬 -->

            <div class="swiper-slide">
              <div class="testimonial-item">
                <img src="${ pageContext.request.contextPath }/resources/main_images/EB.jpg" class="testimonial-img" alt="">
                <h3>김은별 (Eunbyeol Kim)</h3>
                <h4>Team Crew</h4>
                <p>
                  <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                  피할 수 없으면 즐겨라, 코딩을 즐겨라!
                  <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                </p>
              </div>
            </div><!-- 은별 -->

            <div class="swiper-slide">
              <div class="testimonial-item">
                <img src="${ pageContext.request.contextPath }/resources/main_images/HJ.jpg" class="testimonial-img" alt="">
                <h3>박현주 (HyunJoo Park)</h3>
                <h4>Team Crew</h4>
                <p>
                  <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                  코드와 함께 하는 아름다운 밤★
                  <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                </p>
              </div>
            </div><!-- 현주 -->

            <div class="swiper-slide">
              <div class="testimonial-item">
                <img src="${ pageContext.request.contextPath }/resources/main_images/SI2.jpg" class="testimonial-img" alt="">
                <h3>최성인 (Seongin Choi)</h3>
                <h4>Team Crew</h4>
                <p>
                  <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                  포브스 선정 "가장 보람찬 6개월"
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
 <!-- Start 카카오맵 api -->
            <div class="col-md-6">
            	<div id="map" style="width:100%;height:380px; margin:auto; margin-top:10px;"></div>
    		</div>	
 <!-- End 카카오앱 api -->

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