<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
</style>
<script type="text/javascript">
function cancleCheck(){
	
	if(confirm("등록을 취소하시겠습니까?") == true){
		location.href="${ pageContext.servletContext.contextPath }/klist.do";
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
<form action="kinsert.do" method="post" enctype="multipart/form-data" >
	<input type="hidden" name="user_id" value="${ loginUser.user_id }">
	<table width="900px" align="center">
	<tr>
		<td>
			<select name="ko_category">
				<option value="history">역사</option>
				<option value="culture">문화</option>
				<option value="food">음식</option>
				<option value="culheri">문화재</option>
			</select>
		</td>
		<td><input type="text" name="ko_title" size="70" required placeholder="제목을 입력하세요."></td>
	</tr>
	<tr>
		<td colspan="2"><textarea name="ko_content" cols="100" rows="20" required placeholder="내용을 입력하세요."></textarea></td>
	</tr>
	<tr><td colspan="2"><input type="file" name="kfile"></td></tr>
	<tr><td colspan="2"><input type="text" name="ko_hashtag" size="90" placeholder="해시태그"></td></tr>
	<tr><td colspan="2"><input type="text" name="ko_link1" size="90" placeholder="영상 링크 1"></td></tr>
	<tr><td colspan="2"><input type="text" name="ko_link2" size="90" placeholder="영상 링크 2"></td></tr>
	<tr><td colspan="2"><input type="text" name="ko_link3" size="90" placeholder="영상 링크 3"></td></tr>
	<tr>
		<td colspan="2" align="center">
			<input type="submit" value="등록">
			<input type="button" value="등록 취소" onclick="cancleCheck();">
		</td>
	</tr>
	</table>
</form>
</div>







<br><br><br><hr style="clear: both">
<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>





