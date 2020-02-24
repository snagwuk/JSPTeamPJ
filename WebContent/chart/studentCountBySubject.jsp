<%@page import="chart.subjectDataBean"%>
<%@page import="chart.JSONObject"%>
<%@page import="dao.chartDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>

<head>
	<title>과목별/월별 수강생 현황</title>
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

subjectDataBean one = service.StudentCountBySubject(1);
subjectDataBean two = service.StudentCountBySubject(2);
subjectDataBean three = service.StudentCountBySubject(3);

JSONObject json = new JSONObject();

json.setName("StudentCountBySubject");

json.putKey("swimming","spinning", "health");

Integer[] subjectCount = {  one.getSwimming(), one.getSpinning(), one.getHealth()  };
Integer[] subjectCount2 = {  two.getSwimming(), two.getSpinning(), two.getHealth()  };
Integer[] subjectCount3 = {  three.getSwimming(), three.getSpinning(), three.getHealth()  };

json.putValue(subjectCount);
json.putValue(subjectCount2);
json.putValue(subjectCount3);

%>

<body>
	<div style="width: 90%">
			<canvas id="canvas"></canvas>
	</div>
	
	<script>
	
		var data = <%=json%>
		var barChartData = {
			labels: ['1월', '2월', '3월'],
			datasets: [
				
				{
				label: '수영',
				backgroundColor: window.chartColors.blue,
				stack: 'Stack 0',
				data: [
					data.StudentCountBySubject[0].swimming,
					data.StudentCountBySubject[1].swimming,
					data.StudentCountBySubject[2].swimming
					]
			}, 
			
			{
				label: '에어로빅',
				backgroundColor: window.chartColors.red,
				stack: 'Stack 0',
				data: [
					data.StudentCountBySubject[0].spinning,
					data.StudentCountBySubject[1].spinning,
					data.StudentCountBySubject[2].spinning				
				]
			}, 
			
			
			{
				label: '필라테스',
				backgroundColor: window.chartColors.yellow,
				stack: 'Stack 0',
				data: [
					data.StudentCountBySubject[0].health,
					data.StudentCountBySubject[1].health,
					data.StudentCountBySubject[2].health
					
					
				]
			}]

		};
		
		
		window.onload = function() {
			var ctx = document.getElementById('canvas').getContext('2d');
			window.myBar = new Chart(ctx, {
				type: 'bar',
				data: barChartData,
				options: {
					title: {
						display: true,
						text: '과목별 수강생 현황'
					},
					tooltips: {
						mode: 'index',
						intersect: false
					},
					responsive: true,
					scales: {
						x: {
							stacked: true,
						},
						y: {
							stacked: false
						}
					}
				}
			});
		};

		
	</script>
</body>

</html>
</html>