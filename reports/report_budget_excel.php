<?php

require_once "../vendor/autoload.php";
require_once "../Models/Cost.php";
require_once "../Models/Asset.php";

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
$cost = new Cost;
$asset = new Asset();

$spreadsheet->getProperties()->setCreator("A.I.F Contratistas Generales S.A.C")->setTitle("Reporte_de_estado_de_lotes");
$spreadsheet->setActiveSheetIndex(0);
$sheet = $spreadsheet->getActiveSheet();

/**------------------------------------------------------------------------
 *!                           VARIABLES
 *------------------------------------------------------------------------**/
$encodedata = $_GET["id"];
$idactivo = base64_decode($encodedata);


try {
    
    $activo = $asset->listAssetId($idactivo);
    $idpresupuesto = $activo["idpresupuesto"];
    $dataCost = $cost->resumeBudgetCategory($idpresupuesto);
    $dataDetails = $cost->getResumeDet($idactivo);
    
    /**-----------------------------------------------------------------------------------------------------------------------
     *                                                    !RENDER DEL REPORTE EXCEL
     *-----------------------------------------------------------------------------------------------------------------------**/
    
    
    $subcategories = [];
    
    foreach ($dataDetails as $register) {
    
        array_push($subcategories, $register["subcategoria_costo"]);
    }
    
    $subcategories = array_unique($subcategories);
    
    $denominacion = strtoupper($activo["denominacion"]);
    $area_construccion = strtoupper($activo["area_construccion"]);
    $sublote = strtoupper($activo["sublote"]);

    /**-----------------------------------------------------------------------------------------------------------------------
     *                                        ! ASIGNANDO VALORES EN LA HOJA DE CALCULO
     *-----------------------------------------------------------------------------------------------------------------------**/
    
    $sheet->setCellValue("B2", "PROYECTO: {$denominacion}");
    $sheet->setCellValue("B3", "PRESUPUESTO PROYECTADO A UTILIZAR: VIVIENDA({$area_construccion}m2)");
    $sheet->setCellValue("B4", "SUBLOTE: ({$sublote})");
    
    $sheet->getColumnDimension("B")->setWidth("6");
    $sheet->getColumnDimension("C")->setWidth("65");
    $sheet->getColumnDimension("D")->setWidth("22");
    $sheet->getColumnDimension("E")->setWidth("13");
    $sheet->getColumnDimension("F")->setWidth("23");
    
    $sheet->getRowDimension(2)->setRowHeight(21);
    $sheet->getRowDimension(3)->setRowHeight(40);
    $sheet->getRowDimension(4)->setRowHeight(41);
    
    $sheet->mergeCells("B2:F2");
    $sheet->mergeCells("B3:F3");
    $sheet->mergeCells("B4:F4");
    
    $styleHeader1 = [
        "fill" => [
            "fillType" => Fill::FILL_SOLID,
            "startColor"     => ["argb" => "000000"]
        ],
        "alignment" => [
            "horizontal" => Alignment::HORIZONTAL_CENTER,
            "vertical" => Alignment::VERTICAL_CENTER
        ],
        "borders" => [
    
            "allBorders" => [
                "borderStyle" => Border::BORDER_THIN,
                "color" => ["argb" => "000000"]
            ]
        ],
        "font" => [
            "bold" => true,
            "color" => ["argb" => "FFFFFF"],
            "size" => 16
        ]
    ];
    
    $styleHeader2 = [
        "fill" => [
            "fillType" => Fill::FILL_SOLID,
            "startColor"     => ["argb" => "215967"]
        ],
        "alignment" => [
            "horizontal" => Alignment::HORIZONTAL_CENTER,
            "vertical" => Alignment::VERTICAL_CENTER
        ],
        "borders" => [
    
            "allBorders" => [
                "borderStyle" => Border::BORDER_THIN,
                "color" => ["argb" => "000000"]
            ]
        ],
        "font" => [
            "bold" => true,
            "color" => ["argb" => "FFFFFF"],
            "size" => 16
        ]
    ];
    
    $styleHeader3 = [
        "fill" => [
            "fillType" => Fill::FILL_SOLID,
            "startColor"     => ["argb" => "D9D9D9"]
        ],
        "alignment" => [
            "horizontal" => Alignment::HORIZONTAL_CENTER,
            "vertical" => Alignment::VERTICAL_CENTER
        ],
        "borders" => [
    
            "allBorders" => [
                "borderStyle" => Border::BORDER_THIN,
                "color" => ["argb" => "000000"]
            ]
        ],
        "font" => [
            "bold" => true,
            "color" => ["argb" => "000000"],
            "size" => 16
        ]
    ];
    
    $styleHeaderContent1 = $sheet->getStyle("B2:F2");
    $styleHeaderContent1->applyFromArray($styleHeader1);
    $styleHeaderContent2 = $sheet->getStyle("B3:F3");
    $styleHeaderContent2->applyFromArray($styleHeader2);
    $styleHeaderContent3 = $sheet->getStyle("B4:F4");
    $styleHeaderContent3->applyFromArray($styleHeader3);
    
    $sheet->setCellValue("B5", "Nº");
    $sheet->setCellValue("C5", "DESCRIPCIÓN");
    $sheet->setCellValue("D5", "CANT MAT X CASA");
    $sheet->setCellValue("E5", "Costo material a utilizarse");
    $sheet->setCellValue("F5", "Total importe material a utilizarse");
    
    $headerTable = $sheet->getStyle("B5:F5");
    
    $styleHeaderTableSubtotal = [
        "fill" => [
            "fillType" => Fill::FILL_SOLID,
            "startColor" => ["argb" => "D9D9D9"]
        ],
        "alignment" => [
            "wrapText" => true,
            "horizontal" => Alignment::HORIZONTAL_CENTER,
            "vertical" => Alignment::VERTICAL_CENTER
        ],
        "borders" => [
    
            "allBorders" => [
                "borderStyle" => Border::BORDER_THIN,
                "color" => ["argb" => "000000"]
            ]
        ],
        "font" => [
            "bold" => true,
            "color" => ["argb" => "000000"],
            "size" => 9
        ]
    ];
    $styleHeaderTable = [
        "fill" => [
            "fillType" => Fill::FILL_SOLID,
            "startColor" => ["argb" => "B7DEE8"]
        ],
        "alignment" => [
            "wrapText" => true,
            "horizontal" => Alignment::HORIZONTAL_CENTER,
            "vertical" => Alignment::VERTICAL_CENTER
        ],
        "borders" => [
    
            "allBorders" => [
                "borderStyle" => Border::BORDER_THIN,
                "color" => ["argb" => "000000"]
            ]
        ],
        "font" => [
            "bold" => true,
            "color" => ["argb" => "000000"],
            "size" => 9
        ]
    ];
    
    $headerTable->applyFromArray($styleHeaderTable);
    
    /**-----------------------------------------------------------------------------------------------------------------------
     *                                                    !RENDER DE DATOS
     *-----------------------------------------------------------------------------------------------------------------------**/
    
    $row = 6;
    $number = 1;
    $arrayFormules = [];
    
    $formules = [];

    $customFormat = '"S/ " #,##0.00_);("S/ " #,##0.00);_("-"??_);_(@_)';
    $styleMoney = [
        "numberFormat" => [
            "formatCode" => $customFormat,
        ],
        "alignment" => [
            "horizontal" => Alignment::HORIZONTAL_RIGHT,
        ]
    ];

    foreach ($subcategories as $subcategory) {
    
        $content = "";
        $sheet->setCellValue("B{$row}", "{$number}");
        $sheet->setCellValue("C{$row}", "{$subcategory}");
    
    
        $headerData = $sheet->getStyle("B{$row}:F{$row}");
        $headerData->applyFromArray($styleHeaderTable);
    
        $subcategryContent = $sheet->getStyle("C{$row}");
    
        $styleSubcategory = [
            "alignment" => [
                "horizontal" => Alignment::HORIZONTAL_LEFT,
            ]
        ];
    
        $subcategryContent->applyFromArray($styleSubcategory);
    
        $row++;
        $filaRango1 = $row;
        $filaRango2 = 0;
        $total = 0;
        
        foreach ($dataDetails as $register) {
            
            if ($subcategory == $register["subcategoria_costo"]) {
                
    
    
                $sheet->setCellValue("C{$row}", "{$register['detalle']}");
                $sheet->setCellValue("D{$row}", "{$register['cantidad']}");
                $sheet->setCellValue("E{$row}", "{$register['precio_unitario']}");
                $sheet->setCellValue("F{$row}", "{$register['total']}");
    
                /**======================
                 *    ! FORMULAS
                 *========================**/
    
                $columnE = Coordinate::stringFromColumnIndex(4); //* Col D 
                $columnD = Coordinate::stringFromColumnIndex(5); //* Col E 
                $columnF = Coordinate::stringFromColumnIndex(6); //* Col F
    
                $sheet->setCellValue("{$columnF}{$row}", "={$columnE}{$row}*{$columnD}{$row}");
    
                $contentDetail = $sheet->getStyle("B{$row}:F{$row}");
    
                $styleContent = [
                    "alignment" => [
                        "horizontal" => Alignment::HORIZONTAL_CENTER,
                        "vertical" => Alignment::VERTICAL_CENTER,
                    ],
                    "borders" => [
                        "allBorders" => [
                            "borderStyle" => Border::BORDER_THIN,
                            "color" => ["argb" => "000000"]
                        ]
                    ],
                    "font" => [
                        "bold" => false,
                        "size" => 9
                    ]
                ];
    
                $contentDetail->applyFromArray($styleContent);
    
                $detailCell = $sheet->getStyle("C{$row}");
                $detailCell->applyFromArray($styleSubcategory);
    
                $priceMoney = $sheet->getStyle("E{$row}");
    
                $priceMoney->applyFromArray($styleMoney);
    
                $priceUnit = $sheet->getStyle("F{$row}");
                $priceMoney->applyFromArray($styleMoney);
    
                $total += $register["total"];
                $row++;

            }
            $exist = false;
            $formules = [
                "idcategoria_costo" => $register["idcategoria_costo"],
                "idsubcategoria_costo" => $register["idsubcategoria_costo"],
                "total" => $register["total"],
                "subcategoria_costo" => $register["subcategoria_costo"],
                "value" => ""
            ];
            
            //! VERIFICA SI EXISTE EL ELEMENTOS EN EL ARRAY 
            foreach ($arrayFormules as $formule) {
    
    
                if (isset($formule["subcategoria_costo"]) && $formule["subcategoria_costo"] == $formules["subcategoria_costo"]) {
    
                    $exist = true;
                }
            }

            if(!$exist){
                $arrayFormules[] = $formules;
            }
    
        }

        $filaRango2 = $row - 1;
    
        $sheet->setCellValue("B{$row}", "");
        $sheet->setCellValue("C{$row}", "");
        $sheet->setCellValue("F{$row}", "{$total}");
    
        /**======================
         *    ! FORMULAS
         *========================**/
    
        $sheet->setCellValue("F{$row}", "=SUM(F{$filaRango1}:F{$filaRango2})");
    
        $headerData = $sheet->getStyle("B{$row}:F{$row}");
        $headerData->applyFromArray($styleHeaderTableSubtotal);
    
        $money = $sheet->getStyle("F{$row}");
    
        $existkey = false;
        $money->applyFromArray($styleMoney);

        foreach ($arrayFormules as &$arr) {
            if(isset($arr["subcategoria_costo"]) && $arr["subcategoria_costo"] == $subcategory){
                $arr["value"] = "=F". $row;
            }
        }
        $row++;
    
        $number++;
    }
    
    $row += 3;
    //echo json_encode($arrayFormules);
    
    $cellCosts = [];
    $startRow = $row;
    foreach ($dataCost as $cost) {
        $cell = $row;
        $limitRange1 = $row + 1;
        $limitRange2 = 0;
    
        $sheet->setCellValue("C{$row}", "{$cost['categoria_costo']}");
        $sheet->setCellValue("D{$row}", "{$cost['total']}");
    
        $resumeCategory = $sheet->getStyle("C{$row}:D{$row}");
        $resumeCategory->applyFromArray($styleHeaderTableSubtotal);
        $row++;
    
        foreach ($arrayFormules as $formule) {
    
            if ($formule["idcategoria_costo"] == $cost['idcategoria_costo']) {
    
                $sheet->setCellValue("C{$row}","{$formule['subcategoria_costo']}");
                $sheet->setCellValue("D{$row}","{$formule['total']}");
                
                $sheet->setCellValue("D{$row}","{$formule['value']}");
                
                $cellCosts[] = "D{$row}";
    
                $contentResume = $sheet->getStyle("C{$row}:D{$row}");
    
                $styleResume = [
                    "font" =>[
                        "bold" => false,
                        "size" => 9,
                        "color" =>[
                            "rgb" => "000000"
                        ]
                    ],
                    "borders" => [
                        "allBorders" => [
                            "borderStyle" => Border::BORDER_THIN,
                            "color" =>[
                                "rgb" => "000000"
                            ]
                        ]
                    ]
                ];
                $contentResume->applyFromArray($styleResume);
    
                $limitRange2 = $row;
                $row++;
            }
    
            $sheet->setCellValue("D{$cell}","=SUM(D{$limitRange1}:D{$limitRange2})");
        }
    }
    
    $string = implode(",",$cellCosts);
    $sheet->setCellValue("D{$row}","=SUM({$string})");

    $contentResumeResult = $sheet->getStyle("C{$row}:D{$row}");

    $styleFinal =[
        "fill" =>[
            "fillType" => Fill::FILL_SOLID,
            "startColor" =>[
                "rgb" => "FFFF00"
            ],
            "font" =>[
                "bold" => false,
                "size" => 9,
                "color" =>[
                    "rgb" => "000000"
                ]
            ]
        ]
    ];
    
    $contentResumeResult->applyFromArray($styleFinal);

    $moneyResume = $sheet->getStyle("D{$startRow}:D{$row}");
    $moneyResume->applyFromArray($styleMoney);

    header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
    header('Content-Disposition: attachment;filename="Presupuesto_lot5.xlsx"');
    header('Cache-Control: max-age=0');
    
    $writer = IOFactory::createWriter($spreadsheet,"Xlsx");
    $writer->save("php://output");
    
} catch (Exception $e) {
    
    $sheet->setCellValue("A1","{$e}");
}
