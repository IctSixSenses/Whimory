<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="views/common/error.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LOGIN BUTTON</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<script type="text/javascript"
	src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.0.min.js"></script>

<script type="text/javascript">
	//로그인 페이지로 이동
	function movePage() {
		location.href = "loginPage.do";
	}
	
	//회원 가입 페이지로 이동
	function movePage2() {
		location.href = "enrollPage.do";
	}
	
	//아이디/비밀번호 찾기 페이지로 이동
	function movePage3() {
		location.href = "findaccount.do";
	}
</script>
</head>
<body>
<!-- 로그인 관련 버튼 공간 분리 -->
<div id="loginform" align="right">
			<!-- 아무도 로그인이 되지 않은 경우 -->
			<c:if test="${ empty loginUser }">
				<button class="btn btn-outline-primary" onclick="movePage()">로그인하기</button> &nbsp; &nbsp;
				<button class="btn btn-outline-primary" onclick="movePage2()">회원가입하기</button> &nbsp; &nbsp;
				<button class="btn btn-outline-primary" onclick="movePage3()">계정 찾기</button> &nbsp; &nbsp;
			</c:if>

			<!-- 관리자로 로그인이 된 상태인 경우 (마이페이지 및 메뉴 항목 수정 예정)//이름 출력 -->
			<c:if
				test="${ !empty sessionScope.loginUser and loginUser.admin_yn eq 'Y' }">
	${ sessionScope.loginUser.user_name } 님 어서오세요. &nbsp; &nbsp;
	<button class="btn btn-outline-primary"
					onclick="javascript:location.href='logout.do';">로그아웃</button>  &nbsp; &nbsp;
					<button class="btn btn-outline-primary"
					onclick="javascript:location.href='ulist.do';">회원 정보 보기</button>
			</c:if>
			<!-- 일반 회원이 로그인 된 경우 (마이페이지 및 메뉴 항목 수정 예정) // 이름 출력 -->
			<c:if
				test="${ !empty sessionScope.loginUser and loginUser.admin_yn eq 'N' }">
	${ sessionScope.loginUser.user_name } 회원님 어서오세요.  &nbsp; &nbsp;
	<button class="btn btn-outline-primary"
					onclick="javascript:location.href='logout.do';">로그아웃</button> &nbsp; &nbsp; 
					<c:url var= "callMyinfo" value="/myinfo.do">
					<c:param name="user_id" value="${loginUser.user_id}" />
					</c:url>
					<a href="${ callMyinfo }">마이페이지</a>
			</c:if>
		</div>


</body>
</html>