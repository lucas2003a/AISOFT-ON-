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

$spreadsheet->getProperties()->setCreator("A.I.F_Contratistas_Generales_S.A.C")->setTitle("Informe_de_pagos");
$spreadsheet->setActiveSheetIndex(0);
$sheet = $spreadsheet->getActiveSheet();

/**=======================================================================================================================
 *                                                    ! ZONA DE VARIABLES
 *=======================================================================================================================**/
$getId = $_GET["id"];

$idcontrato = base64_decode($getId);

/**=======================================================================================================================
 *                                                    !INICIO DE VARIABLES
 *=======================================================================================================================**/

try {

    

    $dataContract = $contract->listContractId($idcontrato);
    $dataQuota = $quota->reportQuotasExcel($idcontrato);
    $dataQuotaComplement = $quota->reportQuotasExcelComplement($idcontrato);
    
    $sheet->getDefaultColumnDimension()->setWidth("20");  //* ESTANDARIZANDO EL ANCHO DE LAS COLUMNAS A 20 

    $sheet->getColumnDimension("a")->setWidth("10");
    $sheet->getColumnDimension("B")->setWidth("4");
    $sheet->getColumnDimension("C")->setWidth("9");
    $sheet->getColumnDimension("G")->setWidth("20");
    $sheet->getColumnDimension("H")->setWidth("20");

    $sheet->setCellValue("B3","INFORME DE PAGOS");

    $customFormat = $dataContract["moneda_venta"] == "SOL" ? '"S/ " #,##0.00_);("S/ " #,##0.00);_("-"??_);_(@_)' : '"$/ " #,##0.00_);("$/ " #,##0.00);_("-"??_);_(@_)';
    $styleColumnsNumber = [
        "numberFormat" => [
            "formatCode" => $customFormat,
        ],
        "alignment" => [
            "horizontal" => Alignment::HORIZONTAL_RIGHT,
        ]
    ];

    $title = $sheet->getStyle("B3");
    $styleTitle = [
        "font" =>[
            "bold" => true,
            "size" => 16,
            "color" => array("argb" => "000000"),
        ]
    ];

    $title->applyFromArray($styleTitle);

    $sheet->setCellValue("B5","CLIENTE: ");
    $sheet->setCellValue("B6","PORYECTO INMOVILIARIO: ");
    $sheet->setCellValue("B7","MONEDA VENTA: ");
    $sheet->setCellValue("B8","INICIAL: ");

    $sheet->setCellValue("G5","TIPO/NRO DOCUMENTO: "); 
    $sheet->setCellValue("G6","SUBLOTE: "); 
    $sheet->setCellValue("G7","PRECIO VENTA: "); 

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

    $ContentHeader1 = $sheet->getStyle("B5:B8");
    $ContentHeader1->applyFromArray($styleHeaderInit);

    $ContentHeader2 = $sheet->getStyle("G5:G7");
    $ContentHeader2->applyFromArray($styleHeaderInit);

    $sheet->setCellValue("E5","{$dataContract["cliente"]}");
    $sheet->setCellValue("E6","{$dataContract["denominacion"]}");
    $sheet->setCellValue("E7","{$dataContract["moneda_venta"]}");
    $sheet->setCellValue("E8","{$dataContract["inicial"]}");

    $sheet->setCellValue("I5","{$dataContract["documento_tipo"]} / {$dataContract["documento_nro"]}");
    $sheet->setCellValue("I6","{$dataContract["sublote"]}");
    $sheet->setCellValue("I7","{$dataContract["precio_venta"]}");

    $contentInicial = $sheet->getStyle("E8");
    $contentInicial->applyFromArray($styleColumnsNumber);

    $contentPrecioVenta = $sheet->getStyle("I7");
    $contentPrecioVenta->applyFromArray($styleColumnsNumber);

    $stylesTextHeader = [
        "alignment" => [
            "horizontal" => Alignment::HORIZONTAL_LEFT,
            "vertical" => Alignment::VERTICAL_CENTER
        ]
    ];


    $textHeader1 = $sheet->getStyle("E5:E8");
    $textHeader2 = $sheet->getStyle("I5:E7");

    $textHeader1->applyFromArray($stylesTextHeader);
    $textHeader2->applyFromArray($stylesTextHeader);

    //* COMBINANDO CELDAS
    $sheet->mergeCells("B5:D5");
    $sheet->mergeCells("B6:D6");
    $sheet->mergeCells("B7:D7");
    $sheet->mergeCells("B8:D8");

    $sheet->mergeCells("E5:F5");
    $sheet->mergeCells("E6:F6");
    $sheet->mergeCells("E7:F7");
    $sheet->mergeCells("E8:F8");

    $sheet->mergeCells("G5:H5");
    $sheet->mergeCells("G6:H6");
    $sheet->mergeCells("G7:H7");
    
    $sheet->mergeCells("I5:J5");
    $sheet->mergeCells("I6:J6");
    $sheet->mergeCells("I7:J7");

    $styleBorderAll = [
        'borders' => [
            "allBorders" => [
                "borderStyle" => Border::BORDER_THIN,
                "color" => array("argb" => "92CDDC")
            ]
        ]
    ];

    $headerFile = $sheet->getStyle("B5:J7");
    $headerFile->applyFromArray($styleBorderAll);

    $headerFile2 = $sheet->getStyle("B8:F8");
    $headerFile2->applyFromArray($styleBorderAll);

    /**=======================================================================================================================
     *!                                                   RENDER DE LA TABLA
     *=======================================================================================================================**/

    $sheet->setCellValue("B12","Nº");
    $sheet->setCellValue("C12","Nº de cuota");
    $sheet->setCellValue("D12","Monto de cuota");
    $sheet->setCellValue("E12","Fecha de vencimiento");
    $sheet->setCellValue("F12","Estado");
    $sheet->setCellValue("G12","Fecha de pago");
    $sheet->setCellValue("H12","Monto cancelado");
    $sheet->setCellValue("I12","Modalida de pago");
    $sheet->setCellValue("J12","Entidad bancaria");
    $sheet->setCellValue("K12","Nro de operación");
    $sheet->setCellValue("L12","Detalles");
    $sheet->setCellValue("M12","Saldo por cuota");
    $sheet->setCellValue("N12","Saldo total");

    
    $styleHeaders = [
        "font" =>[
            "bold" => true,
            "color" => array("argb" => "FFFFFF"),
            "size" => 12
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
        
    $headerTable = $sheet->getStyle("B12:N12");
    $headerTable->applyFromArray($styleHeaders);
    
    $sheet->mergeCells("B13:N13");
    
    $stylesSubtotales = [
        "fill" => [
            "fillType" => Fill::FILL_SOLID,
            "startColor" => array("argb" => "DAEEF3")
        ],
        "font" =>[
            "bold" => true,
            "color" => array("argb" => "000000"),
            "size" => 9
        ],
        "alignment" =>[
            "horizontal" => Alignment::HORIZONTAL_RIGHT,
            "vertical" => Alignment::VERTICAL_CENTER,
        ]
    ];
        
    $ContentTotal = $sheet->getStyle("B13:N13");
    $ContentTotal->applyFromArray($stylesSubtotales);
    
    /*// !================== CALCULO DEL VALOR MÁXIMO =================*/
    
    $arrayValores = array_map(fn($value) => $value["precio_venta"],$dataQuotaComplement);
    $valorMaximo = max($arrayValores);

    $estados = array_map(fn($value) => $value["estado"],$dataQuota);
    $sheet->setCellValue("N13","{$valorMaximo}");

    /**=======================================================================================================================
     *!                                                   INICIO DEL RENDER DE LA TABLA
     *=======================================================================================================================**/

    $row = 14;
    $number = 1;

    $rowInit = $row;
    $rowEnd = 0;
    foreach ($dataQuota as $register) {
        $sheet->setCellValue("B{$row}","{$number}");
        $sheet->setCellValue("C{$row}","{$register["nro_cuota"]}");
        $sheet->setCellValue("D{$row}","{$register["monto_cuota"]}");
        $sheet->setCellValue("E{$row}","{$register["fecha_vencimiento"]}");
        $sheet->setCellValue("F{$row}","{$register["estado"]}");
        $sheet->setCellValue("G{$row}","{$register["fecha_pago"]}");
        $sheet->setCellValue("H{$row}","{$register["monto_pago"]}");
        $sheet->setCellValue("I{$row}","{$register["modalidad_pago"]}");
        $sheet->setCellValue("J{$row}","{$register["entidad_bancaria"]}");
        $sheet->setCellValue("K{$row}","{$register["nro_operacion"]}");
        $sheet->setCellValue("L{$row}","{$register["detalles"]}");
        $sheet->setCellValue("M{$row}","{$register["calculo"]}");

        //* FROMULA PARA EL TOTAL POR CUOTA
        $sheet->setCellValue("M{$row}","=D{$row}-H{$row}");

            foreach ($dataQuotaComplement as $complement) {
                if($register["iddetalle_cuota"] == $complement["iddetalle_cuota"]){
                    
                    //* FORMULA PARA EL SUB TOTAL
                    $firstColumn = $row -1;
                    
                    $sheet->setCellValue("N{$row}","=J7-H{$row}");
                    $sheet->setCellValue("N$row","{$complement["saldo"]}");
                }
            }

            $bordersTable = [
                "borders" =>[
                    "outline" =>[
                        "borderStyle"=>Border::BORDER_THIN,
                        "color" => ["argb" => "FFFFFF"]
                    ],
                    "bottom"=>[
                        "borderStyle"=>Border::BORDER_THIN,
                        "color" => array("argb" => "92CDDC")
                    ]
                ],
                "fill" =>[
                    "fillType" => Fill::FILL_SOLID,
                    "startColor" => array("argb" => "FFFFFF")
                ]
            ];
            
            $tableBody = $sheet->getStyle("B{$row}:N{$row}");
            $tableBody->applyFromArray($bordersTable);

        $number++;
        $row++;
        $rowEnd = $row;

        
    }

    $styleColumnsText = [
        'alignment' => [
            "horizontal" => Alignment::HORIZONTAL_CENTER,
            "vertical" => Alignment::VERTICAL_CENTER
        ]
    ];

    $rowEnd = $rowEnd - 1;
    /*//*================== COLUMNAS CON FORMATO DE TEXTO =================*/

    $ColumnsText = [
        "B{$rowInit}:B{$rowEnd}",
        "C{$rowInit}:C{$rowEnd}",
        "E{$rowInit}:E{$rowEnd}",
        "F{$rowInit}:F{$rowEnd}",
        "G{$rowInit}:G{$rowEnd}",
        "I{$rowInit}:I{$rowEnd}",
        "J{$rowInit}:J{$rowEnd}",
        "K{$rowInit}:K{$rowEnd}",
        "L{$rowInit}:L{$rowEnd}"
    ];
    foreach ($ColumnsText as $column) {
        $contentColumn = $sheet->getStyle($column);
        $contentColumn->applyFromArray($styleColumnsText);
    };

    /*//*================== COLUMNAS CON FORMATO DE NUMÉRICO =================*/

    $columnsNumber = [
        "D{$rowInit}:D{$rowEnd}",
        "H{$rowInit}:H{$rowEnd}",
        "M{$rowInit}:M{$rowEnd}",
        "N{$rowInit}:N{$rowEnd}"
    ];
    foreach ($columnsNumber as $column) {
        $contentColumn = $sheet->getStyle($column);
        $contentColumn->applyFromArray($styleColumnsNumber);
    };

    
    /*//!==================================================== FIN DEL RENDER DE LA TABLA ====================================================*/

    /*//!==================================================== RENDER RESUMEN ====================================================*/
    
    /*//!==================================================== FIN DEL RENDER RESUMEN ====================================================*/
    
    
    
    
    header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
    header('Content-Disposition: attachment;filename="Informe_pagos_LT'. $dataContract["sublote"] ."_" . $dataContract["denominacion"] . "_" . $dataContract["cliente"] .'.xlsx"');
    header('Cache-Control: max-age=0');

    $writer = IOFactory::createWriter($spreadsheet,"Xlsx");
    $writer->save('php://output');

} catch (Exception $e) {

    $sheet->setCellValue("A1","{$e}");
    echo $e;
}
?>