<?php
// Datos
$token = "kQjHE7ODyi7jRDDeH0oEvWVXIowht87CS9RpHoQdBLs1LuIzSA6wylTRpMUaBLf5";
$numDoc = 77068570;
$url = "https://apiperu.net/api/dni/{$numDoc}?apikey={$token}";


try{

  $response = file_get_contents($url);

  $data = json_decode($response);

  $responseData = [
    "message" => "",
    "data" => $data
  ];

  if($data !== null){

    $responseData["message"] = "Documento encontrado";

  }else{
    
    $responseData["message"] = "Documento no encontrado";
  }

  echo json_encode($responseData);
}
catch(Exception $e){

  die($e->getMessage());
}

?>