<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Whimory</title>
<style type="text/css"> 
table tr td a { text-decoration:none } 
</style> 
<link rel="stylesheet"
	  href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">

<script type="text/javascript">
function moveLoginPage(){
	alert("로그인 후 이용 가능한 서비스입니다.\n로그인 페이지로 이동합니다.");	
	location.href = "${ pageContext.servletContext.contextPath }/loginPage.do";
}
function showWriteForm(){
   location.href = "${ pageContext.servletContext.contextPath }/fwform.do";
}

function freeDel(){
	var answer;
	
	answer = confirm("게시글을 정말 삭제하시겠습니까?\n삭제 후 복구가 불가능합니다.");
	
	if(answer == true){
		location.href = "${ pageContext.servletContext.contextPath }/fdelete.do";
	}
}

</script>
</head>
<body>
<c:import url="/WEB-INF/views/common/menubar.jsp" />
<hr>
<h2 align="center">자유 토론 공간</h2>
<br>
<!-- 로그인 여부에 따라 로그인페이지/게시글 작성 페이지로 이동, 관리자는 작성 x -->
<c:if test="${ empty sessionScope.loginUser }">
	<div style="align:center;text-align:center;">
    	<button onclick="moveLoginPage();">게시글 작성</button>
    </div>
</c:if>
<c:if test="${ !empty sessionScope.loginUser and sessionScope.loginUser.admin_yn eq 'N' }">
	<div style="align:center;text-align:center;">
		<button onclick="showWriteForm();">게시글 작성</button>
	</div>
</c:if>
<br>

<table align="center" width="1150px">
	<tr>
		<td><h5>총 게시글 갯수 : ${ listCount }</h5></td>
		<td align="right">
			<form action="">
				<input type="search" name="keyword" placeholder="검색어를 입력하세요" style="width: 200px">
				<button type="submit">검색</button>
			</form>
		</td>
	</tr>
</table>
<div style="height:10px"></div>

<table class="table table-lightgray" style="table-layout: fixed; width:1200px" align="center" cellspacing="0" cellpadding="3" >
	<thead>
		<tr align="center" class="thead-light">
			<th width="50px">번호</th>
			<th width="300px" colspan="3">제목</th>
			<th width="120px">작성자</th>
			<th width="150px">등록일</th>
			<th width="100px">첨부파일</th>
			<th width="100px">조회수</th>
			<th width="100px">추천수</th>
			<th width="100px">신고수</th>
			<th width="120px">
				<c:if test="${ loginUser.admin_yn eq 'Y' }">삭제여부</c:if>
			</th>
		</tr>
	</thead>	
	<c:forEach items="${ list }" var="li">
		<input type="hidden" id="free_no" value="${ li.free_no }">
		<input type="hidden" id="free_re_file" value="${ li.free_re_file }">
		<tr align="center">
			<td>${ li.free_no }</td>
			<td colspan="3" align="left">
				<c:url var="fdetail" value="fdetail.do">
					<c:param name="free_no" value="${ li.free_no }" />
					<c:param name="page" value="${ currentPage }" />
				</c:url>
				<a href="${ fdetail }">&nbsp;&nbsp;${ li.free_title }</a>
			</td>
			<td>${ li.user_id }</td>
			<td>${ li.free_date }</td>
			<td>
				<c:if test="${ !empty li.free_re_file }">
					v
				</c:if>
				<c:if test="${ empty li.free_re_file }">
					&nbsp;
				</c:if>
			</td>
			<td>${ li.free_readcount }</td>
			<td>${ li.free_like }</td>
			<td>${ li.free_bad }</td>
			<td>
				<c:if test="${ loginUser.admin_yn eq 'Y' }">
					<button type="button" class="btn btn-outline-primary" onclick="freeDel();" >
                    	<font style="vertical-align: inherit;">삭제</font>
                    </button>

				</c:if>
			</td>
		</tr>
	</c:forEach>
</table>
<br>



<!-- 페이징 처리 -->
<div style="text-align:center;">
   <c:if test="${ currentPage <= 1 }">
      [맨처음]
   </c:if>
   <c:if test="${ currentPage > 1 }">
      <c:url var="ubl" value="/flist.do">
         <c:param name="page" value="1" />
      </c:url>
      <a href="${ ubl }">[맨처음]</a>
   </c:if>
   
<!-- 이전 그룹으로 이동 처리 -->
<c:if test="${ (currentPage - 10) < startPage and (currentPage - 10) > 1 }">
   <c:url var="ubl2" value="/flist.do">
      <c:param name="page" value="${ startPage - 10 }"/>
   </c:url>
   <a href="${ ubl2 }">이전그룹</a>
</c:if>
<c:if test="${ !((currentPage - 10) < startPage and (currentPage - 10) > 1) }">
   &nbsp;&nbsp;이전그룹&nbsp;&nbsp;
</c:if>

<!-- 현재 페이지가 속한 페이지그룹의 숫자 출력 처리 -->
<c:forEach var="p" begin="${ startPage }" end="${ endPage }" step="1">
   <c:if test="${ p eq currentPage }">   
      <font weight="bolder" size="4"><b>${ p }</b></font>
   </c:if>
   <c:if test="${ p ne currentPage }">
      <c:url var="ubl3" value="/flist.do">
         <c:param name="page" value="${ p }"/>
      </c:url>
      <a href="${ ubl3 }">${ p }</a>
   </c:if>
</c:forEach>

<!-- 다음 그룹으로 이동 처리 -->
<c:if test="${ (currentPage + 10) > endPage && (currentPage + 10) < maxPage }">
   <c:url var="ubl4" value="/flist.do">
      <c:param name="page" value="${ endPage + 10 }"/>
   </c:url>
   <a href="${ ubl4 }">다음그룹</a>
</c:if>
<c:if test="${ !((currentPage + 10) > endPage && (currentPage + 10) < maxPage) }">
   &nbsp;&nbsp;다음그룹&nbsp;&nbsp;
</c:if>

<!-- 맨끝 페이지로 이동 처리 -->
<c:if test="${ currentPage >= maxPage }">
   [맨끝]
</c:if>   
<c:if test="${ currentPage < maxPage }">
   <c:url var="ubl5" value="/flist.do">
      <c:param name="page" value="${ maxPage }"/>
   </c:url>
   <a href="${ ubl5 }">[맨끝]</a>
</c:if>
</div>


<hr>
<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>