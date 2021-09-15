<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<hr style="clear:both;"><br>

<c:import url="/WEB-INF/views/ko/koSubMenubar.jsp" />

<div class="k-list">
<form action="kupdate.do" method="post" enctype="multipart/form-data" >
	<input type="hidden" name="ko_no" value="${ ko.ko_no }">
	<input type="hidden" name="ko_editor" value="${ loginUser.user_id }">
	<input type="hidden" name="ko_org_file" value="${ ko.ko_org_file }">
	<input type="hidden" name="ko_re_file" value="${ ko.ko_re_file }">
	
	<table width="800px" align="center">
	<tr style="height:40px; border-bottom: 2px solid gray"><td colspan="9">
		<h5>Korea Origin 글쓰기</h5>
	</td></tr>
	<tr height="40px">
		<td width="100px">
			<select name="ko_category">
				<option value="history">역사</option>
				<option value="culture">문화</option>
				<option value="food">음식</option>
				<option value="culheri">문화재</option>
			</select>
		</td>
		<td colspan="8">
			<input type="text" name="ko_title" size="83" required value="${ ko.ko_title }">
		</td>
	</tr>
	<tr>
		<td colspan="9"><textarea name="ko_content" cols="100" rows="20" required>${ ko.ko_content }</textarea></td>
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
		<input type="text" name="ko_hashtag" size="97" placeholder="해시태그" value="${ ko.ko_hashtag }">
	</td></tr>
	<tr><td colspan="9">
		<input type="text" name="ko_link1" size="97" placeholder="영상 링크1" value="${ ko.ko_link1 }">
	</td></tr>
	<tr><td colspan="9">
		<input type="text" name="ko_link2" size="97" placeholder="영상 링크2" value="${ ko.ko_link2 }">
	</td></tr>
	<tr><td colspan="9">
		<input type="text" name="ko_link3" size="97" placeholder="영상 링크3" value="${ ko.ko_link3 }">
	</td></tr>
	<tr>
		<td colspan="9" align="center">
			<input class="btn btn-outline-success" type="submit" value="수정">
			<input class="btn btn-outline-success" type="button" value="수정 취소" onclick="cancleCheck();">
		</td>
	</tr>
	</table>
</form>
</div>







<br><br><br><hr style="clear: both">
<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>





