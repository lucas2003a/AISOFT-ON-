<?php

session_start();

/**
 * * Verfica los permisos en la url
 */

function checkPermissionsURL() {

    $permissions = $_SESSION["permissions"];
    
    $currentURL = $_SERVER["REQUEST_URI"];
    $urlArray = explode("/",$currentURL);
    $currentPage = $urlArray[count($urlArray)-1];
    
    $isValid = false;
    
    foreach ($permissions as $permission) {
        
        if(stripos($currentPage,$permission)){
            $isValid = true;
            break;
        }else{
            $isValid = false;
        }
    }
}

?>