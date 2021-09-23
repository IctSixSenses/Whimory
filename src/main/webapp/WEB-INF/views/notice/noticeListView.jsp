<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Whimory Notice</title>
<link rel="stylesheet"  href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" 
	integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" 
	crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/css/bootstrap-select.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" 
	integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA==" 
	crossorigin="anonymous" />
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Do+Hyeon|Jua|Nanum+Gothic|Sunflower:300" rel="stylesheet">
<style type="text/css">

/* 폰트 적용 */
html head{
	font-family: Roboto, Nanum Gothic;
}
html body{
	font-family: Roboto, Nanum Gothic;
}

/* 본문 css */
table tr td a {
	text-decoration: none;
	color: black;
}

table tr td a:hover {
	color: black;
}

.k-list {
	clear: left;
	position: relative;
	width: 1000px;
	left: 230px;
}
</style>
<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
function showDiv(item){
	if($(item).val() == "title"){
		$("#titleDiv").css("display", "block");
		$("#contentDiv").css("display", "none");
		$("#dateDiv").css("display", "none");
	}
	
	if($(item).val() == "content"){
		$("#titleDiv").css("display", "none");
		$("#contentDiv").css("display", "block");
		$("#dateDiv").css("display", "none");
	}
	
	if($(item).val() == "date"){
		$("#titleDiv").css("display", "none");
		$("#contentDiv").css("display", "none");
		$("#dateDiv").css("display", "block");
	}
}
</script>
</head>
<body>
<c:import url="/WEB-INF/views/common/menubar.jsp" />
<hr style="clear: both;">
<br><br>

<h2 align="center">공지사항</h2>
<br>

<table align="center" style="width:1150px;">
	<tr>
		<td colspan="4">
			<font size="4">총 게시글 개수: ${ listCount }개</font> &nbsp;&nbsp;
		</td>
		<td colspan="5">
			<div style="float: left; width: 250px;">
			<select onchange="showDiv(this);" class="form-control" style="width:100px; float: right; display:inline-block">
				<option value="title">제목</option>
				<option value="content">내용</option>
				<option value="date">날짜</option>
			</select>
			</div>
			
			<div id="titleDiv" style="display:inline-block; float: left; width: 500px;">
				<form action="nsearchTitle.do" method="post">
					<input type="search" name="keyword" placeholder="검색어를 입력하세요" style="width: 300px; float: left;" class="form-control">
					<input type="submit" class="btn btn-outline-success" value="검색">
				</form>
			</div>
			<div id="contentDiv" style="display:none; float: left; width: 500px;">
				<form action="nsearchContent.do" method="post">
					<input type="search" name="keyword" placeholder="검색어를 입력하세요" style="width: 300px; float: left;" class="form-control">
					<input type="submit" class="btn btn-outline-success" value="검색">
				</form>
			</div>
			<div id="dateDiv" style="display:none; float: left; width: 500px;">
				<form action="nsearchDate.do" method="post">
					<input type="date" name="begin"> ~ <input type="date" name="end">
					<input type="submit" class="btn btn-outline-success" value="검색">
				</form>
			</div>
		</td>
		
		<td width="80px">
			<c:if test="${ loginUser.admin_yn eq 'Y' }">
				<c:url var="nwm" value="nwmove.do" />
				<button class="btn btn-success" onclick="javascript:location.href='${ nwm }' return false;">글쓰기</button>
			</c:if></td>
	</tr>
</table>

<div style="height:20px"></div>


<table class="table table-lightgray table-hover" style="table-layout: fixed; width:1200px" align="center" cellspacing="0" cellpadding="3" >
	<tr align="center" class="thead-light">
		<th width="100px">글번호</th>
		<th width="400px" colspan="3">제목</th>
		<th width="150px">작성자</th>
		<th width="150px">등록일</th>
		<th width="150px">첨부파일</th>
		<th width="100px">조회수</th>
	</tr>
	
	<c:forEach items="${ list }" var="nlst">
		<tr align="center">
			<td>${ nlst.notice_no }</td>
			<td colspan="3">
				<c:url var="ndetail" value="ndetail.do">
					<c:param name="notice_no" value="${ nlst.notice_no }" />
				</c:url>
				<a href="${ ndetail }">${ nlst.notice_title }</a>
			</td>
			<td>${ nlst.user_id }</td>
			<td>
				<c:if test="${ empty nlst.notice_modify }">
					<fmt:formatDate value="${ nlst.notice_date }" pattern="yyyy.MM.dd." />
				</c:if>
				<c:if test="${ !empty nlst.notice_modify }">
					<fmt:formatDate value="${ nlst.notice_modify }" pattern="yyyy.MM.dd." />
				</c:if>
			</td>
			<td>
	            <c:if test="${ empty nlst.notice_re_file }">
	               &nbsp;
	            </c:if>
	            <c:if test="${ !empty nlst.notice_re_file }">
	               <i class="fas fa-file-download"></i>
	            </c:if>
	         </td>
	         <td>${ nlst.notice_readcount }</td>
         </tr>
	</c:forEach>
		
</table>

<!-- 페이징 처리 -->
<div align="center" style="text-align:center; width:1200px; position:absolute; left:50px;">
   <c:if test="${ currentPage <= 1 }">
      &lt;&lt; &nbsp;
   </c:if>
   <c:if test="${ currentPage > 1 }">
      <c:url var="mpage" value="nlist.do">
         <c:param name="page" value="1" />
      </c:url>
      <a href="${ mpage }">&lt;&lt; &nbsp;</a>
   </c:if>
   
<!-- 이전 그룹으로 이동 처리 -->
<c:if test="${ (currentPage - 10) < startPage and (currentPage - 10) > 1 }">
   <c:url var="mpage2" value="nlist.do">
      <c:param name="page" value="${ startPage - 10 }"/>
   </c:url>
   <a href="${ mpage2 }">&lt; &nbsp;</a>
</c:if>
<c:if test="${ !((currentPage - 10) < startPage and (currentPage - 10) > 1) }">
   &nbsp;&nbsp; &lt; &nbsp;&nbsp;
</c:if>

<!-- 현재 페이지가 속한 페이지그룹의 숫자 출력 처리 -->
<c:forEach var="p" begin="${ startPage }" end="${ endPage }" step="1">
   <c:if test="${ p eq currentPage }">   
      <font weight="bolder" size="4"><b>${ p }</b></font>
   </c:if>
   <c:if test="${ p ne currentPage }">
      <c:url var="mpage3" value="nlist.do">
         <c:param name="page" value="${ p }"/>
      </c:url>
      <a href="${ mpage3 }">${ p }</a>
   </c:if>
</c:forEach>

<!-- 다음 그룹으로 이동 처리 -->
<c:if test="${ (currentPage + 10) > endPage && (currentPage + 10) < maxPage }">
   <c:url var="mpage4" value="nlist.do">
      <c:param name="page" value="${ endPage + 10 }"/>
   </c:url>
   <a href="${ mpage4 }">&gt; &nbsp;</a>
</c:if>
<c:if test="${ !((currentPage + 10) > endPage && (currentPage + 10) < maxPage) }">
   &nbsp;&nbsp; &gt; &nbsp;&nbsp;
</c:if>

<!-- 맨끝 페이지로 이동 처리 -->
<c:if test="${ currentPage >= maxPage }">
   &nbsp; &gt;&gt;
</c:if>   
<c:if test="${ currentPage < maxPage }">
   <c:url var="mpage5" value="nlist.do">
      <c:param name="page" value="${ maxPage }"/>
   </c:url>
   <a href="${ mpage5 }">&nbsp; &gt;&gt;</a>
</c:if>
</div>






<br><br><br><br><br>
<hr style="clear: both;">
<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>




