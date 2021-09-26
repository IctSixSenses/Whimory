<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- model에 담긴 변수 다 꺼내옴 -->
<c:set var="listCount" value="${ requestScope.listCount }" />
<c:set var="startPage" value="${ requestScope.startPage }" />
<c:set var="endPage" value="${ requestScope.endPage }" />
<c:set var="maxPage" value="${ requestScope.maxPage }" />
<c:set var="currentPage" value="${ requestScope.currentPage }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Whimory</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/css/bootstrap-select.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA==" crossorigin="anonymous" />
<script type="text/javascript" src="${ pageContext.request.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
<!-- Bootstrap CSS -->
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Do+Hyeon|Jua|Nanum+Gothic|Sunflower:300" rel="stylesheet">
<style type="text/css">
html head{
	font-family: Roboto, Nanum Gothic;
}
html body{
	font-family: Roboto, Nanum Gothic;
} 
table tr td a { text-decoration:none } 
</style>
<script type="text/javascript">
function showWriteForm(){
   location.href = "${ pageContext.servletContext.contextPath }/qwform.do";
}

function goLogin(){
	alert("로그인 후 이용 가능한 서비스입니다.\n로그인 페이지로 이동합니다.");   
	   location.href = "${ pageContext.servletContext.contextPath }/loginPage.do";
   }
   
function showDiv(item){
   
   if($(item).val() == "writer"){
      $("#writerDiv").css("display", "inline-block");
      $("#titleDiv").css("display", "none");
      $("#categoryDiv").css("display", "none");
      $("#dateDiv").css("display", "none");
   }
   
   if($(item).val() == "title"){
      $("#writerDiv").css("display", "none");
      $("#titleDiv").css("display", "inline-block");
      $("#categoryDiv").css("display", "none");
      $("#dateDiv").css("display", "none");
   }
      
   if($(item).val() == "category"){
      $("#writerDiv").css("display", "none");
      $("#titleDiv").css("display", "none");
      $("#categoryDiv").css("display", "inline-block");
      $("#dateDiv").css("display", "none");
   }
      
   if($(item).val() == "date"){
      $("#writerDiv").css("display", "none");
      $("#titleDiv").css("display", "none");
      $("#categoryDiv").css("display", "none");
      $("#dateDiv").css("display", "inline-block");
   }
}

</script>
</head>
<body>
<c:import url="/WEB-INF/views/common/menubar.jsp" />
<hr>
<c:import url="/WEB-INF/views/common/menubarA.jsp"></c:import>
<h2 align="center">나의 1대1 문의 내역</h2>
<table align="center" width="1150px">
   <tr>
      <td align="right">
         <select onchange="showDiv(this)">
            <option value="writer">작성자</option>
            <option value="title">제목</option>
            <option value="category">질문분류</option>
            <option value="date">작성날짜</option>
         </select>
         <div id="writerDiv" style="display:inline-block">
         <form action="qsearchWriter.do" method="post">
            <input type="search" name="keyword" placeholder="검색어를 입력하세요" style="width: 200px">
            <button type="submit">검색</button>
         </form>
         </div>
         <div id="titleDiv" style="display:none">
         <form action="qsearchTitle.do" method="post">
            <input type="search" name="keyword" placeholder="검색어를 입력하세요" style="width: 200px">
            <button type="submit">검색</button>
         </form>
         </div>
         <div id="categoryDiv" style="display:none">
         <form action="qsearchCategory.do" method="post">
            <input type="search" name="keyword" placeholder="검색어를 입력하세요" style="width: 200px">
            <button type="submit">검색</button>
         </form>
         </div>
         <div id="dateDiv" style="display:none">
         <form action="qsearchDate.do" method="post">
            <input type="date" name="begin"> ~ <input type="date" name="end">
            <button type="submit">검색</button>
         </form>
         </div>
         
      </td>
   </tr>
</table>
<!-- 게시글 쓰기(등록)은 로그인한 회원만 가능함 -->
<c:if test="${ empty sessionScope.loginUser }">
   <div style="align:center;text-align:center;">
      <button onclick="goLogin();" class="btn btn-outline-primary">글쓰기</button>
   </div>
</c:if>

<c:if test="${ !empty sessionScope.loginUser }">
   <div style="align:center;text-align:center;">
      <button onclick="showWriteForm();" class="btn btn-outline-primary">글쓰기</button>
   </div>
</c:if>
<br>
<table class="table table-lightgray table-hover" style="table-layout: fixed; width:1200px" align="center" cellspacing="0" cellpadding="3" >
	<thead>
		<tr align="center" class="thead-light">
			<th width="100px">작성자</th>
			<th width="200px">질문 분류</th>
			<th width="700px">제목</th>
			<th width="120px">작성일</th>
			<th width="80px">답변여부</th>
		</tr>
	</thead>
	
	<c:forEach items="${ requestScope.list }" var="q">
		<tr align="center">
			<td>${ q.user_id }</td>
			<td>${  q.qq_category }</td>	
		   <!-- 글 쓴 회원과 로그인 회원이 일치해야 상세보기할 수 있게 함 -->
			<c:if test="${ !empty sessionScope.loginUser and sessionScope.loginUser.user_id eq q.user_id }">
		   		<c:url var="qdetail" value="qdetail.do">
		      		<c:param name="qq_no" value="${ q.qq_no }"/>
		      		<c:param name="page" value="${ currentPage }" />
		   		</c:url>
		   		<td align="center"><a href="${ qdetail }">${ q.qq_title }</a></td>
			</c:if>
			<c:if test="${ empty sessionScope.loginUser or sessionScope.loginUser.user_id ne q.user_id }">
	 			<td align="center">${ q.qq_title }</td>
			</c:if>
		   
			<td align="center">
			<fmt:formatDate value="${  q.qq_date }" type="date" pattern="yyyy-MM-dd" /></td>
		
			<td align="center">${  q.qq_yn }</td>
		
		
		</tr>
	</c:forEach>
</table>

<%-- </td>

<c:url value="/qdetail.do" var="qdetail">
      <c:param name="qq_no" value="${ q.qq_no }" />
   </c:url>
   <td align="center"><a href="${ qdetail }">${ q.qq_title }</a></td> --%>



<br>
<!-- 페이징 처리 -->
<div style="text-align:center;">
<c:if test="${ currentPage <= 1 }">
   [맨처음]&nbsp;
</c:if>
<c:if test="${ currentPage > 1 }">
   <c:url var="ubl" value="/qlist.do">
      <c:param name="page" value="1" />
   </c:url>
   <a href="${ ubl }">[맨처음]</a>
</c:if>
<!-- 이전 그룹으로 이동 처리 -->
<c:if test="${ (currentPage - 10) < startPage and (currentPage - 10) > 1 }">
   <c:url var="ubl2" value="/qlist.do">
      <c:param name="page" value="${ startPage - 10 }"/>
   </c:url>
   <a href="${ ubl2 }">[이전그룹]</a>
</c:if>
<c:if test="${ !((currentPage - 10) < startPage and (currentPage - 10) > 1) }">
   [이전그룹]&nbsp;
</c:if>
<!-- 현재 페이지가 속한 페이지그룹의 숫자 출력 처리 -->
<c:forEach var="p" begin="${ startPage }" end="${ endPage }" step="1">
   <c:if test="${ p eq currentPage }">   
      <font color="red" size="4"><b>[${ p }]</b></font>
   </c:if>
   <c:if test="${ p ne currentPage }">
      <c:url var="ubl3" value="/qlist.do">
         <c:param name="page" value="${ p }"/>
      </c:url>
      <a href="${ ubl3 }">${ p }</a>
   </c:if>
</c:forEach>
<!-- 다음 그룹으로 이동 처리 -->
<c:if test="${ (currentPage + 10) > endPage && (currentPage + 10) < maxPage }">
   <c:url var="ubl4" value="/qlist.do">
      <c:param name="page" value="${ endPage + 10 }"/>
   </c:url>
   <a href="${ ubl4 }">[다음그룹]</a>
</c:if>
<c:if test="${ !((currentPage + 10) > endPage && (currentPage + 10) < maxPage) }">
   [다음그룹]&nbsp;
</c:if>
<!-- 맨끝 페이지로 이동 처리 -->
<c:if test="${ currentPage >= maxPage }">
   [맨끝]&nbsp;
</c:if>   
<c:if test="${ currentPage < maxPage }">
   <c:url var="ubl5" value="/qlist.do">
      <c:param name="page" value="${ maxPage }"/>
   </c:url>
   <a href="${ ubl5 }">[맨끝]</a>
</c:if>
</div>
<hr>
<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>


    







