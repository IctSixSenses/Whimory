<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Whimory KO</title>	
<style type="text/css">
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
	width: 220px;
	height: 170px;
	align: center;
}
</style>
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
				<button onclick="kupview.do">수정</button>
				<button onclick="kdelete.do">삭제</button>
				<button onclick="kwmove.do">글쓰기</button>
			</c:if>
		</td>
	</tr>
	<tr style="border-top: 0.5px solid Gainsboro; height:10px;"><td>&nbsp;</td></tr>
	<tr height="40px">
		<td colspan="2"><font size="6">${ ko.ko_title }</font></td>
		<td colspan="4" align="right">
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
	<tr><td colspan="6" align="center">
		<img class="ko_image"src="${ pageContext.servletContext.contextPath }/resources/ko_upfiles/${ ko.ko_re_file }">
	</td></tr>
	<tr height="30px"><td>&nbsp;</td></tr>
	<tr><td colspan="6">${ ko.ko_content }</td></tr>
	<tr height="50px"><td>&nbsp;</td></tr>
	<tr style="height: 30px; background: WhiteSmoke;">
		<td colspan="6">${ ko.ko_hashtag }</td>
	</tr>
	<tr height="50px"><td>&nbsp;</td></tr>
	<tr style="border-top: 0.5px solid Gainsboro; border-bottom: 0.5px solid Gainsboro; height: 200px">
		<td colspan="2" align="center">
			<c:if test="${ ko.ko_link1 ne null }">
				<a href="${ ko.ko_link1 }">
					<img class="image-thumb" src="http://img.youtube.com/vi/${ ko.ko_image1 }/mqdefault.jpg">
				</a>
			</c:if>
			<c:if test="${ ko.ko_link1 eq null }">
				<a href="${ ko.ko_link1 }">
					<img class="image-thumb" src="${ pageContext.servletContext.contextPath }/resources/ko_upfiles/basic.jpg">
				</a>
			</c:if>
		</td>
		<td colspan="2" align="center">
			<c:if test="${ ko.ko_link2 ne null }">
				<a href="${ ko.ko_link2 }">
					<img class="image-thumb" src="http://img.youtube.com/vi/${ ko.ko_image2 }/mqdefault.jpg">
				</a>
			</c:if>
			<c:if test="${ ko.ko_link2 eq null }">
				<a href="#">
					<img class="image-thumb" src="${ pageContext.servletContext.contextPath }/resources/ko_upfiles/basic.jpg">
				</a>
			</c:if>
		</td>
		<td colspan="2" align="center">
			<c:if test="${ ko.ko_link3 ne null }">
				<a href="${ ko.ko_link3 }">
					<img class="image-thumb" src="http://img.youtube.com/vi/${ ko.ko_image3 }/mqdefault.jpg">
				</a>
			</c:if>
			<c:if test="${ ko.ko_link3 eq null }">
				<a href="#">
					<img class="image-thumb" src="${ pageContext.servletContext.contextPath }/resources/ko_upfiles/basic.jpg">
				</a>
			</c:if>
		</td>
	</tr>
	<tr height="50px"><td colspan="6" align="center">
		<c:url var="klst" value="javascript:history.go(-1)" />
		<button onclick="${ klst }">전체 목록</button>
	</td></tr>
	</table>
</div>








<br><br><br><hr style="clear:both">
<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>



