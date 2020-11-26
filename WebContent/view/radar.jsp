<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<canvas id="myChart" width=250></canvas>
	<script	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
	<script type="text/javascript">
		var context = document.getElementsById('myChart').getContext('2d');
		var myChart = new Chart(context, {
			type: 'radar',
			data: {
				labels: ['출석체크','과제','학점','학습량','난이도'],
				datasets: [{
					label:'평가',
					backgroundColor : ['rgba(75,192,192,0.2)'],
					data: [2,2,3,4,5]
				}]
			},
			options : {
				responsive : false,
				scale:{
					ticks: {
						beginAtZero: true,
					      min: 0,
					      max: 5,
					      stepSize: 1
					}
				}	
			}
			
		});
	</script>

</body>
</html>