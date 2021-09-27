<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Whimory</title>

<style type="text/css">
#calendar{
   width:25%;
   margin:20px auto;
}
.fc-col-header-cell-cushion, .fc-daygrid-day-number{
	text-decoration: none;
	color: #696969;
}
.fc-scrollgrid-sync-inner{
	height:40px;
}
.fc-toolbar-title{
	font-family: Nanum Gothic;
}

</style>

<!-- 달력 api -->
<link href='${ pageContext.request.contextPath }/resources/fullcalendar-5.9.0/lib/main.css' rel='stylesheet' />
<script src='${ pageContext.request.contextPath }/resources/fullcalendar-5.9.0/lib/main.js'></script>

<script type='text/javascript'>
document.addEventListener('DOMContentLoaded', function() {
	var calendarEl = document.getElementById('calendar');

	var calendar = new FullCalendar.Calendar(calendarEl, {
	    googleCalendarApiKey: 'AIzaSyDfS-fG5D4uKLkyAdCTLAzgxz3VLmEQSX8',
	    eventSources: [
				{
					googleCalendarId: 'ko.south_korea#holiday@group.v.calendar.google.com',
					className: '대한민국의 휴일',
					color: '#FFE4E1',
					textColor: 'black'
		        },
				{
					googleCalendarId: 'k14qgcpkhlldnru9toi5fth8ko@group.calendar.google.com',
					className: '기념일',
					color: '#AFEEEE',
					textColor: 'black'
				}
			]
	});
	calendar.render();
});	
</script>

</head>

<body>

	<div id="calendar" style="width:1000px;" >
  		<!-- script 실행 부분 -->
  	</div>

</body>
</html>