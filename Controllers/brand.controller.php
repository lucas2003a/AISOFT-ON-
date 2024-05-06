<?php

require_once "../Models/Brand.php";

if(isset($_POST["action"])){

    $brand = new Brand();

    switch($_POST["action"]){

        case "listBrand": 

                echo json_encode($brand->listBrands());
            break;
    }
}
?>