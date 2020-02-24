<%@page import="chart.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="dao.chartDao"%>
<%@page import="chart.nameGrade"%>
<html>
<head>
<title>강사 평점 랭킹</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
<script src="<%=request.getContextPath() %>/js/Chart.min.js"></script>
</head>

<%

chartDao service = chartDao.getInstance(); //db연결
nameGrade[] trList = service.trainerRanking();

Integer[] num = {
		trList[0].getGrade(),
		trList[1].getGrade(),
		trList[2].getGrade(),
		trList[3].getGrade(),
		trList[4].getGrade(),
		trList[5].getGrade(),
		trList[6].getGrade(),
		trList[7].getGrade(),
		trList[8].getGrade(),
		trList[9].getGrade(),
		trList[10].getGrade(),
		trList[11].getGrade()
		};

JSONObject json = new JSONObject();
json.setName("sample");
json.putKey("a","b","c","d","e","f","g","h","i","j","k","l");
json.putValue(num);
%>

<body>
<div style="width: 100%;text-align: center;">
		<canvas id="canvas" height="450" width="900"></canvas>
	</div>
	

	<script type="text/javascript">
	
		var data = <%=json%>
		
		var barChart = null;
		var barChartData = {
			labels : [
				"<%=trList[0].getName()%>",
				"<%=trList[1].getName()%>",
				"<%=trList[2].getName()%>",
				"<%=trList[3].getName()%>",
				"<%=trList[4].getName()%>",
				"<%=trList[5].getName()%>",
				"<%=trList[6].getName()%>",
				"<%=trList[7].getName()%>",
				"<%=trList[8].getName()%>",
				"<%=trList[9].getName()%>",
				"<%=trList[10].getName()%>",
				"<%=trList[11].getName()%>"
				],
		
			datasets : [
				{
					fillColor : "rgba(255,127,80,0.3)",
					strokeColor : "rgba(220,220,220,0.8)",
					highlightFill: "rgba(220,220,220,0.75)",
					highlightStroke: "rgba(220,220,220,1)",
					
					data : [
						data.sample[0].a,
						data.sample[0].b,
						data.sample[0].c,
						data.sample[0].d,
						data.sample[0].e,
						data.sample[0].f,
						data.sample[0].g,
						data.sample[0].h,
						data.sample[0].i,
						data.sample[0].j,
						data.sample[0].k,
						data.sample[0].l
						]
				}
			]

		};

		$(function() {
			var ctx = document.getElementById("canvas").getContext("2d");
			barChart = new Chart(ctx).Bar(barChartData, {
				//Boolean - Whether the scale should start at zero, or an order of magnitude down from the lowest value
				scaleBeginAtZero : false,
				//Boolean - Whether grid lines are shown across the chart
				scaleShowGridLines : true,
				//String - Colour of the grid lines
				scaleGridLineColor : "rgba(0,0,0,0.05)",
				//Number - Width of the grid lines
				scaleGridLineWidth : 1,
				//Boolean - If there is a stroke on each bar
				barShowStroke : false,
				//Number - Pixel width of the bar stroke
				barStrokeWidth : 2,
				//Number - Spacing between each of the X value sets
				barValueSpacing : 5,
				//Number - Spacing between data sets within X values
				barDatasetSpacing : 1,
				onAnimationProgress: function() {
					console.log("onAnimationProgress");
				},
				onAnimationComplete: function() {
					console.log("onAnimationComplete");
				}
			});
		});

		$("input#btnAdd").on("click", function() {
			barChart.addData(
				[randomScalingFactor(),randomScalingFactor()], 
				months[(barChart.datasets[0].bars.length)%12]
			);
		});

		$("canvas").on("click", function(e) {
			var activeBars = barChart.getBarsAtEvent(e);
			console.log(activeBars);

			for(var i in activeBars) {
				console.log(activeBars[i].value);
			}
		});
		
		

	</script>
</body>
</html>