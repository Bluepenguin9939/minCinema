
	const data = {
        labels: ['액션', '코미디', '로맨스', '공포/스릴러', '판타지', '역사'],
        datasets: [{
            label: '영화 장르별 등록 수',
            data: [12, 20, 3, 5, 2, 3],
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
            ],
            borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
            ],
            borderWidth: 1
        }]
	};



	const config = {
	 type: 'bar',
	 data, //<-셋팅 값(data)
	 options:{
		  scales: {
	            y: {
	                beginAtZero: true
	            }
	        }
		 }
	};


	const myChart = new Chart(
		document.getElementById('myChart'),
		config //<- 상단 부 컨피그
	);

	
	
	