<?php
require_once "../Models/quota.php";
require_once "../vendor/autoload.php";
date_default_timezone_set("America/Lima");

use Cron\CronExpression;
use LDAP\Result;

$cron = new CronExpression("15 3contr * * *");

$cronDate = $cron->getNextRunDate()->format("Y-m-d");

$today = date("Y-m-d");

if($today == $cronDate){

    $quotaCron = new Quota();

    $data = $quotaCron->listQuotasAll();

    foreach ($data as $result) {
        
        $resultExp = $result["fecha_vencimiento"];
        $fecha_vencimiento = date($resultExp);

        if($fecha_vencimiento < $today){

            $dataSend = [
                "idcuota" => $result["idcuota"],
                "estado" => "VENCIDO"
            ];

            $quotaCron->updateQuotasState($dataSend);
        }
    }

}
?>
