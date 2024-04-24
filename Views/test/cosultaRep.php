<?php
    $ruc = 20494453003;
    $params = json_encode($ruc);
    $curl = curl_init();
    curl_setopt_array($curl, [
        CURLOPT_URL => "https://apiperu.dev/api/ruc_representantes",
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_CUSTOMREQUEST => "POST",
        CURLOPT_SSL_VERIFYPEER => false,
        CURLOPT_POSTFIELDS => $params,        
        CURLOPT_HTTPHEADER => [
            'Accept: application/json',
            'Content-Type: application/json',
            'Authorization: Bearer INGRESAR_TOKEN_AQUI'
        ],
    ]);
    $response = curl_exec($curl);
    $err = curl_error($curl);
    curl_close($curl);
    if ($err) {
        echo "cURL Error #:" . $err;
    } else {
        echo json_encode($response);
    }
?>