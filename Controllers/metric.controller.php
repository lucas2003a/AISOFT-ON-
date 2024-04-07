<?php

require_once "../Models/Metric.php";

if(isset($_POST["action"])){

    $metric = new Metric();

    switch($_POST["action"]){

        case "listAll": 
            
                echo json_encode($metric->getMetricsAll());
            break;
        case "listSepartions": 
            
                echo json_encode($metric->getMostSeparations());
            break;
        case "listMostSould": 
            
                echo json_encode($metric->getMostSould());
            break;
        case "listLeastSould": 
            
                echo json_encode($metric->getLeastSould());
            break;
        case "listYearlySales": 
                echo json_encode($metric->getYearlySales());
            break;

    }
}
?>