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
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Do+Hyeon|Jua|Nanum+Gothic|Sunflower:300" rel="stylesheet">
<style type="text/css">
html head{
	font-family: Roboto, Nanum Gothic;
}
html body{
	font-family: Roboto, Nanum Gothic;
} 
table tr td a, div a { 
	text-decoration:none;
	color: black; 
} 
</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/css/bootstrap-select.min.css">
<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
</head>
<body>
<c:import url="/WEB-INF/views/common/menubar.jsp" />
<br><br><br><br><br><br><br>
<c:import url="/WEB-INF/views/common/menubarA.jsp" />
<h2 align="center" style="font-family:Nanum Gothic; font-weight:630; color:#333333;">회원 관리 페이지</h2>
<br>
<!-- 검색 창 -->
<!-- 검색창 부분 -->
<div align="center">
	<table align="center" width="1150px">
	<tr>
		<td colspan="3"></td>
    	<!-- 게시판 내 검색기능 -->
		<td colspan="7" align="right">
			<div id="usearch" style="display:inline-block; float: right;">
			<form action="usearch.do" method="post">
			<input type="hidden" name="action" value="id">
				<input type="search" name="keyword" placeholder="회원 아이디를 입력하세요" style="width: 250px; float: left;" class="form-control">
				<button type="submit" class="btn btn-outline-primary">검색</button>
			</form>
			</div>
		</td>
	</tr>
</table>
</div>

<!-- 검색 창 마무리 -->
<br>
<br>

<!-- 회원 정보 출력 테이블 -->
<table class="table table-lightgray table-hover" style="table-layout: fixed; width:1400px" align="center" cellspacing="0" cellpadding="3">
<thead>
<tr align="center" class="thead-light">
<th>이름</th><th>아이디</th><!-- <th>성별</th><th>생일</th><th>전화번호</th> -->
<th width="250">이메일</th><th>가입날짜</th><th>마지막 로그인 날짜</th>
<th>관리자 여부</th>
<th>로그인 가능 여부</th>
</tr>
</thead>
<c:forEach items="${ requestScope.list }" var="m">
<tr align="center">
<td>${ m.user_name }</td>
<td><a href="${ pageContext.servletContext.contextPath }/uinfo.do?user_id=${m.user_id}">${ m.user_id }</a></td>
<!-- <td>${  (m.gender eq "M")? "남자" : "여자" }</td>
<td>${ m.birth }</td>
<td>${ m.phone }</td> -->
<td>${ m.email }</td>
<td><fmt:formatDate value="${ m.join_date }" type="date" pattern="yyyy-MM-dd"
dateStyle="medium" /> </td>
<td><fmt:formatDate value="${ m.last_login_date }" type="date" pattern="yyyy-MM-dd"
dateStyle="medium" /></td>
<td>
<c:if test="${ m.admin_yn eq 'Y' }">
<!-- <input type="radio" name="admin_${ m.user_id }" onchange="changeLogin(this);"
 value="true" checked> 관리자 &nbsp; 
<input type="radio" name="admin_${ m.user_id }" onchange="changeLogin(this);"
value="false"> 일반회원 -->
<form method="post" name="changeAdmin" action="adminchangeN.do">
<input type = "hidden" name="user_id" value="${m.user_id}">
<button class="btn btn-outline-primary"
					onclick="submit">일반회원 권한 부여</button>
</form>
</c:if>
<c:if test="${ m.admin_yn eq 'N' }">
<!--  <input type="radio" name="admin_${ m.user_id }" onchange="changeLogin(this);"
 value="true"> 관리자 &nbsp; 
<input type="radio" name="admin_${ m.user_id }" onchange="changeLogin(this);"
value="false" checked> 일반회원 -->
<form method="post" name="changAdminNot" action="adminchange.do">
<input type = "hidden" name="user_id" value="${m.user_id}">
<button class="btn btn-primary"
					onclick="submit">관리자 권한 부여</button>
</form>
</c:if>
</td>
<td>

<c:if test="${ m.login_access_yn eq 'N' }">
<form method="post" name="updateloginOK" action="loginchangeY.do">
<input type = "hidden" name="user_id" value="${m.user_id}">
<button class="btn btn-outline-success"
					onclick="submit">접속 허용 하기</button>
</form>
</c:if>
<c:if test="${ m.login_access_yn eq 'Y' }">
<form method="post" name="updateloginNo" action="loginchangeN.do">
<input type = "hidden" name="user_id" value="${m.user_id}">
<button class="btn btn-outline-danger"
				onclick="submit">접속 제한 하기</button>
</form>
</c:if>
 ${  (m.login_access_yn eq 'Y') ? "접속 가능" : "탈퇴 회원" }
</td> 
</tr>
</c:forEach>
</table>
<br><br>
<div align="center">
<button class="btn btn-outline-primary"
					onclick="location.href='main.do';">메인 페이지로 가기</button>
					</div>
<br><br>

<c:import url="/WEB-INF/views/common/footer.jsp" />

</body>
</html>