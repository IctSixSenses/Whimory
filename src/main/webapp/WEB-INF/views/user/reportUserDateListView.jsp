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
table tr td a, div a { 
	text-decoration:none;
	color: black; 
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
<br><br><br><br><br><br><br>
<c:import url="/WEB-INF/views/common/menubarA.jsp" />

<h2 align="center" style="font-family:Nanum Gothic; font-weight:630; color:#333333;">역사왜곡 제보 게시판</h2>
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
				<option value="date">작성날짜</option>
			</select>
			</div>
			<div id="titleDiv" style="display:inline-block; float: left; width: 40%;">
			<form action="rptitlea.do">
				<input type="search" name="keyword" placeholder="검색어를 입력하세요" style="width: 250px; float: left;" class="form-control">
				<button type="submit" class="btn btn-outline-primary">검색</button>
			</form>
			</div>
			<div id="dateDiv" style="display:none; float: left; width: 40%;">
			<form action="rpdatea.do">
				<input type="date" name="begin"> ~ <input type="date" name="end">
				<button type="submit" class="btn btn-outline-primary">검색</button>
			</form>
			</div>
			<!-- <button class="btn btn-outline-primary" onclick="javascript:location.href='rplist.do?page=1';">전체보기</button> -->
			<br>
		</td>
	</tr>
</table>
<div style="height:10px"></div>

<table class="table table-lightgray table-hover" style="table-layout: fixed; width:1200px" align="center" cellspacing="0" cellpadding="3">
	<thead>
		<tr align="center" class="thead-light">
			<th width="50px">번호</th>
			<th width="300px">제목</th>
			<th width="120px">작성자</th>
			<th width="150px">등록일</th>
			<th width="100px">첨부파일</th>
			<th width="100px">조회수</th>
			<th width="100px">답변</th>
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
	<td>
		<c:if test="${ !empty r.report_re_file }">
			<i class="fas fa-file-download"></i>
		</c:if>
		<c:if test="${ empty r.report_re_file }">
			&nbsp;
		</c:if>
	</td>
	<td>${ r.report_readcount }</td>
	<td>
		<c:if test="${ r.admin_comment != null }">
			<i class="far fa-comment-dots"></i>
		</c:if>
	</td>
</tr>
</c:forEach>
</table>
<br>

<%-- 페이징 처리 --%>
<div style="text-align:center;">
	<c:if test="${ currentPage <= 1 }">
		&lt;&lt;&nbsp;
	</c:if>
	<c:if test="${ currentPage > 1 }">
      <c:url var="ubl" value="/rpdateu.do">
		<c:param name="page" value="${ maxPage }"/>
		<c:param name="begin" value="${ begin }" />
		<c:param name="end" value="${ end }" />
      </c:url>
      <a href="${ ubl }">&lt;&lt;</a>
   </c:if>
	
	<%-- 이전 페이지 그룹으로 이동 --%>
	<c:if test="${ (currentPage - 10) < startPage and (currentPage - 10) > 1 }">
	<c:url var="ubl2" value="/rpdateu.do">
		<c:param name="page" value="${ maxPage }"/>
		<c:param name="begin" value="${ begin }" />
		<c:param name="end" value="${ end }" />
	</c:url>
	<a href="${ ubl2 }">&lt;</a>
	</c:if>
	<c:if test="${ !((currentPage - 10) < startPage and (currentPage - 10) > 1) }">
  		&nbsp;&nbsp;&lt;&nbsp;&nbsp;
	</c:if>
	
	<%-- 현재 페이지 숫자 출력 --%>
	<c:forEach var="p" begin="${ startPage }" end="${ endPage }">
		<c:if test="${ p == currentPage }">
			<font color="red" size="4">${ p }</font>
		</c:if>
		<c:if test="${ p != currentPage }">
			<c:url var="rplist" value="/rpdateu.do">
				<c:param name="page" value="${ maxPage }"/>
				<c:param name="begin" value="${ begin }" />
				<c:param name="end" value="${ end }" />
			</c:url>
			<a href="${ rplist }">${ p }</a>
		</c:if>
	</c:forEach> &nbsp;
	
	<%-- 다음 페이지 그룹으로 이동 --%>
	<c:if test="${ (currentPage + 10) > endPage && (currentPage + 10) < maxPage }">
	<c:url var="ubl4" value="/rpdateu.do">
		<c:param name="page" value="${ maxPage }"/>
		<c:param name="begin" value="${ begin }" />
		<c:param name="end" value="${ end }" />
	</c:url>
	<a href="${ ubl4 }">&gt;</a>
	</c:if>
	<c:if test="${ !((currentPage + 10) > endPage && (currentPage + 10) < maxPage) }">
		&nbsp;&nbsp;&gt;&nbsp;&nbsp;
	</c:if>
	
	<c:if test="${ currentPage >= maxPage }">
		&gt;&gt;&nbsp;
	</c:if>
	<c:if test="${ currentPage < maxPage }">
		<c:url var="rplist" value="/rpdateu.do">
			<c:param name="page" value="${ maxPage }"/>
        	<c:param name="begin" value="${ begin }" />
         	<c:param name="end" value="${ end }" />
		</c:url>
		<a href="${ rplist }">&gt;&gt;</a> &nbsp;
	</c:if>
	
</div>
<br><br><br><br><br>
<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>