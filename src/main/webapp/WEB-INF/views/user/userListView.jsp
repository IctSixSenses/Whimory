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
<script type="text/javascript">
$(function(){
	$("input[name=item]").on("change", function(){
		
		$("input[name=item]").each(function(index){
			//radio 하나씩 checked 인지 확인하고
			if($(this).is(":checked")){
				$("form.sform").eq(index).css("display", "block");
			}else{
				$("form.sform").eq(index).css("display", "none");
			}
		});
	});
});

function changeLogin(element){	
	var user_id = element.name.substring(8);
	console.log(userid);
	if(element.checked == true && element.value == "false"){
		console.log("로그인 불가로 변경");
		location.href = "${ pageContext.servletContext.contextPath }/loginOK.do?user_id=" + user_id + "&login_ok=N";
	}else{
		console.log("로그인 가능으로 변경");
		location.href = "${ pageContext.servletContext.contextPath }/loginOK.do?user_id=" + user_id + "&login_ok=Y";		
	}
}
</script>

</head>
<body>
<c:import url="/WEB-INF/views/common/menubar.jsp" />
<hr>
<h1 align="center">회원 관리 페이지</h1>

<!-- 검색 창 -->
<!-- 검색창 부분 -->
	<form class="d-flex" style="align:center">
		<input class="form-control me-2" type="search"
			placeholder="검색어를 입력하세요." aria-label="Search" style="width: 200px" >
		<button class="btn btn-outline-success" type="submit">Search</button>
	</form>

<!-- 검색 창 마무리 -->


<!-- 회원 정보 출력 테이블 -->
<table align="center" border="1" cellspacing="0" cellpadding="3">
<tr>
<th>아이디</th><th>이름</th><th>성별</th><th>생일</th><th>전화번호</th>
<th>이메일</th><th>인증여부</th><th>가입날짜</th><th>마지막 수정날짜</th>
<th>관리자 여부</th>
<th>로그인 제한 여부</th><th>경고 횟수 카운트</th>
</tr>
<c:forEach items="${ requestScope.list }" var="m">
<tr>
<td>${ m.user_id }</td>
<td>${ m.user_name }</td>
<td>${  (m.gender eq "M")? "남자" : "여자" }</td>
<td>${ m.birth }</td>
<td>${ m.phone }</td>
<td>${ m.email }</td>
<td>${ m.auth_status }</td>
<td><fmt:formatDate value="${ m.join_date }" type="date" 
dateStyle="medium" /> </td>
<td><fmt:formatDate value="${ m.last_login_date }" type="date" 
dateStyle="medium" /></td>
<td>
<c:if test="${ m.login_access_yn eq 'Y' }">
<input type="radio" name="loginok_${ m.user_id }" onchange="changeLogin(this);"
 value="true" checked> 가능 &nbsp; 
<input type="radio" name="loginok_${ m.user_id }" onchange="changeLogin(this);"
value="false"> 제한
</c:if>
<c:if test="${ m.login_access_yn eq 'N' }">
<input type="radio" name="loginok_${ m.userid }" onchange="changeLogin(this);"
 value="true"> 가능 &nbsp; 
<input type="radio" name="loginok_${ m.userid }" onchange="changeLogin(this);"
value="false" checked> 제한
</c:if>
</td>
<td>${ m.penalty_count }</td>
</tr>
</c:forEach>
</table>

<button class="btn btn-outline-primary"
					onclick="javascript:history.go(-1):;">뒤로 가기</button> &nbsp; &nbsp;
<hr>
<c:import url="/WEB-INF/views/common/footer.jsp" />

</body>
</html>