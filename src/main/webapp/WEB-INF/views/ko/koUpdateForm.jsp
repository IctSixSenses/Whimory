<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Whimory KO</title>
<!-- Favicons -->
<link href="${ pageContext.request.contextPath }/resources/images/tgmark.png" rel="icon">

<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" 
	rel="stylesheet" 
	integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" 
	crossorigin="anonymous">
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
.k-list {
	clear: left;
	position: relative;
	width: 1000px;
	left: 230px;
}
</style>
<script type="text/javascript">
function cancleCheck(){
	
	if(confirm("수정을 취소하시겠습니까?") == true){
		history.go(-1);
	} else {
		return false;
	}
	
}
</script>
</head>

<body>
<c:import url="/WEB-INF/views/common/menubar.jsp" />
<br>

<c:import url="/WEB-INF/views/ko/koSubMenubar.jsp" />

<div class="k-list">
<form action="kupdate.do" method="post" enctype="multipart/form-data" >
	<input type="hidden" name="ko_no" value="${ ko.ko_no }">
	<input type="hidden" name="ko_editor" value="${ loginUser.user_id }">
	<input type="hidden" name="ko_org_file" value="${ ko.ko_org_file }">
	<input type="hidden" name="ko_re_file" value="${ ko.ko_re_file }">
	
	<table class="table" style="table-layout: fixed; width:800px" align="center" cellspacing="0" cellpadding="3">
	<tr style="height:40px; border-bottom: 2px solid gray"><td colspan="9">
		<h5>Korea Origin ${ ko.ko_no }번 게시글 수정 페이지</h5>
	</td></tr>
	<tr height="50px">
		<td width="100px">
			<select name="ko_category">
				<c:set var="cate" value='${ ko.ko_category }' />
				<c:if test="${ cate == 'history' }">
					<option value="history" selected>역사</option>
					<option value="culture">문화</option>
					<option value="food">음식</option>
					<option value="culheri">문화재</option>
				</c:if>
				<c:if test="${ cate == 'culture' }">
					<option value="history">역사</option>
					<option value="culture" selected>문화</option>
					<option value="food">음식</option>
					<option value="culheri">문화재</option>
				</c:if>
				<c:if test="${ cate == 'food' }">
					<option value="history">역사</option>
					<option value="culture">문화</option>
					<option value="food" selected>음식</option>
					<option value="culheri">문화재</option>
				</c:if>
				<c:if test="${ cate == 'culheri' }">
					<option value="history">역사</option>
					<option value="culture">문화</option>
					<option value="food">음식</option>
					<option value="culheri" selected>문화재</option>
				</c:if>
			</select>
		</td>
		<td colspan="8">
			<input type="text" name="ko_title" size="83" required value="${ ko.ko_title }">
		</td>
	</tr>
	<tr>
		<td colspan="9"><textarea name="ko_content" cols="95" rows="20" required>${ ko.ko_content }</textarea></td>
	</tr>
	<tr>
		<td colspan="9"><textarea name="ko_summary" rows="2" cols="95" required>${ ko.ko_summary }</textarea></td>	
	</tr>
	<tr><td colspan="9">
		<c:if test="${ !empty ko.ko_org_file }">
			${ ko.ko_org_file } <br>
			변경: <input type="file" name="kfile">
		</c:if>
		<c:if test="${ empty ko.ko_org_file }">
			<input type="file" name="kfile">
		</c:if>
	</td></tr>
	<tr><td colspan="9">
		<input type="text" name="ko_hashtag" size="95" placeholder="해시태그" value="${ ko.ko_hashtag }">
	</td></tr>
	<tr><td colspan="9">
		<div style="height:40px;">
			<input type="text" name="ko_link1" size="95" placeholder="영상 링크1" value="${ ko.ko_link1 }">
		</div><div style="height:40px;">
			<input type="text" name="ko_link2" size="95" placeholder="영상 링크2" value="${ ko.ko_link2 }">
		</div><div style="height:40px;">
			<input type="text" name="ko_link3" size="95" placeholder="영상 링크3" value="${ ko.ko_link3 }">
		</div>
	</td></tr>
	<tr>
		<td colspan="9" align="center">
			<input class="btn btn-primary" type="submit" value="수정">
			<input class="btn btn-outline-danger" type="button" value="수정 취소" onclick="cancleCheck();">
		</td>
	</tr>
	</table>
</form>
</div>







<br><br><br>
<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>





