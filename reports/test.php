<?php

require_once "../Models/Asset.php";
require_once "../vendor/autoload.php";

use PhpOffice\PhpSpreadsheet\Spreadsheet;
//use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
use \PhpOffice\PhpSpreadsheet\IOFactory;

//Instancia
$spreadsheet = new Spreadsheet(); // Librr de excel

//Metadatos
$spreadsheet->getProperties()->setCreator("Lucas Atuncar")->setTitle("Mi excel");

//Define la hoja principal
$spreadsheet->getActiveSheetIndex(0);
$sheet = $spreadsheet->getActiveSheet(); // Hoja de trabajo

//Deifne estilos
$spreadsheet->getDefaultStyle()->getFont()->setName("Tahoma");  //Configura el tipo de fuente
$spreadsheet->getDefaultStyle()->getFont()->setSize(20);        //Configura el tamño de la fuente

$sheet->getColumnDimension("A")->setWidth(20);                   //Configura el anho  de la columna A, se hace directo a la hoja de trabajo
$sheet->getColumnDimension("B")->setWidth(40);                   //Configura el anho  de la columna B, se hace directo a la hoja de trabajo

//Agregando valores (clouna y fila, valor)
$sheet->setCellValue("B2","Códigos");
$sheet->setCellValue("B4",100000);


$sheet->setCellValue("C1","Lucas Atuncar")->setCellValue("D1","C1");

//Indica que la respuesta es unarchivo Excel
header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');

//Indica al nevagor que se descargará el archivo con un nombre específico
header('Content-Disposition: attachment;filename="Mi excel2.xlsx"');

//Evita que el navegador haga caché del archivo
header('Cache-Control: max-age=0');

//Crea el escritor (writer) para la hoja de calculo
$writer = IOFactory::createWriter($spreadsheet, 'Xlsx');

//Guarada la hoja de calculo en la salida (flujo de salida)
$writer->save('php://output');


//Lo guarda en la carpeta
/* //Lee el libro de trabajo
$writer = new Xlsx($spreadsheet); 
$writer->save("Mi excel.xlsx"); //Guarda el libro con un nombre */
?>