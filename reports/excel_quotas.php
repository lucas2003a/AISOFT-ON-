<?php

require_once "../vendor/autoload.php";

require_once "../Models/quota.php";
require_once "../Models/Contract.php";

use PhpOffice\PhpSpreadsheet\Cell\Coordinate;
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
use PhpOffice\PhpSpreadsheet\IOFactory;
use PhpOffice\PhpSpreadsheet\Style\NumberFormat;
use PhpOffice\PhpSpreadsheet\Style\Border;
use PhpOffice\PhpSpreadsheet\Style\Alignment;
use PhpOffice\PhpSpreadsheet\Style\Borders;
use PhpOffice\PhpSpreadsheet\Style\Fill;
use PhpOffice\PhpSpreadsheet\Style\Color;
use PhpOffice\PhpSpreadsheet\Worksheet\Worksheet;

$spreadsheet = new Spreadsheet();
$quota = new Quota();
$contract = new Contract();

$spreadsheet->getProperties()->setCreator("A.I.F Contratistas Generales S.A.C")->setTitle("Cronogrmas de pagos");
$spreadsheet->setActiveSheetIndex(0);
$sheet = $spreadsheet->getActiveSheet();

/**=======================================================================================================================
 *                                                    ! ZONA DE VARIABLES
 *=======================================================================================================================**/
//$getId = $_GET["id"];
// $idpresupuesto = base64_decode($getId);
$idcontrato = 7;

/**=======================================================================================================================
 *                                                    !INICIO DE VARIABLES
 *=======================================================================================================================**/

try {

    $dataCotract = $contract->listContractId($idcontrato);
    $dataQuota = $quota->reportQuotasExcel($idcontrato);
    $dataQuotaComplement = $quota->reportQuotasExcelComplement($idcontrato);

    /* echo "<br>";
    echo json_encode($dataCotract);
    echo "<br>";
    echo json_encode($dataQuota);
    echo "<br>";
    echo json_encode($dataQuotaComplement); */
    
    $sheet->getDefaultColumnDimension()->setWidth("20");  //* ESTANDARIZANDO EL ANCHO DE LAS COLUMNAS A 20 

    $sheet->getColumnDimension("a")->setWidth("10");
    $sheet->getColumnDimension("B")->setWidth("4");
    $sheet->getColumnDimension("C")->setWidth("9");
    $sheet->getColumnDimension("G")->setWidth("20");
    $sheet->getColumnDimension("H")->setWidth("20");

    $sheet->setCellValue("B2","CLIENTE: ");
    $sheet->setCellValue("B3","PORYECTO INMOVILIARIO: ");
    $sheet->setCellValue("B4","MONEDA VENTA: ");
    $sheet->setCellValue("B5","INICIAL: ");

    $sheet->setCellValue("G2","TIPO/NRO DOCUMENTO: "); 
    $sheet->setCellValue("G3","SUBLOTE: "); 
    $sheet->setCellValue("G4","PRECIO VENTA: "); 

    $styleHeaderInit = [
        "font" =>[
            "bold" => true,
            "color" => array("argb" => "000000"),
            "size" => 9
            ],
        "alignment" => [
            "horizontal" => Alignment::HORIZONTAL_LEFT,
            "vertical" => Alignment::VERTICAL_CENTER
        ],
        "fill" => [
            "fillType" => Fill::FILL_SOLID,
            "startColor" => ["argb" => "DAEEF3"]
        ]
    ];

    $ContentHeader1 = $sheet->getStyle("B2:B5");
    $ContentHeader1->applyFromArray($styleHeaderInit);

    $ContentHeader2 = $sheet->getStyle("G2:G4");
    $ContentHeader2->applyFromArray($styleHeaderInit);
    

    //* COMBINANDO CELDAS
    $sheet->mergeCells("B2:D2");
    $sheet->mergeCells("B3:D3");
    $sheet->mergeCells("B4:D4");
    $sheet->mergeCells("B5:D5");

    $sheet->mergeCells("E2:F2");
    $sheet->mergeCells("E3:F3");
    $sheet->mergeCells("E4:F4");
    $sheet->mergeCells("E5:F5");

    $sheet->mergeCells("G2:H2");
    $sheet->mergeCells("G3:H3");
    $sheet->mergeCells("G4:H4");
    
    $sheet->mergeCells("I2:J2");
    $sheet->mergeCells("I3:J3");
    $sheet->mergeCells("I4:J4");

    $styleBorderAll = [
        'borders' => [
            "allBorders" => [
                "borderStyle" => Border::BORDER_THIN,
                "color" => array("argb" => "92CDDC")
            ]
        ]
    ];

    $headerFile = $sheet->getStyle("B2:J4");
    $headerFile->applyFromArray($styleBorderAll);

    $headerFile2 = $sheet->getStyle("B5:F5");
    $headerFile2->applyFromArray($styleBorderAll);

    /**=======================================================================================================================
     *!                                                   RENDER DE LA TABLA
     *=======================================================================================================================**/

    $sheet->setCellValue("B9","Nº");
    $sheet->setCellValue("C9","Nº de cuota");
    $sheet->setCellValue("D9","Monto de cuota");
    $sheet->setCellValue("E9","Fecha de vencimiento");
    $sheet->setCellValue("F9","Estado");
    $sheet->setCellValue("G9","Fecha de pago");
    $sheet->setCellValue("H9","Monto cancelado");
    $sheet->setCellValue("I9","Modalida de pago");
    $sheet->setCellValue("J9","Entidad bancaria");
    $sheet->setCellValue("K9","Nro de operación");
    $sheet->setCellValue("L9","Detalles");
    $sheet->setCellValue("M9","Saldo por cuota");
    $sheet->setCellValue("N9","Saldo total");

    
    $styleHeaders = [
        "font" =>[
            "bold" => true,
            "color" => array("argb" => "FFFFFF"),
            "size" => 9
        ],
        "fill" => [
            "fillType" => Fill::FILL_SOLID,
            "startColor" => array("argb" => "1F497D")
        ],
        "alignment" =>[
            "wrapText" => true,
            "horizontal" => Alignment::HORIZONTAL_CENTER,
            "vertical" => Alignment::VERTICAL_CENTER
            ]
        ];
        
    $headerTable = $sheet->getStyle("B9:N9");
    $headerTable->applyFromArray($styleHeaders);

    $sheet->setCellValue("N10","Va el monto");

    $sheet->mergeCells("B10:N10");

    
    $stylesSubtotales = [
        "font" =>[
            "bold" => true,
            "color" => array("argb" => "FFFFFF"),
            "size" => 9
        ],
        "fill" => [
            "fillType" => Fill::FILL_SOLID,
            "startColor" => array("argb" => "DAEEF3")
            ]
        ];
        
    $ContentTotal = $sheet->getStyle("B10:N10");
    $ContentTotal->applyFromArray($stylesSubtotales);

    /**=======================================================================================================================
     *!                                                   INICIO DEL RENDER DE LA TABLA
     *=======================================================================================================================**/

    $row = 11;
    $number = 1;
    foreach ($dataQuota as $register) {
        $sheet->setCellValue("B$row","{$number}");
        $sheet->setCellValue("C$row","{$register["nro_cuota"]}");
        $sheet->setCellValue("D$row","{$register["monto_cuota"]}");
        $sheet->setCellValue("E$row","{$register["fecha_vencimiento"]}");
        $sheet->setCellValue("F$row","{$register["estado"]}");
        $sheet->setCellValue("G$row","{$register["fecha_pago"]}");
        $sheet->setCellValue("H$row","{$register["monto_pago"]}");
        $sheet->setCellValue("I$row","{$register["modalidad_pago"]}");
        $sheet->setCellValue("J$row","{$register["entidad_bancaria"]}");
        $sheet->setCellValue("K$row","{$register["nro_operacion"]}");
        $sheet->setCellValue("L$row","{$register["detalles"]}");
        $sheet->setCellValue("M$row","{$register["calculo"]}");

            foreach ($dataQuotaComplement as $complement) {
                if($register["iddetalle_cuota"] == $complement["iddetalle_cuota"]){
                    $sheet->setCellValue("N$row","{$complement["saldo"]}");
                }
                
            }
        $number++;
        $row++;
    }

    /*//!==================================================== FIN DEL RENDER DE LA TABLA ====================================================*/
    
    array_filter($dataQuota,function($data) )
    
/*     header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
    header('Content-Disposition: attachment;filename="Cronograma_pagos_LT.xlsx"');
    header('Cache-Control: max-age=0');

    $writer = IOFactory::createWriter($spreadsheet,"Xlsx");
    $writer->save('php://output') */;

} catch (Exception $e) {

    $sheet->setCellValue("A1","{$e}");
    echo $e;
}
?>