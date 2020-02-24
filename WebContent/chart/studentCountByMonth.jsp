<%@page import="dao.chartDao"%>
<%@page import="chart.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
	<title>월 별 수강생 수</title>
	<script src="<%=request.getContextPath()%>/js/utils.js"></script>
	<script src="https://www.chartjs.org/dist/2.9.3/Chart.min.js"></script>
	<style>
	canvas {
		-moz-user-select: none;
		-webkit-user-select: none;
		-ms-user-select: none;
	}
	</style>
</head>


<%
chartDao service = chartDao.getInstance(); //db연결

int one = service.StudentCountByMonth(1);
int two = service.StudentCountByMonth(2);
int three = service.StudentCountByMonth(3);

JSONObject json = new JSONObject();

json.setName("StudentCountByMonth");

json.putKey("January","February", "March");

Integer[] MonthCount = {one, two, three};
json.putValue(MonthCount);

%>

<body>
	<div id="canvas-holder" style="width:90%">
			<canvas id="chart-area"></canvas>	</div>
	
	<script>
	
	var data = <%=json%>

		var config = {
			type: 'doughnut',
			data: {
				datasets: [{
					data: [
						data.StudentCountByMonth[0].January,
						data.StudentCountByMonth[0].February,
						data.StudentCountByMonth[0].March
					],
					backgroundColor: [
						window.chartColors.red,
						window.chartColors.orange,
						window.chartColors.green
					],
					label: 'Dataset 1'
				}],
				labels: [
					'1월',
					'2월',
					'3월'					
				]
			},
			options: {
				responsive: true,
				legend: {
					position: 'top',
				},
				title: {
					display: true,
					text: '월 별 수강생 수'
				},
				animation: {
					animateScale: true,
					animateRotate: true
				}
			}
		};

		window.onload = function() {
			var ctx = document.getElementById('chart-area').getContext('2d');
			window.myDoughnut = new Chart(ctx, config);
		};

		

		
	</script>
	
</body>




</html>