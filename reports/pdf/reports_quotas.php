<page backimg="./Hoja Membrete para llevar a impresión_page-0001.jpg" backtop="15mm" backbottom="15mm">
    <page_header>
        <div style="
                display: block;
                text-align: center;">
            <strong style="
                    font-size: 25px;
                    font-weight: bold;
                    text-align: center;
                    color: #000;
                ">
                Proyectos A.I.F - <?= date("Y") ?>
            </strong>
        </div>
    </page_header>
    <page_footer>
        <div style="
                display:flex; 
                text-align:center; 
                position:fixed; 
                bottom:30px; 
                left:0; 
                right:0;">
            <strong>
                página [[page_cu]]/[[page_nb]]
            </strong>
        </div>
    </page_footer>

    <div style="margin-left: 0mm;margin-right: 10mm;margin-bottom: 10mm;">
        <table>
            <tbody>
                <?=$moneda= $dataContract["moneda_venta"] == "SOL" ? "S/." : "$/.";?>

                <tr>
                    <th>Cliente</th>
                    <td><?=$dataContract["cliente"]?></td>
                </tr>
                <tr>
                    <th>Proyecto</th>
                    <td><?=$dataContract["denominacion"]?></td>
                </tr>
                <tr>
                    <th>Sublote</th>
                    <td><?=$dataContract["sublote"]?></td>
                </tr>
                <tr>
                    <th>Moneda de venta</th>
                    <td><?=$moneda . $dataContract["moneda_venta"]?></td>
                </tr>
                <tr>
                    <th>Sublote</th>
                    <td><?=$moneda . $dataContract["precio_venta"]?></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div style="margin-left: 0;">

            <table>
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Cuota</th>
                        <th>Estado</th>
                        <th>Fecha <br>de vencimiento</th>
                        <th>Fecha<br> de pago</th>
                        <th>Monto pagado</th>
                        <th>Saldo</th>
                    </tr>
                    
                </thead>
                <tbody>
                    <?php $row = 1;

                    function returnColors($estado = ""){
                        
                        switch($estado){
                            case "VENCIDO": 
                                    return "#fe8080";
                                break;
                            case "EN PROCESO":
                                    return "#fdfec8";
                                break;
                            default:
                                    return "#ffffff";
                                break;
                        };
                    };

                    foreach ($dataQuotas as $quota) : ?>
                        <tr style="background-color:<?= returnColors($quota['estado']) ?>;">
                            <td><strong><?= $row ?></strong></td>
                            <td><?=$moneda .  $quota['monto_cuota'] ?></td>
                            <td><?= $quota['estado'] ?></td>
                            <td><?= $quota['fecha_vencimiento'] ?></td>
                            <td><?= $quota['fecha_pago'] ?></td>
                            <td><?=$moneda .  $quota['monto_pagado'] ?></td>
                            <td><?=$moneda . $quota['monto_restante'] ?></td>
                        </tr>
                    <?php $row++;
                    endforeach; ?>
                </tbody>
            </table>

    </div>
</page>