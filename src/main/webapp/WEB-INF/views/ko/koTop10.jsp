<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="list" value="${ param.list }" />
<c:set var="ktitle1" value="${ list.get(0).ko_title }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Whimory KO</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" 
	rel="stylesheet" 
	integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" 
	crossorigin="anonymous">

<style type="text/css">
.image-ktop {
	width:500px;
	height: 400px;
}

div div p a {
	text-decoration: none;
	background: #FFE4E1;
	color: white;
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
					values += "<div class='carousel-item active'>" + 
						"<img class='image-ktop' src='${ pageContext.servletContext.contextPath }/resources/ko_upfiles/"+ 
						json.list[i].ko_re_file + "'" +
						"class='d-block w-100' alt='...'>" +
						"<div class='carousel-caption d-none d-md-block'>" +
				        "<p><a href='kdetail.do?ko_no=" + json.list[i].ko_no +
				        "'><h5>" + decodeURIComponent(json.list[i].ko_title).replace(/\+/gi, " ") + "</h5>" +
				        "summary</a></p></div></div>"
				} else {
					values += "<div class='carousel-item'>" + 
					"<img class='image-ktop' src='${ pageContext.servletContext.contextPath }/resources/ko_upfiles/"+ 
					json.list[i].ko_re_file + "'" +
					"class='d-block w-100' alt='...'>" +
					"<div class='carousel-caption d-none d-md-block'>" +
			        "<p><a href='kdetail.do?ko_no=" + json.list[i].ko_no +
			        "'><h5>" + decodeURIComponent(json.list[i].ko_title).replace(/\+/gi, " ") + "</h5>" +
			        "summary</a></p></div></div>"
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

<div id="ktop" style="width: 500px; height: 600px">
	<div style="height: 40px;">
		<c:url var="klist" value="klist.do" />
		<a href="${ klist }">정보게시판 전체 목록 이동</a>
	</div>


	<div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" 
	    		aria-current="true" aria-label="Slide 1"></button>
		    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
		    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
		    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="3" aria-label="Slide 4"></button>
		    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="4" aria-label="Slide 5"></button>
		    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="5" aria-label="Slide 6"></button>
		    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="6" aria-label="Slide 7"></button>
		    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="7" aria-label="Slide 8"></button>
		    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="8" aria-label="Slide 9"></button>
		    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="9" aria-label="Slide 10"></button>
		    
		</div>
		<div class="carousel-inner">

		</div>
		<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span>
			<span class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
		    <span class="carousel-control-next-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Next</span>
		</button>
	</div>




</div>


</body>
</html>



