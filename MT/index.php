<?php
  function conectarBD()
  {
      $server = "localhost";
      $usuario = "root";
      $pass = "12345678";
      $BD = "circuitor";

      $conexion = mysqli_connect($server, $usuario, $pass, $BD);

      if (!$conexion) {
          echo 'Ha sucedido un error inesperado en la conexión de la base de datos<br>';
      }

      return $conexion;
  }

  function desconectarBD($conexion)
  {
      $close = mysqli_close($conexion);

      if (!$close) {
          echo 'Ha sucedido un error inesperado en la desconexión de la base de datos<br>';
      }

      return $close;
  }

  function ejecutarConsulta($sql)
  {
      $conexion = conectarBD();
      $result = mysqli_query($conexion, $sql);

      if (!$result) {
          desconectarBD($conexion);
          return [];
      }

      $rawdata = [];

      while ($row = mysqli_fetch_array($result)) {
          $rawdata[] = $row;
      }

      desconectarBD($conexion);

      return $rawdata;
  }

  function obtenerPeriodoSeleccionado()
  {
      $periodo = 3600;

      if (isset($_GET['periodo'])) {
          switch ($_GET['periodo']) {
              case "hora":
                  $periodo = 3600;
                  break;
              case "dia":
                  $periodo = 86400;
                  break;
              case "semana":
                  $periodo = 604800;
                  break;
              default:
                  // Acción a tomar cuando no se cumple ninguna de las condiciones anteriores
                  break;
          }
      }

      return $periodo;
  }

  $rawdata = [];
  $conta = null;

  if (isset($_GET['conta'])) {
      $conta = $_GET['conta'];
  }

  if (isset($_GET['periodo'])) {
      $periodo = obtenerPeriodoSeleccionado();

      $sql2 = "SELECT `unixtime` FROM `MT` ORDER BY `unixtime` DESC LIMIT 1";
      $rawdata = ejecutarConsulta($sql2);
      $cont = isset($rawdata[0]["unixtime"]) ? $rawdata[0]["unixtime"] : null;
  } else {
      header("Location: index.php?periodo=hora");
      exit;
  }

  if ($conta === null) {
      $conta = $cont;
  }

  $conta1 = $conta;
  $conta2 = $conta - $periodo;

  $sql = "SELECT `unixtime`, `pot_III` FROM `MT` WHERE `unixtime` BETWEEN $conta2 AND $conta ORDER BY `unixtime` DESC";
  $rawdata = ejecutarConsulta($sql); ?>
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  <link rel="stylesheet" href="style.css">

</head>
<body>
  <script src="https://code.highcharts.com/highcharts.js"></script>
  <script src="https://code.highcharts.com/modules/series-label.js"></script>
  <script src="https://code.highcharts.com/modules/exporting.js"></script>
  <script src="https://code.highcharts.com/modules/export-data.js"></script>
  <script src="https://code.highcharts.com/modules/accessibility.js"></script>
  
  <div id="container" class="graf"></div>
  <script type='text/javascript'>
    $(function () {
      Highcharts.setOptions({
        global: {
          useUTC: false
        },
        lang: {
          thousandsSep: "",
          months: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
          weekdays: ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado']
        }
      });

      $('#container').highcharts({
        title: {
          text: (function () {
            return Highcharts.dateFormat("%A, %d %B %Y - %H:%M:%S", <?php echo 1000 * $rawdata[0]["unixtime"]; ?>)
          })()
        },
        xAxis: {
          type: 'datetime',
          tickPixelInterval: 1
        },
        yAxis: {
          title: {
            text: '[KiloWatts]'
          },
          plotLines: [{
            value: 0,
            width: 1,
            color: '#808080'
          }]
        },
        tooltip: {
          formatter: function () {
            return '<b>' + this.series.name + '</b><br/>' +
              Highcharts.dateFormat("%A, %d %B %Y - %H:%M:%S", this.x) + '<br/>' +
              Highcharts.numberFormat(this.y, 1) + ' kW';
          }
        },
        legend: {
          enabled: true
        },
        exporting: {
          enabled: true
        },
        series: [{
          name: 'Potencia Edenor',
          animation: false,
          data: (function () {
            var data = [];
            <?php
            for ($i = 0; $i < count($rawdata); $i++) {
              $unixtime_v2 = $rawdata[$i]["unixtime"] * 1000;
              echo "data.push([" . $unixtime_v2 . "," . $rawdata[$i]["pot_III"] . "]);";
            }
            ?>
            return data;
          })()
        }]
      });
    });
  </script>
  <div class="form-container">
    <form action="index.php" method="GET">
      <?php
      if (isset($_GET['periodo'])) {
        echo "<input type='hidden' name='periodo' value=" . $_GET['periodo'] . ">";
      };
      if (isset($_GET['conta'])) {
        echo "<input type='hidden' name='conta' value=" . $_GET['conta'] . ">";
      }
      ?>
      <button type="submit" name="conta" value="<?php echo $conta - $periodo; ?>">Anterior</button>
      <input type="submit" name="periodo" value="hora">
      <input type="submit" name="periodo" value="dia">
      <input type="submit" name="periodo" value="semana">
      <button type="submit" name="conta" value="<?php echo $conta; ?>">Siguiente</button>
      <button type="submit" name="conta" value="<?php echo $conta; ?>">>></button>
    </form>
  </div>

  <a href="/mediciones/scada/">SCADA</a><br>
  <a href="/index2.php" target="_blank">AppServ</a>
</body>
</html>
