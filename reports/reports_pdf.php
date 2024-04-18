<?php

require_once "../vendor/autoload.php";
require_once "../Models/Asset.php";

use Spipu\Html2Pdf\Html2Pdf;
use Spipu\Html2Pdf\Exception\Html2PdfException;
use Spipu\Html2Pdf\Exception\ExceptionFormatter;

if(isset($_GET["action"])){

    $asset = new Asset();

    switch($_GET["action"]){

        case "reportLots": 

            try {
                // get the HTML
                ob_start();
                include "./reports_styles.html";
            
                $codeID = $_GET["idproyecto"];
                $idproyecto = base64_decode($codeID);
                $data = $asset->getLotsReports($idproyecto);
            
                include "./reportLots_pdf_content.php";
            
                $content = ob_get_clean();
            
                $html2pdf = new Html2Pdf('P', 'A4', 'es', true, 'UTF-8', array(15, 5, 15, 5));
                $html2pdf->pdf->SetDisplayMode('fullpage');
                $html2pdf->writeHTML($content);
                header('Content-Disposition: attachment; filename="Estado_de_lotes-'.$denominacion.'.pdf"');
                $html2pdf->output('Estado_de_lotes-'.$denominacion.'.pdf');

            } catch (Html2PdfException $e) {
                $html2pdf->clean();
            
                $formatter = new ExceptionFormatter($e);
                echo $formatter->getHtmlMessage();
            }

            break;
    }
}
