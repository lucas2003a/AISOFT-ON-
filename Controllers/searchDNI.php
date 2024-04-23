<?php
// Datos
$token = 'apis-token-8212.Q9lPCYsqb-fSerOD537b17vnbMdul7XW';
$dni = $_GET["documento_nro"];

// Iniciar llamada a API
$curl = curl_init();

// Buscar dni
curl_setopt_array($curl, array(
  CURLOPT_URL => 'https://api.apis.net.pe/v2/reniec/dni?numero=' . $dni,
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_SSL_VERIFYPEER => 0,
  CURLOPT_ENCODING => '',
  CURLOPT_MAXREDIRS => 2,
  CURLOPT_TIMEOUT => 0,
  CURLOPT_FOLLOWLOCATION => true,
  CURLOPT_CUSTOMREQUEST => 'GET',
  CURLOPT_HTTPHEADER => array(
    'Referer: https://apis.net.pe/consulta-dni-api',
    'Authorization: Bearer ' . $token
  ),
));

$response = curl_exec($curl);

curl_close($curl);
// Datos listos para usar
$persona = json_decode($response);

//La consulta devuelve un número como tipo de documento 
$docIdent = [
  "1" => "DNI",
  "4" => "Carnet de extranjería",
  "6" => "RUC"
];
  
$persona->tipoDocumento = $docIdent[$persona->tipoDocumento];

echo json_encode($persona);


?>