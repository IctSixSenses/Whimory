<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Whimory KO</title>	
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Do+Hyeon|Jua|Nanum+Gothic|Sunflower:300" rel="stylesheet">
<style type="text/css">

/* 폰트 적용 */
html head{
	font-family: Roboto, Nanum Gothic;
}
html body{
	font-family: Roboto, Nanum Gothic;
}

/* 본문 css */
#url1, #url2, #url3 {
	color: black;
	text-decoration: none;
}

.k-list {
	clear: left;
	position: relative;
	width: 1000px;
	left: 230px;
}

.ko_image {
	width: 400px;
	height: 300px;
	align: center;
}

.image-thumb {
	width: 230px;
	height: 170px;
	align: center;
}
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" 
	rel="stylesheet" 
	integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" 
	crossorigin="anonymous">

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" 
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" 
		crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" 
		integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" 
		crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" 
		integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" 
		crossorigin="anonymous"></script>
<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>;
<script type="text/javascript">
$(document).ready(function () {
	var url = '${ ko.ko_link1 }';
	var playkey = url.substring(url.lastIndexOf("=") + 1);
	
	$.get(
		"https://www.googleapis.com/youtube/v3/videos", {
			part: 'snippet',
			id: playkey,
			key: 'AIzaSyDjW3FfjY-Jm_oaIEJAd_yZZnXVwVEygG4'
		},

		function (data) {
			var output;
			$.each(data.items, function (i, item) {
				vTitle = item.snippet.title;
				vThumbnail = item.snippet.thumbnails.standard.url;
				output = '<img class="image-thumb" src ="' + vThumbnail + '"><br>' + vTitle;
				$("#url1").append(output);
			})
		}
	);
});

$(document).ready(function () {
	var url = '${ ko.ko_link2 }';
	var playkey = url.substring(url.lastIndexOf("=") + 1);
	
	$.get(
		"https://www.googleapis.com/youtube/v3/videos", {
			part: 'snippet',
			id: playkey,
			key: 'AIzaSyDjW3FfjY-Jm_oaIEJAd_yZZnXVwVEygG4'
		},

		function (data) {
			var output;
			$.each(data.items, function (i, item) {
				vTitle = item.snippet.title;
				vThumbnail = item.snippet.thumbnails.standard.url;
				output = '<img class="image-thumb" src ="' + vThumbnail + '"><br>' + vTitle;
				$("#url2").append(output);
			})
		}
	);
});

$(document).ready(function () {
	var url = '${ ko.ko_link3 }';
	var playkey = url.substring(url.lastIndexOf("=") + 1);
	
	$.get(
		"https://www.googleapis.com/youtube/v3/videos", {
			part: 'snippet',
			id: playkey,
			key: 'AIzaSyDjW3FfjY-Jm_oaIEJAd_yZZnXVwVEygG4'
		},

		function (data) {
			var output;
			$.each(data.items, function (i, item) {
				vTitle = item.snippet.title;
				vThumbnail = item.snippet.thumbnails.standard.url;
				output = '<img class="image-thumb" src ="' + vThumbnail + '"><br>' + vTitle;
				$("#url3").append(output);
			})
		}
	);
});
</script>
<script type="text/javascript">
function deleteCheck(){
	
	<c:url var="kdel" value="kdelete.do">
		<c:param name="kNo" value="${ ko.ko_no }" />
		<c:param name="rfile" value="${ ko.ko_re_file }" />
	</c:url>
	
	if(confirm("게시글을 삭제하시겠습니까?") == true){
		location.href="${ kdel }";
	} else {
		return false;
	}
	
}

</script>
</head>

<body>
<c:import url="/WEB-INF/views/common/menubar.jsp" />
<hr style="clear:both"><br>

<%-- 서브 메뉴바 --%>
<c:import url="/WEB-INF/views/ko/koSubMenubar.jsp" />

<%-- 게시글 상세보기 --%>
<div class="k-list">
	<table width="900px" align="center">
	<tr height="30px">
		<td colspan="2">
			<c:if test="${ ko.ko_category eq 'food' }">
				<font size="5">음식</font>
			</c:if>
			<c:if test="${ ko.ko_category eq 'history' }">
				<font size="5">역사</font>
			</c:if>
			<c:if test="${ ko.ko_category eq 'culture' }">
				<font size="5">문화</font>
			</c:if>
			<c:if test="${ ko.ko_category eq 'culheri' }">
				<font size="5">문화재</font>
			</c:if>
		</td>
		<td colspan="4" align="right">
			<c:if test="${ loginUser.admin_yn eq 'Y' }">
				<c:url var="kmu" value="kupview.do">
					<c:param name="ko_no" value="${ ko.ko_no }" />
				</c:url>
				<button class="btn btn-outline-success" 
						onclick="javascript:location.href='${kmu}'; return false;">수정</button>
				
				<button class="btn btn-outline-success" onclick="deleteCheck(); return false;">삭제</button>
				
				<c:url var="kwf" value="kwmove.do" />
				<button class="btn btn-success" 
						onclick="javascript:location.href='${kwf}'; return false;">글쓰기</button>
			</c:if>
		</td>
	</tr>
	<tr style="border-top: 0.5px solid Gainsboro; height:10px;"><td>&nbsp;</td></tr>
	<tr height="40px">
		<td colspan="4"><font size="6">${ ko.ko_title }</font> &nbsp;
			<c:if test="${ loginUser.admin_yn eq 'Y' }">
				<c:url var="ktts" value="ktts.do">
					<c:param name="ko_no" value="${ ko.ko_no }" />
				</c:url>
				<a href="javascript:location.href='${ktts}'">
					<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" 
						class="bi bi-headphones" viewBox="0 0 16 16">
					<path d="M8 3a5 5 0 0 0-5 5v1h1a1 1 0 0 1 1 1v3a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V8a6 6 0 1 1 12 0v5a1 1 0 0 1-1 1h-1a1 1 0 0 1-1-1v-3a1 1 0 0 1 1-1h1V8a5 5 0 0 0-5-5z"/>
					</svg>
				</a>
			</c:if>
		</td>
		<td colspan="2" align="right">
			<c:if test="${ ko.ko_modify eq null }">
				등록일:&nbsp;<fmt:formatDate value="${ ko.ko_date }" pattern="yyyy.MM.dd." />
				 &nbsp; 조회수 ${ ko.ko_readcount }	
			</c:if>
			<c:if test="${ ko.ko_modify ne null }">
				수정일:&nbsp;<fmt:formatDate value="${ ko.ko_modify }" pattern="yyyy.MM.dd." />
				 &nbsp; 조회수 ${ ko.ko_readcount }	
			</c:if>
		</td>
	</tr>
	<tr style="border-top: 0.5px solid Gainsboro; height:50px"><td>&nbsp;</td></tr>
	<tr><td colspan="4" align="center">
		<img class="ko_image"src="${ pageContext.servletContext.contextPath }/resources/ko_upfiles/${ ko.ko_re_file }">
	</td>
	<td colspan="2">
		<audio controls>
			<source src="${ pageContext.servletContext.contextPath }/resources/ko_mp3/${ ko.ko_no }.mp3" type="audio/mp3">
		</audio>
		
	</td>
	</tr>
	<tr height="30px"><td>&nbsp;</td></tr>
	<tr><td colspan="6">${ ko.ko_content }</td></tr>
	<tr height="50px"><td>&nbsp;</td></tr>
	<tr style="height: 30px; background: WhiteSmoke;">
		<td colspan="6">
			<c:forTokens items="${ ko.ko_hashtag }" delims="," var="hashtag">
				<c:out value="#${hashtag}" />
			</c:forTokens>
		</td>
	</tr>
	<tr height="50px"><td>&nbsp;</td></tr>
	<tr style="border-top: 0.5px solid Gainsboro; border-bottom: 0.5px solid Gainsboro; height: 200px">
		<c:if test="${ ko.ko_link1 ne null }">
			<td colspan="2" align="center">
				<a href="${ ko.ko_link1 }">
					<div id="url1"></div>
				</a>
			</td>
		</c:if>
		<c:if test="${ ko.ko_link2 ne null }">
			<td colspan="2" align="center">		
				<a href="${ ko.ko_link2 }">
					<div id="url2"></div>
				</a>
			</td>
		</c:if>
		<c:if test="${ ko.ko_link3 ne null }">
			<td colspan="2" align="center">
				<a href="${ ko.ko_link3 }">
					<div id="url3"></div>
				</a>
			</td>
		</c:if>
	</tr>
	<tr height="50px"><td colspan="6" align="center">
		<c:url var="klst" value="klist.do" />
		<button class="btn btn-outline-success" onclick="javascript:location.href='${ klst }'">전체 목록</button>
	</td></tr>
	</table>
</div>








<br><br><br><hr style="clear:both">
<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>



