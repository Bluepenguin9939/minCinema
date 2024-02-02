
// chart data and options
let chartData = {
    labels: ['1월', '2월', '3월','4월','5월','6월','7월','8월','9월','10월','11월','12월','total'], // x축 라벨즈
    datasets: [
        {
            label: '고객 문의',
            yAxisID: 'y-left',
            data: [15,15,10,15,15,10,30,10,40,10,10,10,57], //y축 고객문의 기준 
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)'
            ],
            borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)'
            ],
            borderWidth: 1
        },
        {
            label: '문의 답변',
            yAxisID: 'y-right',
            data: [15,15,10,15,15,10,30,10,40,10,10,55], //y축 답변 기준 
            backgroundColor: [
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
            ],
            borderColor: [
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
            ],
            borderWidth: 1
        }
    ]
}

let chartOptions = {
    responsive:true,
    // maintainAspectRatio: false,
    scales: {
        x: {
            title: {
                display: true,
                text: '1대1 문의'
            }
        },
        'y-left': {
            position: 'left',
            grid: {
                display: true
            }
        },
        'y-right': {
           
            position: 'right',
            display: false,
            grid: {
                display: true
            }
        }
    }
}
