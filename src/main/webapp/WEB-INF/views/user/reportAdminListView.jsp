<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 제보 내역</title>
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Do+Hyeon|Jua|Nanum+Gothic|Sunflower:300" rel="stylesheet">
<style type="text/css">
html head{
	font-family: Roboto, Nanum Gothic;
}
html body{
	font-family: Roboto, Nanum Gothic;
} 
table tr td a { 
	text-decoration:none;
} 
</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
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
<c:import url="/WEB-INF/views/common/menubarA.jsp" />
<h2 align="center">역사 왜곡 제보 목록</h2>
<br>
<!-- 로그인 여부에 따라 로그인페이지/게시글 작성 페이지로 이동, 관리자는 작성 x -->
<c:if test="${ empty loginUser }">
	<div style="align:center;text-align:center;">
    	<button class="btn btn-outline-primary" onclick="moveLoginPage();">게시글 작성</button>
    </div>
</c:if>
<c:if test="${ !empty loginUser and loginUser.admin_yn eq 'N' }">
	<div style="align:center;text-align:center;">
		<button class="btn btn-outline-primary" onclick="javascript:location.href='rpwf.do';">게시글 작성</button>
	</div>
</c:if>
<table align="center" width="1150px">
	<tr>
		<td colspan="3"><h5>총 게시글 갯수 : ${ listCount }</h5></td>
    	<!-- 게시판 내 검색기능 -->
		<td colspan="7" align="right">
			<div style="float: left; width: 50%;">
			<select class="form-control" onchange="showDiv(this)" style="width:90px; display:inline-block">
				<option value="title">제목</option>
				<option value="writer">작성자</option>
				<option value="date">작성날짜</option>
			</select>
			</div>
			<div id="titleDiv" style="display:inline-block; float: left; width: 40%;">
			<form action="rptitle.do" method="post">
				<input type="search" name="keyword" placeholder="검색어를 입력하세요" style="width: 250px; float: left;" class="form-control">
				<button type="submit" class="btn btn-outline-primary">검색</button>
			</form>
			</div>
			<div id="writerDiv" style="display:none; float: left; width: 40%;">
			<form action="rpwriter.do" method="post">
				<input type="search" name="keyword" placeholder="검색어를 입력하세요" style="width: 250px; float: left;" class="form-control">
				<button type="submit" class="btn btn-outline-primary">검색</button>
			</form>
			</div>
			<div id="dateDiv" style="display:none; float: left; width: 40%;">
			<form action="rpdate.do" method="post">
				<input type="date" name="begin"> ~ <input type="date" name="end">
				<button type="submit" class="btn btn-outline-primary">검색</button>
			</form>
			</div>
		</td>
	</tr>
</table>
<div style="height:10px"></div>

<table class="table table-lightgray table-hover" style="table-layout: fixed; width:1200px" align="center" cellspacing="0" cellpadding="3">
	<thead>
		<tr align="center" class="thead-light">
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>등록날짜</th>
			<th>첨부파일</th>
			<th>조회수</th>
			<th></th>
		</tr>
	</thead>
<c:forEach items="${ list }" var="r">
<tr align="center">
	<td>${ r.report_no }</td>
	<td align="left">
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
	<td>
		<c:if test="${ r.admin_comment != null }">
			※
		</c:if>
	</td>
</tr>
</c:forEach>
</table>
<br>

<%-- 페이징 처리 --%>
<div style="text-align:center;">
<button class="btn btn-outline-primary" onclick="javascript:location.href='rplista.do?page=1';">목록 보기</button><br>
	<c:if test="${ currentPage <= 1 }">
		[맨처음] &nbsp;
	</c:if>
	<c:if test="${ currentPage > 1 }">
      <c:url var="ubl" value="/rplistu.do">
         <c:param name="page" value="1" />
      </c:url>
      <a href="${ ubl }">[맨처음]</a>
   </c:if>
	
	<%-- 이전 페이지 그룹으로 이동 --%>
	<c:if test="${ (currentPage - 10) < startPage and (currentPage - 10) > 1 }">
	<c:url var="ubl2" value="/rplista.do">
		<c:param name="page" value="${ startPage - 10 }"/>
	</c:url>
	<a href="${ ubl2 }">이전그룹</a>
	</c:if>
	<c:if test="${ !((currentPage - 10) < startPage and (currentPage - 10) > 1) }">
  		&nbsp;&nbsp;이전그룹&nbsp;&nbsp;
	</c:if>
	
	<%-- 현재 페이지 숫자 출력 --%>
	<c:forEach var="p" begin="${ startPage }" end="${ endPage }">
		<c:if test="${ p == currentPage }">
			<font color="red" size="4">[${ p }]</font>
		</c:if>
		<c:if test="${ p != currentPage }">
			<c:url var="rplist" value="/rplista.do">
				<c:param name="page" value="${ p }" />
			</c:url>
			<a href="${ rplist }">${ p }</a>
		</c:if>
	</c:forEach> &nbsp;
	
	<%-- 다음 페이지 그룹으로 이동 --%>
	<c:if test="${ (currentPage + 10) > endPage && (currentPage + 10) < maxPage }">
	<c:url var="ubl4" value="/rplista.do">
      <c:param name="page" value="${ endPage + 10 }"/>
	</c:url>
	<a href="${ ubl4 }">다음그룹</a>
	</c:if>
	<c:if test="${ !((currentPage + 10) > endPage && (currentPage + 10) < maxPage) }">
		&nbsp;&nbsp;다음그룹&nbsp;&nbsp;
	</c:if>
	
	<c:if test="${ currentPage >= maxPage }">
		[맨끝] &nbsp;
	</c:if>
	<c:if test="${ currentPage < maxPage }">
		<c:url var="rplist" value="/rplista.do">
			<c:param name="page" value="${ maxPage }" />
		</c:url>
		<a href="${ rplist }">[맨끝]</a> &nbsp;
	</c:if>
	
</div>

<hr>
<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>