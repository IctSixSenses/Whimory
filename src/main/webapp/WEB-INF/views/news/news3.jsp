<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Whimory</title>
<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
<!-- Bootstrap CSS -->
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Do+Hyeon|Jua|Nanum+Gothic|Sunflower:300" rel="stylesheet">
<style type="text/css">
html head{
	font-family: Roboto, Nanum Gothic;
}
html body{
	font-family: Roboto, Nanum Gothic;
} 
.tbimg{
	width:150px;
	height:95px;
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
       url : "new3.do",
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
             values += "<tr align='center' height='110px'><td align='center' width='50px' class='tbtd'>" + json.list[i].news_no + "</td>"
                   + "<td align='center' width='200px'><a href='wdetail.do?news_no="+ json.list[i].news_no + "'><img src='${ pageContext.request.contextPath }/resources/news_upfiles/" + json.list[i].news_re_file + "' class='tbimg'></a></td>" 
                   + "<td align='left' width='350px'><a href='wdetail.do?news_no=" + json.list[i].news_no + "' class='tba'>" 
                   + decodeURIComponent(json.list[i].news_title).replace(/\+/gi, " ") + "</a></td></tr>";
          }

          $('#News3').html($('#News3').html() + values);
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

<!-- 최근 등록된 언론보도 3개 출력 : ajax -->
<div style="align:center; float:left; width:620px;">
	<table id="News3" style="width:620px; align:center;">
		<tr align="center" bgcolor="whitesmoke" height="50px"><th colspan="3" align="center"><font size="4.5">언론보도 최신글 Top3</font></th></tr>
		<!-- ajax 추가 부분 -->
	</table>
</div>

</body>
</html>