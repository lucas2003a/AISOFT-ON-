
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
</head>
<body>
  
<div class="container">
  
<?php
  $denominacion = "";
  $lotesVend = 0;
  $lotesNoVend;
  $lotesSep = 0;
  $total = 0;

  foreach($data as $register){
    
    $denominacion = $register["denominacion"];
    $lotesVend = $register["l_vendidos"];
    $lotesNoVend = $register["l_noVendidos"];
    $lotesSep = $register["l_separados"];
    $total = $register["l_total"];
  }
?>
  <div class="d-flex tc content-center">
    <h1><strong>A.I.F Contratistas generales S.A.C</strong></h1>
    <hr>
    <h4 class="mt-1">Reporte de estados de lotes - <?=$denominacion?></h4>
  </div>
  
  <div></div>
  <div>
  </div>

  <table class="table border-collapse tc">
      <tbody>
        <tr>
          <td><strong>Lotes vendidos</strong></td>
          <td><?=$lotesVend?></td>
        </tr>
        <tr>
          <td><strong>Lotes no vendidos</strong></td>
          <td><?=$lotesNoVend?></td>
        </tr>
        <tr>
          <td><strong>Lotes separados</strong></td>
          <td><?=$lotesSep?></td>
        </tr>
        <tr>
          <td><strong>Total</strong></td>
          <td><?=$total?></td>
        </tr>
      </tbody>
  </table>

  <div>
  <div>
  </div>
  <div>

    <table class="table border-collapse tc">
      <thead>
        <tr>
          <th style="width:20%;">Sublote</th>
          <th style="width:20%;">Estado</th>
          <th style="width:20%;">moneda_venta</th>
          <th style="width:20%;">precio_venta</th>
          <th style="width:20%;">area_terreno</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>Emil</td>
          <td>Tobias</td>
          <td>Linus</td>
        </tr>
        <tr>
          <td>16</td>
          <td>14</td>
          <td>10</td>
        </tr>
      </tbody>
    </table>

  </div>
  </div>
</div>
  
</body>
</html>

