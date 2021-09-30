<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Whimory Login</title>

<!-- Favicons -->
<link href="${ pageContext.request.contextPath }/resources/images/tgmark.png" rel="icon">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<!-- 폰트 적용 -->
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Do+Hyeon|Jua|Nanum+Gothic|Sunflower:300" rel="stylesheet">	

<script type="text/javascript" src="${ pageContext.request.contextPath }/resources/js/jquery-3.6.0.min.js"></script>

<!-- 카카오 로그인 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript">

function kakaoLogin() {

    $.ajax({
        url: '${ pageContext.servletContext.contextPath }/loginGetKakaoAuthUrl.do',
        type: 'get',
        async: false,
        dataType: 'text',
        success: function (res) {
            location.href = res;
        }
    });

  }


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
font-family: Roboto, Nanum Gothic;
background: skyblue;
border: 1px solid #fff;
border-radius: 5px;
width:300px;
font-weight: 600;
color:#fff;
padding: 8px 25px;
}
.f-button{
font-family: Roboto, Nanum Gothic;
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
background: #FFEFD5 !important;
width:300px;
font-weight: bolder;
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
div h2{
font-family: Roboto, Nanum Gothic;
font-size: 30px;
line-height: 40px;
font-weight: bold;
color:#404f52;
}
div h3{
font-family: Roboto, Nanum Gothic;
color: #5e8396;
font-size: 20px;
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

</style>
</head>
<body>
<c:import url="/WEB-INF/views/common/menubar.jsp" />
<br><br><br><br><br><br><br>
<div class="container">
      <div class="col-md-6 mx-auto text-center">
         <div>
            <h2>휘모리(Whimory)</h2>
            <h3>로그인 페이지</h3><br>
         </div>
      </div>
      <div class="row">
         <div class="col-md-4 mx-auto">
            <div class="myform form ">
            <!-- 로그인 창 -->
               <form action="login.do" method="post">
                  <div class="form-group">
                     <input type="text" name="user_id" class="form-control my-input" id="userid" placeholder="아이디" />
                  </div>
                  <div class="form-group">
                     <input type="password" name="user_pwd" class="form-control my-input" id="userpwd" placeholder="비밀번호" />
                  </div>

                  <!-- 아이디&비밀번호찾기/회원가입 버튼 -->
                  <div class="form-group text-center">
					 <a class="btn f-button" href="findaccount.do">아이디 찾기 | 비밀번호 찾기</a>                  	 
                  </div>
                  
                  <div class="text-center">
                     <button type="submit" class="send-button">로그인</button>
                     <div style="height:10px;"></div>
                     <a class="btn e-button" href="enrollPage.do">회원가입</a>
                  </div>
                  <div class="col-md-12 ">
                     <div class="login-or">
                        <hr class="hr-or">
                        <span class="span-or">or</span>
                     </div>
                  </div>
                  <!-- 카카오톡 로그인 버튼 -->
                  <div class="form-group text-center">
                     <a href="javascript:kakaoLogin();"><img src='${ pageContext.servletContext.contextPath }/resources/images/kakao_login_medium_wide.png'></a>
                  </div>
                  <p class="small mt-3">서비스 가입 시, 휘모리(Whimory) <a href="#" class="ps-hero__content__link">이용약관</a> 및<br><a href="#">개인정보 처리방침</a>
                     내용을 인정하는 것으로 간주됩니다.</p>
               </form>
            </div>
         </div>
      </div>
   </div>

<br><br>
<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>