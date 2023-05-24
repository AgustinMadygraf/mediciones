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
  
  <?php 
  function conectarBD(){  $server = "localhost";
                          $usuario = "root";
                          $pass = "12345678";
                          $BD = "powermeter";
                           //variable que guarda la conexi�n de la base de datos
                          $conexion = mysqli_connect($server, $usuario, $pass, $BD);
                          //Comprobamos si la conexi�n ha tenido exito
                          if(!$conexion){ echo 'Ha sucedido un error inexperado en la conexion de la base de datos<br>'; }
                          //devolvemos el objeto de conexi�n para usarlo en las consultas
                          return $conexion;
                        }
  
  function desconectarBD($conexion){ //Cierra la conexi�n y guarda el estado de la operaci�n en una variable
                                      $close = mysqli_close($conexion);
                                      //Comprobamos si se ha cerrado la conexi�n correctamente
                                      if(!$close){ echo 'Ha sucedido un error inexperado en la desconexion de la base de datos<br>'; }
                                      //devuelve el estado del cierre de conexi�n
                                      return $close;
                                    }
  function getArraySQL($sql){
                              //Creamos la conexi�n
                              $conexion = conectarBD();
                              //generamos la consulta
                              if(!$result = mysqli_query($conexion, $sql)) die();
                              $rawdata = array();
                              //guardamos en un array multidimensional todos los datos de la consulta
                              $i=0;
                              while($row = mysqli_fetch_array($result)){ //guardamos en rawdata todos los vectores/filas que nos devuelve la consulta
                                                                          $rawdata[$i] = $row;
                                                                          $i++;
                                                                        }
                              //Cerramos la base de datossssss
                              desconectarBD($conexion);
                              //devolvemos rawdata
                              return $rawdata;
                          }
                     
                          
                          $sql2 = "SELECT `unixtime` FROM `MT` ORDER BY `unixtime` DESC LIMIT 1";
                          //Array Multidimensional
                          $rawdata  = getArraySQL($sql2);
                          $cont     = $rawdata[0]["unixtime"];
                          $conta    = $cont;
                          $periodo = 3600; // Valor predeterminado si no se cumple ninguna de las condiciones
                          if (isset($_GET['conta'])) {  $conta = $_GET['conta'];  } 
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
                                      // Puedes agregar más casos según tus necesidades
                                      default:
                                          // Acción a tomar cuando no se cumple ninguna de las condiciones anteriores
                                          break;
                                  }
                              } else {
                                  echo '<meta http-equiv="refresh" content="0;url=index.php?periodo=hora">';
                                  exit; // Agregamos la instrucción exit para detener la ejecución del código
                              }
                          
              
          
          $conta1 = $conta;
          $conta2 = $conta - $periodo;
                          
          
          $sql = "SELECT `unixtime`, `pot_III` FROM `MT` WHERE `unixtime` BETWEEN $conta2 AND $conta ORDER BY `unixtime` DESC";
          //Array Multidimensional
          $rawdata = getArraySQL($sql);
          echo "conta = ".$conta."<br>conta1 = ".$conta1."<br>conta 2 = ".$conta2;
   
  
  ?>
  
  
  <div id="container" class="graf"></div>
        <script type='text/javascript'>
          $(function () {
                          Highcharts.setOptions({ global: { useUTC: false },
                                                  lang:   { thousandsSep: "",
                                                            months: [ 'Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre' ],
                                                            weekdays: [ 'Domingo', 'Lunes', 'Martes', 'Miercoles', 'Jueves', 'Viernes', 'Sabado' ]
                                                          }
                                                });

                          $('#container').highcharts({  title:    {   text: (function() { return Highcharts.dateFormat("%A, %d %B %Y - %H:%M:%S", <?php echo 1000*$rawdata[0]["unixtime"]; ?>) })() },
                                                        xAxis:    {   type: 'datetime',
                                                                      tickPixelInterval: 1
                                                                  },
                                                        yAxis:    {  title: { text: '[KiloWatts]' },
                                                                    plotLines:  [ { value: 0,
                                                                                      width: 1,
                                                                                      color: '#808080'
                                                                                    }
                                                                                  ]
                                                                  },
                                                        tooltip:  { formatter: function() { return '<b>'+ this.series.name +'</b><br/>'+
                                                                                            Highcharts.dateFormat("%A, %d %B %Y - %H:%M:%S", this.x) +'<br/>'+
                                                                                            Highcharts.numberFormat(this.y, 1)+' kW';
                                                                                          }
                                                                  },
                                                        legend:     { enabled: true     },
                                                        exporting:  { enabled: true  },
                                                        series:     [ { name: 'Potencia Edenor', 
                                                                        animation: false,
                                                                        data: (function() { var data = [];
                                                                                            <?php 
                                                                                                  for ($i = 0 ;$i  <count($rawdata);$i++)
                                                                                                      { $unixtime_v2 = $rawdata[$i]["unixtime"]*1000 ;
                                                                                                        echo " data.push([ ".$unixtime_v2.",".$rawdata[$i]["pot_III"] ."]);"; }  ?>
                                                                                           return data;
                                                                                          }
                                                                                          
                                                                        
                                                                        
                                                                        
                                                                        
                                                                        )()
                                                                      },
                                                                    ]




                                                                    
                                                      });
                        }
              );
        </script>
  
  
  
<div class="form-container">
  <form action="index.php" method="GET">
    <?php if (isset($_GET['periodo'])) { echo "<input type='hidden' name='periodo' value=".$_GET['periodo'].">"; };
    if (isset($_GET['conta'])) { echo "<input type='hidden' name='conta' value=".$_GET['conta'].">"; }  ?>
    <button type="submit" name="conta" value="<?php echo $conta - $periodo; ?>">Anterior</button>
    <input type="submit" name="periodo" value="hora">
    <input type="submit" name="periodo" value="dia">
    <input type="submit" name="periodo" value="semana">
    <button type="submit" name="conta" value="<?php echo $conta; ?>">Siguiente</button>
    <button type="submit" name="conta" value="<?php echo $conta; ?>">>></button>
  </form>
</div>


<a href="/mediciones/scada/">SCADA</a>
  <br>
<a href="/index2.php" target="_blank">AppServ</a>


    


</body>
</html>