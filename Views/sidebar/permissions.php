<?php

class PermissionsView {

    /**
     * * Verfica los permisos en la url
     */
    
    function checkPermissionsURL() {
    
        $permissions = $_SESSION["permissions"];
        
        $currentURL = $_SERVER["REQUEST_URI"];
        $urlArray = explode("/",$currentURL);
        $currentPage = $urlArray[count($urlArray)-1];
        
        
        foreach ($permissions as $permission) {
            
            echo "pagina: {$currentPage}<br>";
            echo "permiso: {$permission["permiso"]}<br>";

            if(stripos($currentPage,$permission["permiso"]) !== false){
                return true;
                break;
            }else{
                return false;
            }

            
        }

}
}

?>