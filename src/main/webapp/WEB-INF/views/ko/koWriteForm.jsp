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
	<table width="800px" align="center">
	<tr style="height:40px; border-bottom: 2px solid gray"><td colspan="9">
		<h5>Korea Origin 글쓰기</h5>
	</td></tr>
	<tr style="height:50px; padding-top:10px;">
		<td width="100px">
			<select name="ko_category">
				<option value="history">역사</option>
				<option value="culture">문화</option>
				<option value="food">음식</option>
				<option value="culheri">문화재</option>
			</select>
		</td>
		<td colspan="8">
			<input type="text" name="ko_title" size="83" required placeholder="제목을 입력하세요.">
		</td>
	</tr>
	<tr>
		<td colspan="9"><textarea name="ko_content" cols="100" rows="20" required placeholder="내용을 입력하세요."></textarea></td>
	</tr>
	<tr>
		<td colspan="9"><textarea name="ko_summary" rows="2" cols="100" required placeholder="한줄 요약"></textarea></td>	
	</tr>
	<tr><td colspan="9"><input type="file" name="kfile"></td></tr>
	<tr><td colspan="9"><input type="text" name="ko_hashtag" size="97" placeholder="해시태그"></td></tr>
	<tr><td colspan="9"><input type="text" name="ko_link1" size="97" placeholder="영상 링크 1"></td></tr>
	<tr><td colspan="9"><input type="text" name="ko_link2" size="97" placeholder="영상 링크 2"></td></tr>
	<tr><td colspan="9"><input type="text" name="ko_link3" size="97" placeholder="영상 링크 3"></td></tr>
	<tr>
		<td colspan="9" align="center">
			<input class="btn btn-outline-success" type="submit" value="등록">
			<input class="btn btn-outline-success" type="button" value="등록 취소" onclick="cancleCheck();">
		</td>
	</tr>
	</table>
</form>
</div>







<br><br><br><hr style="clear: both">
<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>





