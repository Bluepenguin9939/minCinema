$(function(){
    let ctx = document.getElementById('myChart4');
    let chart = new Chart(ctx, {
        type: 'line',
        data: data2,
        options: {
        }
    })
})



const labels = [
  '1월',
  '2월',
  '3월',
  '4월',
  '5월',
  '6월',
  '7월',
  '8월',
  '9월',
  '10월',
  '11월',
  '12월',
];
const data2 = {
  labels: labels,
  datasets: [{
    label: 'My First dataset',
    backgroundColor: 'rgb(255, 99, 132)',
    borderColor: 'rgb(255, 99, 132)',
    data: [100, 100, 500, 200, 200, 300, 450,200,300,500,100,985],
  }]
};

const config2 = {
  type: 'line',
  data,
};