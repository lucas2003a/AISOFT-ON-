<?php

date_default_timezone_set("America/Lima");

require_once "../vendor/autoload.php";
require_once "../Models/Asset.php";
require_once "../Models/Metric.php";
require_once "../Models/quota.php";
require_once "../Models/Contract.php";

use Spipu\Html2Pdf\Html2Pdf;
use Spipu\Html2Pdf\Exception\Html2PdfException;
use Spipu\Html2Pdf\Exception\ExceptionFormatter;

if(isset($_GET["action"])){

    $asset = new Asset();
    $metric = new Metric();
    $quota = new Quota();
    $contract = new Contract();

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

        case 'reportsProjects':

                try {
                    
                    ob_start(); // * Inicia el objeto

                    include "./reports_styles.html";        // * Estilos

                    $data = $metric->reportsProjects();     // * Datos obtenidos de la BD
                    include "./pdf/reports_projects_pdf.php";   // * Contenido HTML


                    $content = ob_get_clean(); // * Limpia el objeto

                    $html2pdf = new Html2Pdf("P","A4","es",true,"UTF-8", array(15, 45, 15, 30));
                    $html2pdf->pdf->setDisplayMode("fullpage");
                    $html2pdf->writeHTML($content);

                    header("Content-Disposition: inline; filename='Proyectos_AIF_".date("Y").".pdf'");
                    $html2pdf->output("Proyectos_AIF_".date("Y").".pdf");

                } catch (Html2PdfException $e) {
                    $html2pdf->clean();

                    $formatter = new ExceptionFormatter($e);
                    echo $formatter->getHtmlMessage();
                }
            break;

        case 'reportsQuotas':
                
                try {
                    
                    $idcontrato = base64_decode($_GET["id"]);
                    
                    $dataContract = $contract->listContractId($idcontrato);
                    $dataAsset = $asset->listAssetId($dataContract["idactivo"]);
                    $dataQuotas = $quota->reportQuotas($idcontrato);

                    ob_start(); // * Inicia el objeto
                    
                    include "./reports_styles.html";                    // * Estilos
                    
                    include "./pdf/reports_quotas.php";                 // * Contenido HTML
                    
                    $content = ob_get_clean();                          // * Limpia el objeto
                    
                    $html2pdf = new Html2Pdf("P","A4","es",true,"UTF-8", array(20, 45, 15, 30));
                    $html2pdf->pdf->setDisplayMode("fullpage");
                    $html2pdf->writeHTML($content);
                    
                    header("Content-Disposition: inline; filename='Cuotas_AIF_".date("Y").".pdf'");
                    $html2pdf->output("Cuotas_AIF_".date("Y").".pdf");
                    
                } catch (Html2PdfException $e) {
                    
                    $html2pdf->clean();

                    $formatter = new ExceptionFormatter($e);
                    echo $formatter->getHtmlMessage();
                }
            break;
    }
}
