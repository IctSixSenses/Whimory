<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Whimory</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/css/bootstrap-select.min.css">
<script type="text/javascript" src="${ pageContext.request.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

function moveLoginPage(){
	alert("로그인 후 이용 가능한 서비스입니다.\n로그인 페이지로 이동합니다.");	
	location.href = "${ pageContext.servletContext.contextPath }/loginPage.do";
}

function showDiv(item){
	if($(item).val() == "title"){
		$("#titleDiv").css("display", "inline-block");
		$("#writerDiv").css("display", "none");
		$("#dateDiv").css("display", "none");
	}
	   
	if($(item).val() == "writer"){
		$("#titleDiv").css("display", "none");
		$("#writerDiv").css("display", "inline-block");
		$("#dateDiv").css("display", "none");
	}
	   
	if($(item).val() == "date"){
		$("#titleDiv").css("display", "none");
		$("#writerDiv").css("display", "none");
		$("#dateDiv").css("display", "inline-block");
	}
}

</script>
</head>
<body>
<c:import url="/WEB-INF/views/common/menubar.jsp" />
<hr>
<h1 align="center">역사왜곡 제보 게시판</h1>
<h2 align="center">총 게시글 갯수: ${ listCount }</h2>
<table align="center" width="1150px">
	<tr>
		<td align="right">
			<select class="form-control" onchange="showDiv(this)" style="width:90px; display:inline-block">
				<option value="title">제목</option>
				<option value="writer">작성자</option>
				<option value="date">작성날짜</option>
			</select>
			<div id="titleDiv" style="display:inline-block">
			<form action="rptitle.do" method="post">
				<input type="search" name="keyword" placeholder="검색어를 입력하세요" style="width: 200px">
				<button type="submit">검색</button>
			</form>
			</div>
			<div id="writerDiv" style="display:none">
			<form action="rpwriter.do" method="post">
				<input type="search" name="keyword" placeholder="검색어를 입력하세요" style="width: 200px">
				<button type="submit">검색</button>
			</form>
			</div>
			<div id="dateDiv" style="display:none">
			<form action="rpdate.do" method="post">
				<input type="date" name="begin"> ~ <input type="date" name="end">
				<button type="submit">검색</button>
			</form>
			</div>
			
		</td>
	</tr>
</table>
<div style="height:10px"></div>
<!-- 로그인 여부에 따라 로그인페이지/게시글 작성 페이지로 이동, 관리자는 작성 x -->
<c:if test="${ empty loginUser }">
	<div style="align:center;text-align:center;">
    	<button onclick="moveLoginPage();">게시글 작성</button>
    </div>
</c:if>
<c:if test="${ !empty loginUser and loginUser.admin_yn eq 'N' }">
	<div style="align:center;text-align:center;">
		<button onclick="javascript:location.href='rpwf.do';">글쓰기</button>
	</div>
</c:if>
<br>
<table align="center" border="1" cellspacing="0" cellpadding="5" width="700">
<tr>
	<th></th>
	<th>번호</th>
	<th>제목</th>
	<th>작성자</th>
	<th>등록날짜</th>
	<th>첨부파일</th>
	<th>조회수</th>
</tr>
<c:forEach items="${ list }" var="r">
<tr>
	<td>
		<c:if test="${ r.admin_comment != null }">
			※
		</c:if>
	</td>
	<td>${ r.report_no }</td>
	<td>
		<c:url var="rpdetail" value="rpdetail.do">
			<c:param name="report_no" value="${ r.report_no }" />
			<c:param name="page" value="${ currentPage }" />
		</c:url>
		<a href="${ rpdetail }">${ r.report_title }</a>
	</td>
	<td>${ r.user_id }</td>
	<td>${ r.report_date }</td>
	<td>${ r.report_org_file }</td>
	<td>${ r.report_readcount }</td>
</tr>
</c:forEach>
</table>
<br>

<%-- 페이징 처리 --%>
<div style="text-align:center;">
<button onclick="javascript:location.href='rplist.do?page=1';">전체 목록 보기</button><br>
	<c:if test="${ currentPage <= 1 }">
		[첫 페이지] &nbsp;
	</c:if>
	<c:if test="${ currentPage > 1 }">
		<c:url var="rplist.do" value="/rplist.do">
			<c:param name="page" value="${ startPage }" />
		</c:url>
		<a href="${ rplist }">[첫 페이지]</a> &nbsp;
	</c:if>
	
	<%-- 이전 페이지 그룹으로 이동 --%>
	<c:if test="${ (currentPage - 10) < startPage && (currentPage - 10) > 1 }">
		<c:url var="rplist" value="/rplist.do">
			<c:param name="page" value="${ startPage - 10 }" />
		</c:url>
		<a href="${ rplist }">[이전]</a> &nbsp;
	</c:if>
	<c:if test="${ (currentPage - 10) >= startPage && (currentPage - 10) <= 1 }">
		[이전] &nbsp;
	</c:if>
	
	<%-- 현재 페이지 숫자 출력 --%>
	<c:forEach var="p" begin="${ startPage }" end="${ endPage }">
		<c:if test="${ p == currentPage }">
			<font color="red" size="4">[${ p }]</font>
		</c:if>
		<c:if test="${ p != currentPage }">
			<c:url var="rplist" value="/rplist.do">
				<c:param name="page" value="${ p }" />
			</c:url>
			<a href="${ rplist }">${ p }</a>
		</c:if>
	</c:forEach> &nbsp;
	
	<%-- 다음 페이지 그룹으로 이동 --%>
	<c:if test="${ (currentPage + 10) > endPage && (currentPage + 10) < maxPage }">
		<c:url var="rplist" value="/rplist.do">
			<c:param name="page" value="${ endPage + 10 }" />
		</c:url>
		<a href="${ rplist }">[다음]</a> &nbsp;
	</c:if>
	<c:if test="${ (currentPage + 10) <= endPage && (currentPage + 10) >= maxPage }">
		[다음] &nbsp;
	</c:if>
	
	<c:if test="${ currentPage >= maxPage }">
		[마지막 페이지] &nbsp;
	</c:if>
	<c:if test="${ currentPage < maxPage }">
		<c:url var="rplist" value="/rplist.do">
			<c:param name="page" value="${ maxPage }" />
		</c:url>
		<a href="${ rplist }">[마지막 페이지]</a> &nbsp;
	</c:if>
	
</div>

<hr>
<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>