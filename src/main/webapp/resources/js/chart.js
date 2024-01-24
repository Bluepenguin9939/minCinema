$('.chart1').easyPieChart({
      barColor: '#f16529',
      trackColor: '#ccc',
      scaleColor: '#fff',
      lineCap: 'butt',
      lineWidth: 30,
      size: 200,
      animate: 1000,
      onStart: $.noop,
      onStop: $.noop
    });

    $('.chart2').easyPieChart({
        barColor: '#1c88c7',
        trackColor: '#fff',
        scaleColor: '#ccc',
        lineCap: 'round',
        lineWidth: 30,
        size: 200,
        animate: 1000,
        onStart: $.noop,
        onStop: $.noop
    }); 

    $('.chart3').easyPieChart({
        barColor: '#1c88c7',
        trackColor: '#fff',
        scaleColor: '#fff',
        lineCap: 'square',
        lineWidth: 30,
        size: 200,
        animate: 1000,
        onStart: $.noop,
        onStop: $.noop
    });