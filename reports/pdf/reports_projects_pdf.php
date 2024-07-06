<page backimg="./Hoja Membrete para llevar a impresión_page-0001.jpg" backtop="15mm" backbottom="50mm">
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

    <table class="">
        <thead style="">
            <tr>
                <th>#</th>
                <th>Código</th>
                <th>Denominación</th>
                <th>Vendidos</th>
                <th>No <br> vendidos</th>
                <th>Separados</th>
                <th>Total</th>
            </tr>
            
        </thead>
        <tbody>
            <?php $row = 1;
            foreach ($data as $value) : ?>
                <tr>
                    <td><?= $row ?></td>
                    <td><?= $value['codigo'] ?></td>
                    <td><?= $value['denominacion'] ?></td>
                    <td><?= $value['vendido'] ?></td>
                    <td><?= $value['no_vendido'] ?></td>
                    <td><?= $value['separado'] ?></td>
                    <td><?= $value['total'] ?></td>
                </tr>
            <?php $row++;
            endforeach; ?>
        </tbody>
    </table>
    <div class="table">

    </div>
</page>