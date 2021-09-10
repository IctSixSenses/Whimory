<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <c:set var="currentPage" value="${ requestScope.currentPage }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Whimory</title>
</head>
<body>
<c:import url="../common/menubar.jsp" />
<hr>

<h2 align="center">언론 보도</h2><br>

<table align="center" width="1000" border="1" cellspacing="5" cellpadding="10">
<tr><td>${ news.news_title }</td></tr> <br>
<tr><td>${ news.news_date }</td></tr> <br>

<c:if test="${ news.news_org_file != null }">
<tr><td><img src="${ pageContext.servletContext.contextPath }/resources/images/${ news.news_org_file }" style="width:230px;height:300px"></td></tr> <br>
</c:if>
<c:if test="${ news.news_org_file == null }">
</c:if>

<tr><td>${ news.news_content }</td></tr> <br>
<tr><td>보도일 &nbsp; ${ news.news_at_date }</td></tr> <br>
<tr><td>원본 출처 :  <a href="${ news.news_link }">${ news.news_link }</a></td></tr> <br>

<tr><th colspan="2">

<%-- 수정페이지로 이동 버튼 --%>
<c:url var="wupdate" value="/wupmove.do">
   <c:param name="news_no" value="${ news.news_no }" />
</c:url>
<button onclick="javascript:location.href='${ wupdate }';">수정하기</button> &nbsp; 

<%-- 삭제하기 버튼 --%>
<c:url var="wdelete" value="/wdelete.do">
   <c:param name="news_no" value="${ news.news_no }" />
   <c:if test="${ !empty news.news_org_file }">
      <c:param name="rfile" value="${ news.news_re_file }" />
   </c:if>
</c:url>
<button onclick="javascript:location.href='${ wdelete }';">삭제하기</button> &nbsp; 

<%-- 이전페이지로 이동 --%>
<button onclick="javascript:history.go(-1);">목록보기</button></th></tr>

</table>





<hr>
<c:import url="../common/footer.jsp" />
</body>
</html>