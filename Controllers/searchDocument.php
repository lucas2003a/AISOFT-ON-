<?php
// Datos
$token = "kQjHE7ODyi7jRDDeH0oEvWVXIowht87CS9RpHoQdBLs1LuIzSA6wylTRpMUaBLf5";

if(isset($_GET["action"])){
 
  $numDoc = $_GET["documento_nro"];

  $responseData = [
    "message" => "",
    "data" => ""
  ];

  switch($_GET["action"]){

    case "searchDNI": 
      
      $url = "https://api.sunat.dev/dni/{$numDoc}?apikey={$token}";
      
      
      try{
      
        $response = file_get_contents($url);
      
        $data = json_decode($response);
      
        
      
        if($data !== null){
      
          $responseData["message"] = "Documento encontrado";
          $responseData["data"] = $data;
      
        }else{
          
          $responseData["message"] = "Documento no encontrado";
        }
      
        echo json_encode($responseData);
      }
      catch(Exception $e){
      
        die($e->getMessage());
      }
      break;
  }
}

?>