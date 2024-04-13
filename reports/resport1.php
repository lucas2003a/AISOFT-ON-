<?php

require_once "../Models/Asset.php";
require_once "../vendor/autoload.php";

use PhpOffice\PhpSpreadsheet\{Spreadsheet, IOFactory};


if(isset($_POST["action"])){
    
    $excel = new Spreadsheet();
    $asset = new Asset();

    switch($_POST["action"]){

        case "reportAssets":
            //Hoja activa
            $sheetActive = $excel->getActiveSheet();
            
            //Titulo de la hoja
            $sheetActive->setTitle("Reporte1");
            
            //Valor de las celdas
            //(CELDA, VALOR)
            
            $sheetActive->setCellValue("A1","Código");
            $sheetActive->setCellValue("B1","Denominación");
            $sheetActive->setCellValue("C1","Distrito");
            $sheetActive->setCellValue("D1","Provincia");
            $sheetActive->setCellValue("E1","Departamento");
            $sheetActive->setCellValue("F1","Dirección");
            
            $row = 2; //Fila donde incia el contenido depues de la cabezera
            $results = $project->listProject();
            
            foreach($results as $register){
            
                $sheetActive->setCellValue("A".$row, $register["codigo"]);
                $sheetActive->setCellValue("B".$row, $register["denominacion"]);
                $sheetActive->setCellValue("C".$row, $register["distrito"]);
                $sheetActive->setCellValue("D".$row, $register["provincia"]);
                $sheetActive->setCellValue("E".$row, $register["departamento"]);
                $sheetActive->setCellValue("F".$row, $register["direccion"]);
            
                $row++;
            }
            
            header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
            header('Content-Disposition: attachment;filename="Proyectos.xlsx"');
            header('Cache-Control: max-age=0');
            
            $writer = IOFactory::createWriter($excel, 'Xlsx');
            $writer->save('php://output');
            
            exit;
            
            
            break;
    }
}

?>