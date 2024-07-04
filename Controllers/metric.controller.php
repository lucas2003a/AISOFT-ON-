<?php

session_start();

require_once "../Models/Metric.php";

if(isset($_POST["action"])){

    $metric = new Metric();

    switch($_POST["action"]){

        case "listAll": 
            
                echo json_encode($metric->getMetricsAll());
            break;
        case "listYearlySales": 
                echo json_encode($metric->getYearlySales());
            break;

    }
}
?>