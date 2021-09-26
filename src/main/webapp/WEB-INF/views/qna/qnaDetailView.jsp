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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
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
<script type="text/javascript" src="${ pageContext.request.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
</head>
<body>
<c:import url="../common/menubar.jsp" />


<h2 align="center">질문했어요!</h2><br>

<table class="table" style="table-layout: fixed; width:1000px" align="center" cellspacing="0" cellpadding="3" >
	<tr>
		<th>작성자</th>
		<td colspan="9">${ question.user_id }</td>
	</tr>
	<tr>
		<th>질문 분류</th>
		<td colspan="9">${ question.qq_category }</td>
	</tr>
	<tr>
		<th>제목</th>
		<td colspan="9">${ question.qq_title }</td>
	</tr>
	<tr>
		<th align="right">첨부파일</th>
		<td colspan="9">
			<c:if test="${ !empty question.qq_org_file }">
					<c:url var="qdown" value="/qfdown.do">
						<c:param name="ofile" value="${ question.qq_org_file }" />
						<c:param name="rfile" value="${ question.qq_re_file }" />
					</c:url>
					<a href="${ qdown }">${ question.qq_org_file }</a>
			</c:if>
			<c:if test="${ empty question.qq_org_file }">
					&nbsp;
			</c:if>
		</td>
	</tr>
	<tr>
		<th>내용</th>
		<td colspan="9" height="280px">${ question.qq_content }</td>
	</tr>
</table>

<table width="1000px" align="center">
	<tr>
		<td colspan="10" align="center">
		
		<%-- 삭제하기 버튼 --%>
		<c:url var="qdelete" value="/qdelete.do">
   			<c:param name="qq_no" value="${ question.qq_no }" />
   			<c:if test="${ !empty question.qq_org_file }">
      			<c:param name="rfile" value="${ question.qq_re_file }" />
   			</c:if>
		</c:url>
		<button onclick="javascript:location.href='${ qdelete }';" class="btn btn-outline-danger">삭제하기</button> &nbsp; 
		
		<%-- 이전페이지로 이동 --%>
		<button onclick="javascript:history.go(-1);" class="btn btn-primary">목록보기</button> &nbsp;
		
		<%-- 수정페이지로 이동 버튼 --%>
		<c:url var="qupdate" value="/qupview.do">
  			<c:param name="qq_no" value="${ question.qq_no }" />
		</c:url>
		<button onclick="javascript:location.href='${ qupdate }';" class="btn btn-outline-primary">수정하기</button>  

		</td>
	</tr>		
</table>
<hr>
<!-- 댓글 목록 -->
<table class="table" style="table-layout: fixed; width:1000px" align="center" cellspacing="0" cellpadding="3" id="tbrpli">
   
      <c:if test="${ alist.size() > 0 }">
   <c:forEach items="${ alist }" var="ali">
      <tr>
         <th colspan="2" align="center">&nbsp;&nbsp;&nbsp;${ ali.user_id }</th>
            <td colspan="12">${ ali.qa_content }</td>   
            <td colspan="2">${ ali.qa_date }</td>   
      </tr>
     </c:forEach>
   </c:if>
   
   <c:if test="${ alist.size() == 0 }">
      <tr>
         <td>답변이 아직 등록되어 있지 않습니다. 조금만 기다려주시면 감사하겠습니다. :D</td>
      </tr>
   </c:if>
 
</table>





<hr>
<c:import url="../common/footer.jsp" />
</body>
</html>