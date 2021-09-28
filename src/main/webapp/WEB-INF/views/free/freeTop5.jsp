<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Whimory</title>

<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.0.min.js"></script>

<!-- Bootstrap CSS 및 폰트 적용 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Do+Hyeon|Jua|Nanum+Gothic|Sunflower:300" rel="stylesheet">

<style type="text/css">
html head{
	font-family: Roboto, Nanum Gothic;
}
html body{
	font-family: Roboto, Nanum Gothic;
} 
.tba{
	text-decoration:none;
	color: black;
	font-size:13pt;
}
.tbtd{
	color: black;
	font-size:13pt;
}
</style>

<script type="text/javascript">
$(function() {
    $.ajax({
       url : "freeTop5.do",
       type : "post",
       dataType : "json",
       success : function(data) {
          console.log("success : " + data);

          //object --> string
          var str = JSON.stringify(data);
          //string --> json 
          var json = JSON.parse(str);

          values = "";
          for ( var i in json.list) {
             values += "<tr align='center' height='55px'><td align='center' width='50px' class='tbtd'>" + json.list[i].free_no + "</td>"
					  + "<td align='left' width='350px'><a href='fdetail.do?page=1&free_no=" + json.list[i].free_no + "' class='tba'>" 
                      + decodeURIComponent(json.list[i].free_title).replace(/\+/gi, " ") + "</a></td>"
					  + "<td align='center' width='50px'>" + json.list[i].free_readcount + "</td></tr>";
          }

          $('#FreeTop5').html($('#FreeTop5').html() + values);
       },
       error : function(jqXHR, textstatus, errorthrown) {
          console.log("error : " + jqXHR + ", " + textstatus + ", "
                + errorthrown);
       }
    });
 });	
</script>
</head>
<body>

<div style="align:center; float:left; width:550px">
	<table id="FreeTop5" style="width:550px; align:center;" >
		<tr align="center" bgcolor="whitesmoke" height="50px"><th colspan="3" align="center"><font size="4.5">자유토론공간 인기게시글 Top5</font></th></tr>
		<tr align="center" height="40px">
			<th>No.</th>
			<th>게시글 제목</th>
			<th>조회수</th>
		</tr>
			<!-- ajax 추가 부분 -->
	</table>
</div>


</body>
</html>