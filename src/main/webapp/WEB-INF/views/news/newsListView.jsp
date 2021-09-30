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
   text-decoration: none;
   color: black;
}

table tr td a:hover, div a:hover {
   color: black;
   text-decoration: underline;
}
</style> 
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
function resetList(){
	location.href="${ pageContext.servletContext.contextPath }/wlist.do";
}
</script>
</head>
<body>
<c:import url="/WEB-INF/views/common/menubar.jsp" />
<br><br><br><br><br><br><br>
<h2 align="center" style="font-family:Nanum Gothic; font-weight:630; color:#333333;">언론 보도</h2>
<table align="center" width="1000px">
   <tr>
      <td colspan="3" align="left"><h5 style="font-size:15pt; font-family:Nanum Gothic; font-weight:550; color:#333333;">언론보도 전체 목록</h5></td>
      <td colspan="7" align="right">
         <div style="float: left; width: 50%;">
         <select class="form-control" onchange="showDiv(this)" style="width:90px; display:inline-block">
            <option value="title">제목</option>
            <option value="content">내용</option>
            <option value="date">작성날짜</option>
         </select>
        </div>
         <div id="titleDiv" style="display:inline-block; float: left; width: 40%;">
         <form action="wsearchTitle.do" method="post">
            <input type="search" name="keyword" placeholder="검색어를 입력하세요" style="width: 230px; float: left;" class="form-control">
            <button type="submit" class="btn btn-outline-primary">검색</button>
            <input type="reset" onclick="resetList(); return false;" class="btn btn-primary" value="전체 목록">
         </form>
         </div>
         <div id="contentDiv" style="display:none; float: left; width: 40%;">
         <form action="wsearchContent.do" method="post">
            <input type="search" name="keyword" placeholder="검색어를 입력하세요" style="width: 230px; float: left;" class="form-control">
            <button type="submit" class="btn btn-outline-primary">검색</button>
            <input type="reset" onclick="resetList(); return false;" class="btn btn-primary" value="전체 목록">
         </form>
         </div>
         <div id="dateDiv" style="display:none; float: left; width: 40%;">
         <form action="wsearchDate.do" method="post">
            <input type="date" name="begin"> ~ <input type="date" name="end">
            <button type="submit" class="btn btn-outline-primary">검색</button>
            <input type="reset" onclick="resetList(); return false;" class="btn btn-primary" value="전체 목록">
         </form>
         </div>
      </td>
      
   </tr>
</table>

<table class="table table-lightgray table-hover" style="table-layout: fixed; width:1000px" align="center" cellspacing="0" cellpadding="3">

   <c:forEach items="${ requestScope.list }" var="news">
      <input type="hidden" id="news_no" value="${ news.news_no }">
      <tr align="center">
         <c:url value="/wdetail.do" var="wdetail">
               <c:param name="news_no" value="${ news.news_no }" />
         </c:url>
         
         <c:if test="${ news.news_org_file != null }">
               <td colspan="3" align="center"><a href="${ wdetail }"><img src="${ pageContext.servletContext.contextPath }/resources/news_upfiles/${ news.news_re_file }" style="width:250px;height:180px"></a></td>
         </c:if>
         <c:if test="${ news.news_org_file == null }">
               <td colspan="3" align="center"><a href="${ wdetail }"><img src="${ pageContext.servletContext.contextPath }/resources/images/logo02.png" style="width:250px;height:180px"></a></td>
         </c:if>
   
   
         <c:url value="/wdetail.do" var="wdetail">
            <c:param name="news_no" value="${ news.news_no }" />
         </c:url>
              <td colspan="7" align="left" style="font-size:16pt;"><a href="${ wdetail }">${ news.news_title }</a></td>
      
      </tr>
   </c:forEach>
</table>

<br><br><br><br>
<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>


    







