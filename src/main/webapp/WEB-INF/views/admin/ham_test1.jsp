<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div><canvas id="myChart"></canvas></div>
<div><canvas id="myChart2"></canvas></div>
<div><canvas id="myChart3"></canvas></div>
<div><canvas id="myChart4"></canvas></div>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
var ctx = document.getElementById("myChart");
var ctx1 = document.getElementById("myChart2").getContext('2d');
var ctx2 = document.getElementById("myChart3");
var ctx3 = document.getElementById("myChart4"); 


var data = {};
var labels = {};
var bb = ["곰","호랑이","사자","코끼리","고릴라","하이에나"]
var cc = ["곰","호랑이","사자","코끼리","고릴라","제규어"]
var aa = [1,2,3,4,5,6]
var myChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: ["Red", "Blue", "Yellow", "Green", "Purple", "Orange"],
        datasets: [{
            label: '# of Votes',
            data: aa,
            borderColor: [
                'rgba(255,99,132,1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
            ],
            borderWidth: 1
        }]
    },  
});//
	myChart = new Chart(ctx1, {
    type: 'bar',
    data: {
        labels: bb,
        datasets: [
        	{
            label: '고객문의',
            data: aa,
            borderColor: [
                'rgba(255,99,132,1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
            ],
        },{
            label: '고객문의',
            data: aa,
            borderColor: [
                'rgba(255,99,132,1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
            ],
        }
       ]
    }  
});
	    myChart = new Chart(ctx2, {
	    type: 'line',
	    data: {
	        labels: ["Red", "Blue", "Yellow", "Green", "Purple", "Orange"],
	        datasets: [{
	            label: '# of Votes',
	            data: aa,
	            borderColor: [
	                'rgba(255,99,132,1)',
	                'rgba(54, 162, 235, 1)',
	                'rgba(255, 206, 86, 1)',
	                'rgba(75, 192, 192, 1)',
	                'rgba(153, 102, 255, 1)',
	                'rgba(255, 159, 64, 1)'
	            ],
	            borderWidth: 1
	        }]
	    },  
	});//
	
	myChart = new Chart(ctx3, {
	    type: 'pie',
	    data: {
	        labels: ["Red", "Blue", "Yellow", "Green", "Purple", "Orange"],
	        datasets: [{
	            label: '# of Votes',
	            data: aa,
	            borderColor: [
	                'rgba(255,99,132,1)',
	                'rgba(54, 162, 235, 1)',
	                'rgba(255, 206, 86, 1)',
	                'rgba(75, 192, 192, 1)',
	                'rgba(153, 102, 255, 1)',
	                'rgba(255, 159, 64, 1)'
	            ],
	            borderWidth: 1
	        }]
	    },  
	});//


</script>

</body>
</html>