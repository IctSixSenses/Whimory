<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
.btnone{
 text-decoration:none;
 color: #01b1d7;
}
.dcn1 a{
	text-decoration:none;
}
.dcn2 a{
	text-decoration:none;
}
</style>
<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.0.min.js"></script>

</head>
<body>

  <footer id="footer">
    <div class="footer-top">
      <div class="container">
        <div class="row">

          <div class="col-lg-3 col-md-6">
            <div class="footer-info">
              <h3>휘모리 | Whimory</h3>
              <p>
                서울시 마포구 양화로 127, 첨단빌딩 7층 <br>
                Seoul, KOREA<br><br>
                <strong>대표자:</strong> 나서연<br>
                <strong>Phone:</strong> +82 02 1234 5678<br>
                <strong>Email:</strong> 0308tjdus@gmail.com<br>
              </p>
              <div class="social-links mt-3">
                <a href="#" class="twitter"><i class="bx bxl-twitter"></i></a>
                <a href="#" class="facebook"><i class="bx bxl-facebook"></i></a>
                <a href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
                <a href="#" class="google-plus"><i class="bx bxl-skype"></i></a>
                <a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
              </div>
            </div>
          </div>

          <div class="col-lg-2 col-md-6 footer-links">
            <h4>Useful Links</h4>
            <ul class="dcn1">
              <li><i class="bx bx-chevron-right"></i> <a href="main.do">Home</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="${ pageContext.servletContext.contextPath }/klist.do">정보 게시판</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="${ pageContext.servletContext.contextPath }/nlist.do">공지사항</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="${ pageContext.servletContext.contextPath }/wlist.do">언론보도</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="${ pageContext.servletContext.contextPath }/rplist.do?page=1">역사 왜곡 제보하기</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="${ pageContext.servletContext.contextPath }/flist.do?page=1">자유 토론 공간</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="${ pageContext.servletContext.contextPath }/qlist.do?page=1">QNA</a></li>
            </ul>
          </div>

          <div class="col-lg-3 col-md-6 footer-links">
            <h4>Our Services</h4>
            <ul class="dcn2">
              <li><i class="bx bx-chevron-right"></i> <a href="main.do">Home</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="${ pageContext.servletContext.contextPath }/klist.do">Korea Origin</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="${ pageContext.servletContext.contextPath }/nlist.do">Notice</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="${ pageContext.servletContext.contextPath }/wlist.do">Media News</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="${ pageContext.servletContext.contextPath }/rplist.do?page=1">Report Historical Distortion</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="${ pageContext.servletContext.contextPath }/flist.do?page=1">Open-Ended Discussion</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="${ pageContext.servletContext.contextPath }/qlist.do?page=1">Q&A</a></li>
            </ul>
          </div>

          <div class="col-lg-4 col-md-6 footer-newsletter">
            <h4>Our Information</h4>
            <p>휘모리가 더 알고 싶으시다면, 메일로 정보를 받아보세요!</p>
            <form action="" method="post">
              <input type="email" name="email"><input type="submit" value="Subscribe">
            </form>

          </div>

        </div>
      </div>
    </div>

    <div class="container">
      <div class="copyright">
        © Copyright <strong><span>SixSenses Corp</span></strong>. All Rights Reserved
      </div>
      <div class="credits">
        Designed by <a href="https://bootstrapmade.com/" class="btnone">BootstrapMade</a>
      </div>
    </div>
  </footer><!-- End Footer -->

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

<!-- Vendor JS Files -->
<script src="${ pageContext.request.contextPath }/resources/plugins/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="${ pageContext.request.contextPath }/resources/plugins/assets/vendor/glightbox/js/glightbox.min.js"></script>
<script src="${ pageContext.request.contextPath }/resources/plugins/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
<script src="${ pageContext.request.contextPath }/resources/plugins/assets/vendor/php-email-form/validate.js"></script>
<script src="${ pageContext.request.contextPath }/resources/plugins/assets/vendor/purecounter/purecounter.js"></script>
<script src="${ pageContext.request.contextPath }/resources/plugins/assets/vendor/swiper/swiper-bundle.min.js"></script>

<!-- Template Main JS File -->
<script src="${ pageContext.request.contextPath }/resources/plugins/assets/js/main.js"></script>

</body>
</html>