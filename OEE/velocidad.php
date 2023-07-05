<!DOCTYPE html>
<html>
<head>
  <title>Velocidad de la Máquina</title>
  <script src="https://www.gstatic.com/charts/loader.js"></script>
  <script type="text/javascript">
    google.charts.load('current', {'packages':['gauge']});
    google.charts.setOnLoadCallback(drawChart);

    function drawChart() {
      // Obtener la velocidad de la máquina desde tu fuente de datos
      var velocidad = 100;

      var data = google.visualization.arrayToDataTable([
        ['Label', 'Value'],
        ['Velocidad', velocidad]
      ]);

      var options = {
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

      var chart = new google.visualization.Gauge(document.getElementById('velocidad_chart_div'));
      chart.draw(data, options);
    }
  </script>
</head>
<body>
  <h1>Velocidad de la Máquina</h1>
  <div id="velocidad_chart_div"></div>
</body>
</html>
