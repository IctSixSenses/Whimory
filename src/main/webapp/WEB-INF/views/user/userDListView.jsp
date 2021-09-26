<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 회원 관리 페이지</title>
<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.0.min.js"></script>

</head>
<body>
<c:import url="/WEB-INF/views/common/menubar.jsp" />
<hr>
<c:import url="/WEB-INF/views/common/menubarA.jsp" />
<h1 align="center">탈퇴회원 정보 보기</h1>
<br><br>

<!-- 검색 창 -->
<!-- 검색창 부분 -->
<div align="center">
	<table align="center" width="1150px">
	<tr>
		<td colspan="3"></td>
    	<!-- 게시판 내 검색기능 -->
		<td colspan="4" align="right">
			<div id="usearch" style="display:inline-block; float: left; width: 40%;">
			<form action="usearchD.do" method="post">
			<input type="hidden" name="action" value="id">
				<input type="search" name="keyword" placeholder="검색어를 입력하세요" style="width: 250px; float: left;" class="form-control">
				<button type="submit" class="btn btn-outline-primary">검색</button>
			</form>
			</div>
		</td>
	</tr>
</table>
</div>

<!-- 검색 창 마무리 -->

<br><br>
<!-- 회원 정보 출력 테이블 -->
<table align="center" border="1" cellspacing="0" cellpadding="3">
<tr>
<th>아이디</th><th>이름</th><th>성별</th><th>생일</th><th>전화번호</th>
<th>이메일</th><th>가입날짜</th><th>마지막 로그인 날짜</th>
<th>완전 삭제 예정일</th>
</tr>
<c:forEach items="${ requestScope.list }" var="m">
<tr>
<td>${ m.user_id }</td>
<td>${ m.d_user_name }</td>
<td>${  (m.d_gender eq "M")? "남자" : "여자" }</td>
<td>${ m.d_birth }</td>
<td>${ m.d_phone }</td>
<td>${ m.d_email }</td>
<td><fmt:formatDate value="${ m.d_join_date }" type="date" 
dateStyle="medium" /> </td>
<td><fmt:formatDate value="${ m.d_last_login_date }" type="date" 
dateStyle="medium" /></td>
<td>
<fmt:formatDate value="${ m.drop_date }" type="date" 
dateStyle="medium" />
</td>
</tr>
</c:forEach>
</table>
<br><br>

<div align="center">
<button class="btn btn-outline-primary"
					onclick="javascript:history.go(-1);">뒤로 가기</button>
					</div>
<hr>
<c:import url="/WEB-INF/views/common/footer.jsp" />

</body>
</html>