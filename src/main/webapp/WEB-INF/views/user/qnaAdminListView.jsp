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
table tr td a, div a { 
	text-decoration:none;
	color: black; 
} 
</style>
<script type="text/javascript"> 
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
<br><br><br><br><br><br><br>
<c:import url="/WEB-INF/views/common/menubarA.jsp" />

<h2 align="center" style="font-family:Nanum Gothic; font-weight:630; color:#333333;">문의 내역 확인</h2>
<br>
<table align="center" width="1200px">
   <tr>
      <td colspan="3"><h5 style="font-family:Nanum Gothic; font-weight:550; color:#333333;">총 질문 개수 : ${ listCount }</h5></td>
      <td colspan="7" align="right">
         <div style="float: left; width: 50%;">
         <select class="form-control" onchange="showDiv(this)" style="width:80px; display:inline-block">
            <option value="writer">작성자</option>
            <option value="title">제목</option>
            <option value="category">질문분류</option>
            <option value="date">작성날짜</option>
         </select>
        </div>
         <div id="writerDiv" style="display:inline-block; float: left; ">
         <form action="qsearchWritera.do" method="get">
            <input type="search" name="keyword" placeholder="검색어를 입력하세요" style="width: 250px; float: left;" class="form-control">
            <button type="submit" class="btn btn-outline-primary">검색</button>
         </form>
         </div>
         <div id="titleDiv" style="display:none; float: left;">
         <form action="qsearchTitlea.do" method="get">
            <input type="search" name="keyword" placeholder="검색어를 입력하세요" style="width: 250px; float: left;" class="form-control">
            <button type="submit" class="btn btn-outline-primary">검색</button>
         </form>
         </div>
         <div id="categoryDiv" style="display:none; float: left;">
         <form action="qsearchCategorya.do" method="get">
            <input type="search" name="keyword" placeholder="검색어를 입력하세요" style="width: 250px; float: left;" class="form-control">
            <button type="submit" class="btn btn-outline-primary">검색</button>
         </form>
         </div>
         <div id="dateDiv" style="display:none; float: left;">
         <form action="qsearchDatea.do" method="get">
            <input type="date" name="begin"> ~ <input type="date" name="end">
            <button type="submit" class="btn btn-outline-primary">검색</button>
         </form>
         </div>
         
      </td>
   </tr>
</table>

<br>
<table class="table table-lightgray table-hover" style="table-layout: fixed; width:1050px" align="center" cellspacing="0" cellpadding="3" >
	<thead>
		<tr align="center" class="thead-light">
			<th width="100px">작성자</th>
			<th width="220px">질문 분류</th>
			<th width="530px">제목</th>
			<th width="120px">작성일</th>
			<th width="80px">답변여부</th>
		</tr>
	</thead>
	
	<c:forEach items="${ requestScope.list }" var="q">
		<tr align="center">
			<td>${ q.user_id }</td>
			<td>${  q.qq_category }</td>	
		   <!-- 관리자는 글을 다 볼수있음 -->
			<c:if test="${ !empty sessionScope.loginUser and sessionScope.loginUser.admin_yn eq 'Y' }">
		   		<c:url var="qdetail" value="qdetail.do">
		      		<c:param name="qq_no" value="${ q.qq_no }"/>
		      		<c:param name="page" value="${ currentPage }" />
		   		</c:url>
		   		<td align="left"><a href="${ qdetail }">${ q.qq_title }</a></td>
			</c:if>
		<!-- 	<c:if test="${ empty sessionScope.loginUser or sessionScope.loginUser.user_id ne q.user_id }">
	 			<td align="center">${ q.qq_title }</td>
			</c:if>
		   -->
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
   &lt;&lt; &nbsp;
</c:if>
<c:if test="${ currentPage > 1 }">
   <c:url var="ubl" value="/qlista.do">
      <c:param name="page" value="1" />
   </c:url>
   <a href="${ ubl }">&lt;&lt;</a> &nbsp;
</c:if>
<!-- 이전 그룹으로 이동 처리 -->
<c:if test="${ (currentPage - 10) < startPage and (currentPage - 10) > 1 }">
   <c:url var="ubl2" value="/qlista.do">
      <c:param name="page" value="${ startPage - 10 }"/>
   </c:url>
   <a href="${ ubl2 }">&lt;</a> &nbsp;
</c:if>
<c:if test="${ !((currentPage - 10) < startPage and (currentPage - 10) > 1) }">
   &nbsp;&nbsp; &lt; &nbsp;&nbsp;
</c:if>
<!-- 현재 페이지가 속한 페이지그룹의 숫자 출력 처리 -->
<c:forEach var="p" begin="${ startPage }" end="${ endPage }">
   <c:if test="${ p eq currentPage }">   
      <font weight="bolder" size="4"><b>${ p }</b></font>
   </c:if>
   <c:if test="${ p ne currentPage }">
      <c:url var="ubl3" value="/qlista.do">
         <c:param name="page" value="${ p }"/>
      </c:url>
      <a href="${ ubl3 }">${ p }</a>
   </c:if>
</c:forEach>
<!-- 다음 그룹으로 이동 처리 -->
<c:if test="${ (currentPage + 10) > endPage && (currentPage + 10) < maxPage }">
   <c:url var="ubl4" value="/qlista.do">
      <c:param name="page" value="${ endPage + 10 }"/>
   </c:url>
   <a href="${ ubl4 }">&gt;</a> &nbsp;
</c:if>
<c:if test="${ !((currentPage + 10) > endPage && (currentPage + 10) < maxPage) }">
   &nbsp;&nbsp; &gt; &nbsp;&nbsp;
</c:if>
<!-- 맨끝 페이지로 이동 처리 -->
<c:if test="${ currentPage >= maxPage }">
   &nbsp; &gt;&gt;
</c:if>   
<c:if test="${ currentPage < maxPage }">
   <c:url var="ubl5" value="/qlista.do">
      <c:param name="page" value="${ maxPage }"/>
   </c:url>
   <a href="${ ubl5 }">&gt;&gt;</a>
</c:if>
</div>
<br><br><br><br>

<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>


    







