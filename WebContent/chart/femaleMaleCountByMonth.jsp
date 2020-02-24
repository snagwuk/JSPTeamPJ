<%@page import="chart.femaleMale"%>
<%@page import="chart.JSONObject"%>
<%@page import="dao.chartDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
	<title>월 별 과목 성비</title>
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
chartDao service = chartDao.getInstance(); 

femaleMale oneCount = service.femaleMaleCountByMonth(1);
femaleMale twoCount = service.femaleMaleCountByMonth(2);
femaleMale threeCount = service.femaleMaleCountByMonth(3);

JSONObject json = new JSONObject();

json.setName("femaleMaleCountByMonth");

json.putKey("female","male");

Integer[] MonthCount = {oneCount.getFemale(), oneCount.getMale() };
Integer[] MonthCount2 = {twoCount.getFemale(), twoCount.getMale() };
Integer[] MonthCount3 = {threeCount.getFemale(), threeCount.getMale() };

json.putValue(MonthCount);
json.putValue(MonthCount2);
json.putValue(MonthCount3);

%>


<body>
	<div id="container" style="width: 90%;">
		<canvas id="canvas"></canvas>
	</div>
	
	
	<script>
	
	
	
		var data = <%=json%>
		var color = Chart.helpers.color;
		var barChartData = {
			labels: ['1월', '2월', '3월'],
			datasets: [
				
				{
				label: '여자',
				backgroundColor: color(window.chartColors.red).alpha(0.5).rgbString(),
				borderColor: window.chartColors.red,
				borderWidth: 1,
				data: [
					data.femaleMaleCountByMonth[0].female,
					data.femaleMaleCountByMonth[1].female,
					data.femaleMaleCountByMonth[2].female	]
			},
			
	{
				label: '남자',
				backgroundColor: color(window.chartColors.blue).alpha(0.5).rgbString(),
				borderColor: window.chartColors.blue,
				borderWidth: 1,
				data: [
					data.femaleMaleCountByMonth[0].male,
					data.femaleMaleCountByMonth[1].male,
					data.femaleMaleCountByMonth[2].male]
			}
				
				
				]

		};

		window.onload = function() {
			var ctx = document.getElementById('canvas').getContext('2d');
			window.myBar = new Chart(ctx, {
				type: 'bar',
				data: barChartData,
				options: {
					responsive: true,
					legend: {
						position: 'top',
					},
					title: {
						display: true,
						text: '월 별 수강생 성비'
					}
				}
			});

		};

		

		
	</script>
</body>

</html>