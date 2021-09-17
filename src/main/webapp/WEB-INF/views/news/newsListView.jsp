<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Whimory</title>
<script type="text/javascript" src="${ pageContext.request.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

function showDiv(item){
	   
	   if($(item).val() == "title"){
	      $("#titleDiv").css("display", "inline-block");
	      $("#contentDiv").css("display", "none");
	      $("#dateDiv").css("display", "none");
	   }
	      
	   if($(item).val() == "content"){
	      $("#titleDiv").css("display", "none");
	      $("#contentDiv").css("display", "inline-block");
	      $("#dateDiv").css("display", "none");
	   }
	      
	   if($(item).val() == "date"){
	      $("#titleDiv").css("display", "none");
	      $("#contentDiv").css("display", "none");
	      $("#dateDiv").css("display", "inline-block");
	   }
}

</script>
</head>
<body>
<c:import url="/WEB-INF/views/common/menubar.jsp" />
<hr>
<h2 align="center">언론 보도</h2>
<table align="center" width="1150px">
   <tr>
      <td align="right">
         <select onchange="showDiv(this)">
            <option value="title">제목</option>
            <option value="content">내용</option>
            <option value="date">작성날짜</option>
         </select>
         <div id="titleDiv" style="display:inline-block">
         <form action="wsearchTitle.do" method="post">
            <input type="search" name="keyword" placeholder="검색어를 입력하세요" style="width: 200px">
            <button type="submit">검색</button>
         </form>
         </div>
         <div id="contentDiv" style="display:none">
         <form action="wsearchContent.do" method="post">
            <input type="search" name="keyword" placeholder="검색어를 입력하세요" style="width: 200px">
            <button type="submit">검색</button>
         </form>
         </div>
         <div id="dateDiv" style="display:none">
         <form action="wsearchDate.do" method="post">
            <input type="date" name="begin"> ~ <input type="date" name="end">
            <button type="submit">검색</button>
         </form>
         </div>
         
      </td>
   </tr>
</table>
<br>
<table class="table table-hover">

<c:forEach items="${ requestScope.list }" var="news">
<tr>

<c:url value="/wdetail.do" var="wdetail">
      <c:param name="news_no" value="${ news.news_no }" />
</c:url>
<c:if test="${ news.news_org_file != null }">
   <td align="center"><a href="${ wdetail }"><img src="${ pageContext.servletContext.contextPath }/resources/news_upfiles/${ news.news_re_file }" style="width:200px;height:200px"></a>
   </td>
</c:if>
<c:if test="${ news.news_org_file == null }">
   <td align="center"><a href="${ wdetail }"><img src="${ pageContext.servletContext.contextPath }/resources/images/logo02.png" style="width:200px;height:200px"></a>
   </td>
</c:if>

<c:url value="/wdetail.do" var="wdetail">
      <c:param name="news_no" value="${ news.news_no }" />
</c:url>
   <td align="center"><a href="${ wdetail }">${ news.news_title }</a>
</td>

</tr>
</c:forEach>
</table>

<br>

<hr>
<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>


    








