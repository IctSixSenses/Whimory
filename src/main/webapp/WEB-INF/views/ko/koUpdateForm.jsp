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
	<table width="900px" align="center">
	<tr>
		<td width="20px">
			<select name="ko_category">
				<option value="history">역사</option>
				<option value="culture">문화</option>
				<option value="food">음식</option>
				<option value="culheri">문화재</option>
			</select>
		</td>
		<td colspan="2">
			작성자: ${ ko.user_id } &nbsp;
			수정자: <input type="text" name="ko_editor" value="${ loginUser.user_id }" size="15" readonly>
		</td>
	</tr>
	<tr><td><input type="text" name="ko_title" size="90" required value="${ ko.ko_title }"></td></tr>
	<tr>
		<td colspan="3"><textarea name="ko_content" cols="100" rows="20" required>${ ko.ko_content }</textarea></td>
	</tr>
	<tr><td colspan="3">
		<c:if test="${ !empty ko.ko_org_file }">
			${ ko.ko_org_file } &nbsp;
			<input type="checkbox" name="delFlag" value="yes">삭제<br>
			변경: <input type="file" name="kfile">
		</c:if>
		<c:if test="${ empty ko.ko_org_file }">
			<input type="file" name="kfile">
		</c:if>
	</td></tr>
	<tr><td colspan="3">
		<input type="text" name="ko_hashtag" size="90" placeholder="해시태그" value="${ ko.ko_hashtag }">
	</td></tr>
	<tr><td colspan="3">
		<input type="text" name="ko_link1" size="90" placeholder="영상 링크1" value="${ ko.ko_link1 }">
	</td></tr>
	<tr><td colspan="3">
		<input type="text" name="ko_link2" size="90" placeholder="영상 링크2" value="${ ko.ko_link2 }">
	</td></tr>
	<tr><td colspan="3">
		<input type="text" name="ko_link3" size="90" placeholder="영상 링크3" value="${ ko.ko_link3 }">
	</td></tr>
	<tr>
		<td colspan="3" align="center">
			<input type="submit" value="수정">
			<input type="button" value="수정 취소" onclick="cancleCheck();">
		</td>
	</tr>
	</table>
</form>
</div>







<br><br><br><hr style="clear: both">
<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>





