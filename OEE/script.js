google.charts.load('current', {'packages':['gauge']});
google.charts.setOnLoadCallback(drawChart);

function drawChart() {
  // Obtener la velocidad de la máquina desde tu fuente de datos
  var velocidad = 100;

  var velocidadData = google.visualization.arrayToDataTable([
    ['Label', 'Value'],
    ['Velocidad', velocidad]
  ]);

  var velocidadOptions = {
    width: 400,
    height: 400,
    redFrom: 0,
    redTo: 30,
    yellowFrom: 30,
    yellowTo: 60,
    greenFrom: 60,
    greenTo: 150,
    minorTicks: 6,
    max: 150,
    majorTicks: ['0', '30', '60', '90', '120', '150']
  };

  var velocidadChart = new google.visualization.Gauge(document.getElementById('velocidad_chart_div'));
  velocidadChart.draw(velocidadData, velocidadOptions);

  // Ejemplo de código utilizando Highcharts para el gráfico de disponibilidad
  Highcharts.chart('disponibilidad_chart_div', {
    title: {
      text: 'Gráfico de Disponibilidad'
    },
    series: [{
      type: 'pie',
      name: 'Disponibilidad',
      data: [
        { name: 'Disponible', y: 80, color: 'green' },
        { name: 'No Disponible', y: 20, color: 'red' }
      ]
    }]
  });

  // Ejemplo de código utilizando Highcharts para el gráfico de calidad
  Highcharts.chart('calidad_chart_div', {
    title: {
      text: 'Gráfico de Calidad'
    },
    series: [{
      type: 'pie',
      name: 'Calidad',
      data: [
        { name: 'Buena', y: 70, color: 'blue' },
        { name: 'Defectuosa', y: 30, color: 'orange' }
      ]
    }]
  });

  // Ejemplo de código utilizando Highcharts para el gráfico de OEE
  Highcharts.chart('oee_chart_div', {
    title: {
      text: 'Gráfico de OEE'
    },
    series: [{
      type: 'pie',
      name: 'OEE',
      data: [
        { name: 'Utilizado', y: 70, color: 'purple' },
        { name: 'Desaprovechado', y: 30, color: 'yellow' }
      ]
    }]
  });
}