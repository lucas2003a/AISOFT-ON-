<?php
// 'Fecha de búsqueda (formato yyyy-mm-dd)'
$fecha = "2024-05-23";
$token = "7e172115e78fb88fd9dd583208f04b1628ba0caeb441c47b3f58fc7e275f9069";

$params = json_encode(['fecha' => $fecha]);
$curl = curl_init();
curl_setopt_array($curl, [
    CURLOPT_URL => "https://apiperu.dev/api/tipo_de_cambio",
    CURLOPT_RETURNTRANSFER => true,
    CURLOPT_CUSTOMREQUEST => "POST",
    CURLOPT_SSL_VERIFYPEER => false,
    CURLOPT_POSTFIELDS => $params,
    CURLOPT_HTTPHEADER => [
        'Accept: application/json',
        'Content-Type: application/json',
        'Authorization: Bearer 
        '.$token
    ],
]);
$response = curl_exec($curl);
$err = curl_error($curl);
curl_close($curl);
if ($err) {
    echo "cURL Error #:" . $err;
} else {
    echo $response;
}
?>