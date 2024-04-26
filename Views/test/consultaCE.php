<?php
$token = "kQjHE7ODyi7jRDDeH0oEvWVXIowht87CS9RpHoQdBLs1LuIzSA6wylTRpMUaBLf5";
$numDoc = "001043328";
$url = "https://api.sunat.dev/ce/{$numDoc}?apikey={$token}";

try{

  $dataResponse = [
    "message" => "",
    "data" => ""
  ];

  $response = file_get_contents($url);
  $data = json_decode($response);

  if($data !== null){

    $dataResponse["message"] = "Documento encontrado";
    $dataResponse["data"] = $data;

  }else{
    $dataResponse["message"] = "Documento no encontrado";
  }

  echo json_encode($dataResponse);

}catch(Exception $e){
  die($e->getMessage());
}
?>