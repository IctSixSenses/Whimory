<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Whimory Login</title>


<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
	<!-- 카카오 로그인 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

<script type="text/javascript">
function kakaoLoginPro(response){
	var data = {id:response.id,email:response.kakao_account.email}
	$.ajax({
		type : 'POST',
		url : '/user/kakaoLoginPro.do',
		data : data,
		dataType : 'json',
		success : function(data){
			console.log(data)
			if(data.JavaData == "YES"){
				alert("로그인되었습니다.");
				location.href = '/user/usermain.do'
			}else if(data.JavaData == "register"){
				$("#kakaoEmail").val(response.kakao_account.email);
				$("#kakaoId").val(response.id);
				$("#kakaoForm").submit();
			}else{
				alert("로그인에 실패했습니다");
			}
			
		},
		error: function(xhr, status, error){
			alert("로그인에 실패했습니다."+error);
		}
	});
}
</script>

<script type="text/javascript"
	src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
	
	<script type="text/javascript">
	//로그인 페이지로 이동
	function movePage() {
		location.href = "loginPage.do";
	}
	
	//회원 가입 페이지로 이동
	function movePage2() {
		location.href = "enroll.do";
	}
	
	//아이디 비밀번호 찾기
	function movePage3(){
		location.href = "findaccount.do";
	}
	
	function movePage4(){
		location.href = "kakao.do";
	}
	</script>

<style>
.send-button{
background: #01b1d7;
border: 1px solid #fff;
border-radius: 5px;
width:300px;
font-weight: 600;
color:#000;
padding: 8px 25px;
}
.f-button{
color: #000 !important;
border: 1px solid #fff;
border-radius: 5px;
background: #fff !important;
width:300px;
font-weight: 600;
color:#fff;
padding: 8px 25px;
margin-bottom: 10px;
}
.e-button{
color: #000 !important;
border: 1px solid #fff;
border-radius: 5px;
background: #87CEFA !important;
width:300px;
font-weight: 600;
color:#fff;
padding: 8px 25px;
margin-bottom: 10px;
}
.my-input{
box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.1);
cursor: text;
padding: 8px 10px;
margin-bottom: 20px;
transition: border .1s linear;
}
.header-title{
margin: 5rem 0;
}
h1{
font-size: 31px;
line-height: 40px;
font-weight: 600;
color:#4c5357;
}
h2{
color: #5e8396;
font-size: 21px;
line-height: 32px;
font-weight: 400;
}
.login-or {
position: relative;
color: #aaa;
margin-top: 10px;
margin-bottom: 10px;
padding-top: 10px;
padding-bottom: 10px;
}
.span-or {
display: block;
position: absolute;
left: 50%;
top: -2px;
margin-left: -25px;
background-color: #fff;
width: 50px;
text-align: center;
}
.hr-or {
height: 1px;
margin-top: 0px !important;
margin-bottom: 0px !important;
}
@media screen and (max-width:480px){
h1{
font-size: 26px;
}
h2{
font-size: 20px;
}
}
</style>
</head>
<body>
<c:import url="/WEB-INF/views/common/menubar.jsp" />
<br><br><br><br><br><br><br>
<!-- 로그인 창 -->
<!-- <div id="login" align="center">
<form action="login.do" method="post">
<label>아이디 : <input type="text" name="user_id"></label><br><br>
<label>비밀번호 : <input type="password" name="user_pwd"></label><br><br>
<input class="btn btn-outline-primary" type= "submit" value = "로그인">
</form>
<br>
회원가입 버튼
		<button class="btn btn-outline-success" onclick="movePage2();">회원가입</button>
<br>
	카카오 로그인 버튼
	<hr>
	<form class="d-flex" style="align:center">
		<button class="btn btn-outline-success" onclick="movePage4()">카카오로그인</button>
	</form>
	
</div> -->

<div class="container">
      <div class="col-md-6 mx-auto text-center">
         <div class="header-title">
            <h1 class="wv-heading--title">
               휘모리(Whimory) 로그인
            </h1>
            <h2 class="wv-heading--subtitle">
               
            </h2>
         </div>
      </div>
      <div class="row">
         <div class="col-md-4 mx-auto">
            <div class="myform form ">
            <!-- 로그인 창 -->
               <form action="login.do" method="post">
                  <div class="form-group">
                     <input type="text" name="user_id" class="form-control my-input" id="userid" placeholder="ID" />
                  </div>
                  <div class="form-group">
                     <input type="password" name="user_pwd" class="form-control my-input" id="userpwd" placeholder="Password" />
                  </div>
                  <div class="text-center">
                     <button type="submit" class="send-button">로그인</button>
                  </div>
                  <div class="col-md-12 ">
                     <div class="login-or">
                        <hr class="hr-or">
                        <span class="span-or">or</span>
                     </div>
                  </div>
                  <div class="form-group text-center">
                  <!-- 회원가입 & 카카오톡 로그인 버튼 -->
                  	 <button class="f-button" href="findaccount.do">아이디 & 비밀번호 찾기</button>
                  	 <button class="e-button" href="enrollPage.do">회원가입</button>
                     <a href="kakao.do"><img src='${ pageContext.servletContext.contextPath }/resources/images/kakao_login_medium_wide.png'></a>
                  </div>
                  <p class="small mt-3">By signing up, you are indicating that you have read and agree to the <a href="#" class="ps-hero__content__link">Terms of Use</a> and <a href="#">Privacy Policy</a>.
                  </p>
               </form>
            </div>
         </div>
      </div>
   </div>


<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>