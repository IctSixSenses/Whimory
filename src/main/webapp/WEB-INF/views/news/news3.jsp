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
table tr td a { text-decoration:none } 
</style> 
<script type="text/javascript">
   
   $(function() {
      //최근 등록된 언론보도 3개 전송받아서 출력되게 함
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
               values += "<tr><td>"
                     + json.list[i].news_no
                     + "</td><td><a href='wdetail.do?news_no="
                     + json.list[i].news_no
                     + "'>"
                     + decodeURIComponent(json.list[i].news_title).replace(/\+/gi, " ") + "</a></td>";
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
 <section>
      <!-- 최근 등록된 언론보도 3개 출력 : ajax -->
      <div style="float:right;">
         <h5>언론보도 New Top3</h5>
         <table id="News3" border="1" solid="black" width="500" border-collapse="collapse">
            <tr align="center" bgcolor="lightgrey">
               <th>No.</th>
               <th>Name</th>
      
            </tr>
         </table>
      </section>
</body>
</html>