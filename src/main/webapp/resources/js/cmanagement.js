$(function(){
    let ctx = document.getElementById('myChart3');
    let chart = new Chart(ctx, {
        type: 'pie',
        data: data1,
        options: {
        responsive: false
        }
    })
})
const data1 = {
  labels: [
    '청소년',
    '성인'
  ],
  datasets: [{
    label: '연령별 회원 수',
    data: [100,300],
    backgroundColor: [
      'rgba(255, 99, 132, 0.7)',
      'rgba(54, 162, 235, 0.7)',
    ],
    hoverOffset: 2 // 파이 분할 수
  }]
};

const config1 = {
  type: 'pie',
  data: data1,
};