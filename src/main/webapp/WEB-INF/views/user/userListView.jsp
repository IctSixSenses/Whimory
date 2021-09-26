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

</script>

</head>
<body>
<c:import url="/WEB-INF/views/common/menubar.jsp" />
<c:import url="/WEB-INF/views/common/menubarA.jsp" />
<hr>
<h1 align="center">회원 관리 페이지</h1>

<!-- 검색 창 -->
<!-- 검색창 부분 -->
	<form class="d-flex" style="align:center">
		<input class="form-control me-2" type="search"
			placeholder="검색어를 입력하세요." aria-label="Search" style="width: 200px" >
		<button class="btn btn-outline-success" type="submit" >검색하기</button>
	</form>

<!-- 검색 창 마무리 -->


<!-- 회원 정보 출력 테이블 -->
<table align="center" border="1" cellspacing="0" cellpadding="3">
<tr>
<th>아이디</th><th>이름</th><th>성별</th><th>생일</th><th>전화번호</th>
<th>이메일</th><th>가입날짜</th><th>마지막 로그인 날짜</th>
<th>관리자 여부</th>
</tr>
<c:forEach items="${ requestScope.list }" var="m">
<tr>
<td><a href="${ pageContext.servletContext.contextPath }/uinfo.do?user_id=${m.user_id}">${ m.user_id }</a></td>
<td>${ m.user_name }</td>
<td>${  (m.gender eq "M")? "남자" : "여자" }</td>
<td>${ m.birth }</td>
<td>${ m.phone }</td>
<td>${ m.email }</td>
<td><fmt:formatDate value="${ m.join_date }" type="date" 
dateStyle="medium" /> </td>
<td><fmt:formatDate value="${ m.last_login_date }" type="date" 
dateStyle="medium" /></td>
<td>
<c:if test="${ m.admin_yn eq 'Y' }">
<!-- <input type="radio" name="admin_${ m.user_id }" onchange="changeLogin(this);"
 value="true" checked> 관리자 &nbsp; 
<input type="radio" name="admin_${ m.user_id }" onchange="changeLogin(this);"
value="false"> 일반회원 -->
<button class="btn btn-outline-primary"
					onclick="changeLogin(this);">일반회원 권한 부여</button>
</c:if>
<c:if test="${ m.admin_yn eq 'N' }">
<!--  <input type="radio" name="admin_${ m.user_id }" onchange="changeLogin(this);"
 value="true"> 관리자 &nbsp; 
<input type="radio" name="admin_${ m.user_id }" onchange="changeLogin(this);"
value="false" checked> 일반회원 -->
<button class="btn btn-outline-primary"
					onclick="changeLogin(this);">관리자 권한 부여</button>
</c:if>
</td>
<td>
<c:if test="${ m.login_access_yn eq 'Y' }">
<input type="radio" name="loginok_${ m.user_id }" onchange="changeLogin(this);"
 value="true" checked> 가능 &nbsp; 
<input type="radio" name="loginok_${ m.user_id }" onchange="changeLogin(this);"
value="false"> 제한
</c:if>
<c:if test="${ m.login_access_yn eq 'N' }">
<input type="radio" name="loginok_${ m.user_id }" onchange="changeLogin(this);"
 value="true"> 가능 &nbsp; 
<input type="radio" name="loginok_${ m.user_id }" onchange="changeLogin(this);"
value="false" checked> 제한
</c:if>
</td>
</tr>
</c:forEach>
</table>

<div align="center">
<button class="btn btn-primary"
					onclick="javascript:history.go(-1);">뒤로 가기</button>
					</div>
<hr>
<c:import url="/WEB-INF/views/common/footer.jsp" />

</body>
</html>