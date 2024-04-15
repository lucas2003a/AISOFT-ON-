<page backtop="50mm" backbottom="20mm">
  
  <!-- HEADER -->
  <page_header>
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
    <div class="d-flex tc content-center" id="cabecera">
      <h1><strong>A.I.F Contratistas generales S.A.C</strong></h1>
      <hr>
      <h4 class="mt-1">Reporte de estados de lotes - <?=$denominacion?></h4>
    </div>
  </page_header>

  <!-- FOOTER -->
  <page_footer class="tc">
        [[page_cu]]/[[page_nb]]
  </page_footer>

    <!-- CONTENT -->
    <div class="container">

      <table class="table border-collapse tc">
        <tbody>
          <tr>
            <td class="bg-light"><strong>Lotes vendidos</strong></td>
            <td><?=$lotesVend?></td>
          </tr>
          <tr>
            <td class="bg-light"><strong>Lotes no vendidos</strong></td>
            <td><?=$lotesNoVend?></td>
          </tr>
          <tr>
            <td class="bg-light"><strong>Lotes separados</strong></td>
            <td><?=$lotesSep?></td>
          </tr>
          <tr>
            <td class="bg-light"><strong>Total</strong></td>
            <td><?=$total?></td>
          </tr>
        </tbody>
      </table>

      <div></div>
      <div></div>

    <table class="table border-collapse tc">
      <thead>
        <tr class="bg-light">
          <th style="width:20%;">Sublote</th>
          <th style="width:20%;">Estado</th>
          <th style="width:20%;">Moneda de venta</th>
          <th style="width:20%;">Pprecio de venta</th>
          <th style="width:20%;">Área terreno</th>
        </tr>
      </thead>
      <tbody>
        <?php foreach($data as $register):?>
        <?php 
          $precioVenta = number_format($register["precio_venta"],2,".",",");
          $areaTerreno = number_format($register["area_terreno"],2,".",",");
        ?> <!-- number_format(numero , cantidad de decimales,separador de decimal,separador de miles) -->
        <tr>
          <td><?=$register["sublote"]?></td>
          <td><?=$register["estado"]?></td>
          <td><?=$register["moneda_venta"]?></td>
          <td><?=$precioVenta?></td>
          <td><?=$areaTerreno?> m2</td>
        </tr>
        <?php endforeach?>
      </tbody>
    </table>
    </div>        
</page>

