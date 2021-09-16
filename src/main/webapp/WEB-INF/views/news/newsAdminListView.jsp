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
<script type="text/javascript">
function showWriteForm(){
   location.href = "${ pageContext.servletContext.contextPath }/wwform.do";
}

</script>
</head>
<body>
<c:import url="/WEB-INF/views/common/menubar.jsp" />
<hr>
<h2 align="center">언론 보도</h2>
<div style="align:center;text-align:center;">
      <button onclick="showWriteForm();">글쓰기</button>
   </div>
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


    








