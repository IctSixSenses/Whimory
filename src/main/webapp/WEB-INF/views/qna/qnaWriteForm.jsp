<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Whimory</title>
</head>
<body>
<c:import url="../common/menubar.jsp" />
<hr>

<h1 align="center">질문할게요!</h1><br>

<!-- form에서 입력값들과 파일을 함께 전송하려면 반드시 속성을 추가해야 함: enctype="multipart/form-data" -->
<form action="qinsert.do" method="post" enctype="multipart/form-data">
<table align="center" width="500" border="1" cellspacing="0" cellpadding="5">
<tr><th>작성자</th>
	<td><input type="text" name="user_id" readonly value="${ loginUser.user_id }"></td>
</tr>
<tr>
	<th>질문 분류</th>
	<td>
		<form>
			<select name="qq_category">
				<option value="정보게시판">정보게시판</option>
				<option value="공지사항">공지사항</option>
				<option value="언론보도">언론보도</option>
				<option value="자유 토론 게시판">자유 토론 게시판</option>
				<option value="역사 왜곡 제보하기">역사 왜곡 제보하기</option>
				<option value="기타">기타</option>
			</select>
		</form>
		</td>
</tr>
<tr><th>제   목</th>
	<td><input type="text" name="qq_title" size="50"></td>
</tr>

<tr><th>첨부파일</th>
	<td><input type="file" name="upfile">
	</td>
</tr>
<tr><th>내   용</th>
	<td><textarea rows="5" clos="50" name="qq_content"></textarea></td>
</tr>
<tr><th colspan="2">
	<input type="reset" value="다시작성"> &nbsp;
	<input type="submit" value="등록하기"> &nbsp;
	
	<input type="button" value="목록으로" onclick="javascript:history.go(-1); return false;"></th></tr>
</table>

</form>
<br><br><br>

<hr>
<c:import url="../common/footer.jsp" />
</body>
</html>