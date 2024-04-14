<?php

require_once "../Models/Asset.php";
require_once "../vendor/autoload.php";

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use \PhpOffice\PhpSpreadsheet\IOFactory;
use PhpOffice\PhpSpreadsheet\Reader\Xls\Style\Border as StyleBorder;
use PhpOffice\PhpSpreadsheet\RichText\RichText;
use PhpOffice\PhpSpreadsheet\Style\Fill;
use PhpOffice\PhpSpreadsheet\Style\Alignment;
use PhpOffice\PhpSpreadsheet\Style\Border;
use PhpOffice\PhpSpreadsheet\Style\Font;

$spreadsheet = new Spreadsheet();
$asset = new Asset();

//método
$idproyecto = 1;

$denominacion = "";
$codigo = "";
$lotesVend = 0;
$lotesNoVend = 0;
$loteSsep = 0;
$loteTotal = 0;

$data = $asset->getLotsReports($idproyecto);

foreach($data as $register){

    $denominacion = $register["denominacion"];
    $codigo = $register["codigo"];
    $lotesVend = $register["l_vendidos"];
    $lotesNoVend = $register["l_noVendidos"];
    $loteSsep = $register["l_separados"];
    $loteTotal = $register["l_total"];
}


$spreadsheet->getProperties()->setCreator("A.I.F Contratistas Generales S.A.C")->setTitle("Resporte de estado de lotes - " . $denominacion);

$spreadsheet->setActiveSheetIndex(0);       //PRIMERA HOJA
$sheet = $spreadsheet->getActiveSheet();    //HOJA DE TRABAO

//HEADERS CONTADORES --------------------------------------------------------------------------------------
$sheet->setCellValue("O5","Vendidos");
$sheet->setCellValue("P5","No vendidos");
$sheet->setCellValue("Q5","Separados");
$sheet->setCellValue("R5","Total");

$sheet->setCellValue("O7",$lotesVend);
$sheet->setCellValue("P7",$lotesNoVend);
$sheet->setCellValue("Q7",$loteSsep);
$sheet->setCellValue("R7",$loteTotal
);

$sheet->getColumnDimension("O")->setWidth(20);
$sheet->getColumnDimension("P")->setWidth(20);
$sheet->getColumnDimension("Q")->setWidth(20);
$sheet->getColumnDimension("R")->setWidth(20);

$sheet->mergeCells("O5:O6");
$sheet->mergeCells("P5:P6");
$sheet->mergeCells("Q5:Q6");
$sheet->mergeCells("R5:R6");

$sheet->mergeCells("O7:O8");
$sheet->mergeCells("P7:P8");
$sheet->mergeCells("Q7:Q8");
$sheet->mergeCells("R7:R8");

$styleHeadCounterArray = [
    "fill" => [
        "fillType" => Fill::FILL_SOLID,
        "startColor"     => ["argb" => "4F81BD"]
    ],

    "alignment" => [
        "horizontal" => Alignment::HORIZONTAL_CENTER,
        "vertical" => Alignment::VERTICAL_CENTER
    ],

    "borders" => [
        "allBorders" => [
            "borderStyle" => Border::BORDER_THIN,
            "color" => ["argb" => "FF000000"]
        ]
    ],

    "font" => [
        "size" => 16
    ] 
];

$styleHeadCounter = $sheet->getStyle("O5:R6");
$styleHeadCounter->applyFromArray($styleHeadCounterArray);

$styleBodyCounterArray = [
    "fill" => [
        "fillType" => Fill::FILL_SOLID,
        "startColor"     => ["argb" => "C5D9F1"]
    ],

    "alignment" => [
        "horizontal" => Alignment::HORIZONTAL_CENTER,
        "vertical"  => Alignment::VERTICAL_CENTER
    ],

    "borders" => [
        "allBorders" => [
            "borderStyle" => Border::BORDER_THIN,
            "color" => ["argb" => "FF000000"]
        ]
    ],

    "font" => [
        "bold" => false,
        "size" => 16
    ] 
];

$styleBodyCounter = $sheet->getStyle("O7:R8");
$styleBodyCounter->applyFromArray($styleBodyCounterArray);

//PRIMERA PARTE DE LA CABEZERA ------------------------------------------------------------------------------
//Texto enriquecido
$richText = new RichText();

//Altura de la segunda fila
$sheet->getRowDimension("2")->setRowHeight(50);

//Texto para las celdas combinadas
$textRun1 = $richText->createTextRun("PROYECTO\n"); //PHP_EOL => Indica el fin de la línea
$textRun1->getFont()->setBold(true)->setSize(18);

$textRun2 = $richText->createTextRun($denominacion);
$textRun2->getFont()->setBold(true)->setSize(36);

//valores de la cabezera
$sheet->setCellValue("B2",$richText);

//Combina las celdas de la cabezera
$sheet->mergeCells("B2:L6");

//Aplica los estlos a la cabezera

//Array de estilos
$styleHeader1Fill =[

    "fill" =>[
        "fillType" => Fill::FILL_SOLID,
        "startColor" => ["argb" => "00B050"]
    ],

    "alignment"=>[
        "horizontal" => Alignment::HORIZONTAL_CENTER,
        "vertical"  => Alignment::VERTICAL_CENTER
    ],

    "borders" => [
        "outline" => [
            "borderStyle" => Border::BORDER_THIN,
            "color" => ["argb" => "FF000000"]
        ]
    ]
];

$styleHeader = $sheet->getStyle("B2:L6");

$styleHeader->applyFromArray($styleHeader1Fill);

//SGUNDA PARTE DE LA CABEZERA ------------------------------------------------------------------------------

$richText2  = new RichText();

$textRun4 = $richText2->createTextRun($codigo);
$textRun4->getFont()->setBold(true)->setSize(24);

$sheet->setCellValue("B7",$richText2);

$sheet->mergeCells("B7:L8");

$styleHeader2Fill = [
    "fill" => [
        "fillType" => Fill::FILL_SOLID,
        "startColor" => ["argb" => "FFFF00"]
    ],

    "alignment" => [
        "horizontal" => Alignment::HORIZONTAL_CENTER,
        "vertical"  => Alignment::VERTICAL_CENTER
    ],

    "borders" => [
        "outline" => [
            "borderStyle" => Border::BORDER_THIN,
            "color" => ["argb" => "FF000000"]
        ]
    ]
];

$styleHeader2 = $sheet->getStyle("B7:L8");
$styleHeader2->applyFromArray($styleHeader2Fill);


//CABEZERA DE LA TABLA -----------------------------------------------------------------------------------------

//Sublote
$sheet->setCellValue("B11","Sublote");
$sheet->getColumnDimension("B")->setWidth(14);

$styleSubloteHeader = $sheet->getStyle("B11")->getFont();
$styleSubloteHeader->setBold(true)->setSize(16);


//Estado
$sheet->setCellValue("C11","Estado");
$sheet->getColumnDimension("C")->setWidth(20);

$styleEstadoHeader = $sheet->getStyle("C11")->getFont();
$styleEstadoHeader->setBold(true)->setSize(16);

//Moneda venta
$sheet->setCellValue("D11","Moneda de venta");

$mergerMVenta = $sheet->mergeCells("D11:F11");

$styleMVenta = $sheet->getStyle("D11:F11")->getFont();
$styleMVenta->setBold(true)->setSize(16);

//Precio de venta 
$sheet->setCellValue("G11","Precio de venta");

$mergePrecioVenta = $sheet->mergeCells("G11:I11");

$stylePVenta = $sheet->getStyle("G11:I11");
$stylePVenta->getFont()->setBold(true)->setSize(16);

//Área del terreno
$sheet->setCellValue("J11","Área del terreno");

$mergeATerreno = $sheet->mergeCells("J11:L11");

$styleATerreno = $sheet->getStyle("J11:L11");
$styleATerreno->getFont()->setBold(true)->setSize(16);

//Estilo de la cabezera de la tabla
$styleTHeadArray = [
    "fill" => [
        "fillType" => Fill::FILL_SOLID,
        "startColor"     => ["argb" => "4F81BD"]
    ],

    "alignment" => [
        "horizontal" => Alignment::HORIZONTAL_CENTER,
        "vertical" => Alignment::VERTICAL_CENTER
    ],

    "borders" => [
        "allBorders" => [
            "borderStyle" => Border::BORDER_THIN,
            "color" => ["argb" => "FF000000"]
        ]
    ]
];

$styleTHead = $sheet->getStyle("B11:L11");
$styleTHead->applyFromArray($styleTHeadArray);

//Renderizar los datos

$row = 12; // Número de la fila donde inicia

foreach($data as $register){

    $sheet->setCellValue("B{$row}","{$register["sublote"]}");
    $sheet->setCellValue("C{$row}","{$register["estado"]}");
    $sheet->setCellValue("D{$row}","{$register["moneda_venta"]}");
    $sheet->setCellValue("G{$row}","{$register["precio_venta"]}");
    $sheet->setCellValue("J{$row}","{$register["area_terreno"]} m2");
    
    
    $sheet->mergeCells("D{$row}:F{$row}");
    $sheet->mergeCells("G{$row}:I{$row}");
    $sheet->mergeCells("J{$row}:L{$row}");

    $format = $sheet->getStyle("G{$row}:L{$row}");
    $format->getNumberFormat()->setFormatCode("#,##0.00");

    $styleTableArray = [
        "fill" => [
            "fillType" => Fill::FILL_SOLID,
            "startColor"     => ["argb" => "C5D9F1"]
        ],

        "alignment" => [
            "horizontal" => Alignment::HORIZONTAL_CENTER,
            "vertical"  => Alignment::VERTICAL_CENTER
        ],

        "borders" => [
            "allBorders" => [
                "borderStyle" => Border::BORDER_THIN,
                "color" => ["argb" => "FF000000"]
            ]
        ],

        "font" => [
            "bold" => false,
            "size" => 16
        ] 
    ];

    $styleTable = $sheet->getStyle("B{$row}:L{$row}");

    $styleTable->applyFromArray($styleTableArray); 

    $row++;

}

header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
header('Content-Disposition: attachment;filename="Estado de lotes - ' . $denominacion .'.xlsx"');
header('Cache-Control: max-age=0');

$writer = IOFactory::createWriter($spreadsheet,"Xlsx");
$writer->save("php://output"); 
?>