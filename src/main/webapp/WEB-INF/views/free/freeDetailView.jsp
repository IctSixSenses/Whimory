<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 

<c:set var="currentPage" value="${ requestScope.currentPage }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Whimory</title>

<!-- Favicons -->
<link href="${ pageContext.request.contextPath }/resources/images/tgmark.png" rel="icon">

<!-- Bootstrap CSS 및 폰트 적용 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Do+Hyeon|Jua|Nanum+Gothic|Sunflower:300" rel="stylesheet">
<script type="text/javascript" src="${ pageContext.request.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
<style type="text/css">
html head{
	font-family: Roboto, Nanum Gothic;
}
html body{
	font-family: Roboto, Nanum Gothic;
} 

table#tbrp, #tbrpli, #tbrpins{
	border-top: 1px solid white;
	border-bottom: 1px solid white;
}
</style>

</head>
<body>
<c:import url="/WEB-INF/views/common/menubar.jsp"/>
<br><br><br><br><br><br><br>

<h3 align="center" style="font-family:Nanum Gothic; font-weight:530; color:#333333;">${ requestScope.free.free_no }번 게시글 상세보기</h3>
<br>

<!-- 수정/삭제 버튼 -->
<table width="1000px" align="center">
	<tr align="right">
		<td colspan="10" align="right">
			<c:if test="${ !empty sessionScope.loginUser }">
				<c:if test="${ loginUser.user_id eq free.user_id }">
				    <c:url var="ubup" value="/fupview.do">
				    	<c:param name="free_no" value="${ free.free_no }"/>
				    	<c:param name="page" value="${ currentPage }"/>
				    </c:url>
				    <button onclick="javascript:location.href='${ ubup }'" class="btn btn-outline-primary">수정하기</button>
				</c:if>
				<c:if test="${ loginUser.user_id eq free.user_id or sessionScope.loginUser.admin_yn eq 'Y'}"> 
				    <c:url var="ubd" value="/fdelete.do">
				    	<c:param name="free_no" value="${ free.free_no }"/>
				    	<c:param name="free_re_file" value="${ free.free_re_file }"/>
				    </c:url>
				    <button onclick="javascript:location.href='${ ubd }'" class="btn btn-outline-danger">삭제하기</button>&nbsp; 
			    </c:if>
			</c:if> 
		</td>
	</tr>
</table>

<!-- 게시글 상세보기 -->
<table class="table" style="table-layout: fixed; width:1000px" align="center" cellspacing="0" cellpadding="3" >
	<tr>
		<td colspan="10" align="center" style="font-size: 17pt; background: WhiteSmoke" >${ free.free_title }</td>
	</tr>
	<tr>
		<td colspan="6"><b>작성자</b> &nbsp; ${ free.user_id }</td>
		<td colspan="4" align="right"> 
			<c:if test="${ free.free_modify eq null }">
				<b>등록일</b> &nbsp;<fmt:formatDate value="${ free.free_date }" pattern="yyyy-MM-dd" />
				 &nbsp;&nbsp;&nbsp;&nbsp; <b>조회수</b>&nbsp;&nbsp;${ free.free_readcount }&nbsp;&nbsp;
			</c:if>
			<c:if test="${ free.free_modify ne null }">
				<b>수정일</b> &nbsp;<fmt:formatDate value="${ free.free_modify }" pattern="yyyy-MM-dd" />
				 &nbsp;&nbsp;&nbsp;&nbsp; <b>조회수</b>&nbsp;&nbsp;${ free.free_readcount }&nbsp;&nbsp;
			</c:if>
		</td>	
	</tr>
	<tr>
		<td colspan="10">
			<c:if test="${ !empty free.free_org_file }">
				<c:url var="ubf" value="/ffdown.do">
					<c:param name="ofile" value="${ free.free_org_file }"/>
					<c:param name="rfile" value="${ free.free_re_file }"/>
				</c:url>		
				<b>첨부파일</b> &nbsp;&nbsp; <a href="${ ubf }">${ free.free_org_file }</a>
			</c:if>
			<c:if test="${ empty free.free_org_file }">
			<b>첨부파일</b> &nbsp;&nbsp;&nbsp;&nbsp;- 
			</c:if>
		</td>
	</tr>
	<tr>
		<th>내용</th>
		<td colspan="9" align="left" height="280px">${ free.free_content }</td>
	</tr>
	<!-- 추천/신고 기능 부분 -->
	<tr>
		<td colspan="9" align="right">
			<c:if test="${ !empty loginUser && loginUser.user_id != free.user_id }">
				<c:url var="flike" value="flike.do">
					<c:param name="free_no" value="${ free.free_no }" />
					<c:param name="user_id" value="${ loginUser.user_id }" />
					<c:param name="page" value="${ currentPage }" />
				</c:url>
				<img src="${ pageContext.request.contextPath }/resources/free_upfiles/like.PNG" onclick="javascript:location.href='${ flike }';" width="28" height="28"> 추천 ${ free.free_like }
			</c:if>
			<c:if test="${ empty loginUser or loginUser.user_id eq free.user_id }">
				<img src="${ pageContext.request.contextPath }/resources/free_upfiles/like.PNG"  width="28" height="28"> 추천 &nbsp;${ free.free_like }&nbsp;&nbsp;
			</c:if>
		</td>
		<td align="center">
			<c:if test="${ !empty loginUser && loginUser.user_id != free.user_id }">
				<c:url var="fbad" value="fbad.do">
					<c:param name="free_no" value="${ free.free_no }" />
					<c:param name="user_id" value="${ loginUser.user_id }" />			
					<c:param name="page" value="${ currentPage }" />
				</c:url>
				<img src="${ pageContext.request.contextPath }/resources/free_upfiles/siren.PNG" onclick="javascript:location.href='${ fbad }';" width="28" height="23"> 신고 ${ free.free_bad }
			</c:if>
			<c:if test="${ empty loginUser or loginUser.user_id eq free.user_id }">
				<img src="${ pageContext.request.contextPath }/resources/free_upfiles/siren.PNG" width="28" height="23"> 신고 &nbsp;${ free.free_bad }
			</c:if>
		</td>
	</tr> 
</table>

<table align="center" width="1000px" height="110px" style="font-size:20px;" id="tbrp" >
	<tr rowspan="2">
		<td colspan="10" align="center">
			<c:url var="ubl" value="/flist.do">  	
			  	<c:param name="page" value="${ currentPage }"/>
			</c:url>
			<button onclick="javascript:location.href='${ ubl }'" class="btn btn-primary">목록보기</button>&nbsp;
		</td> 
	</tr>
	<tr><td align="center">함께 이야기 해봐요😆</td></tr>
</table>

<%-- 댓글 등록 폼 --%>
<c:if test="${ !empty loginUser }">
	<form action="frinsert.do" method="post">
		<input type="hidden" name="page" id="page" value="${ currentPage } ">
		<input type="hidden" name="free_no" id="free_no" value="${ free.free_no }">
		<input type="hidden" name="user_id" id="user_id" value="${ loginUser.user_id }">
		<table class="table" style="table-layout: fixed; width:1000px; border-collapse:collapse;" align="center" cellspacing="0" cellpadding="3" id="tbrpins">
			<tr>
				<td align="center">${ loginUser.user_id }</td>
				<td colspan="8"><textarea rows="3" cols="96" name="free_reply_content" placeholder="댓글을 입력하세요."></textarea></td>	
				<td><input type="submit" value="등록" class="btn btn-outline-primary"></td>
			</tr>
		</table>
	</form>
</c:if>

<!-- 댓글 목록 -->
<table class="table" style="table-layout: fixed; width:1000px" align="center" cellspacing="0" cellpadding="3" id="tbrpli">
	<c:if test="${ frlist.size() > 0 }">
	   <c:forEach items="${ frlist }" var="frli">
			<tr>
				<th align="center">&nbsp;&nbsp;&nbsp;${ frli.user_id }</th>
				<td colspan="6">${ frli.free_reply_content }</td>
				<td colspan="2"><fmt:formatDate value="${ frli.free_reply_date }" pattern="yyyy-MM-dd hh:mm:ss" /></td>	
				<c:if test="${ loginUser.user_id eq frli.user_id or loginUser.admin_yn eq 'Y'}"> 
					<td>
						<c:url var="frdel" value="/frdelete.do">
							<c:param name="page" value="${ currentPage } "/>
					    	<c:param name="free_no" value="${ frli.free_no }"/>
					    	<c:param name="free_reply_no" value="${ frli.free_reply_no }"/>
					    </c:url>
					    <button onclick="javascript:location.href='${ frdel }'" class="btn btn-outline-danger">삭제</button>&nbsp; 
					</td>
				</c:if>
			</tr>
		</c:forEach>
	</c:if>
	<c:if test="${ frlist.size() == 0 }">
	      <tr>
	         <td align="center"><font size="4"><b>등록된 댓글이 없습니다. 댓글을 등록해주세요:D</b></font></td>
	      </tr>
	</c:if>
</table>


<br><br><br><br><br>
<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>