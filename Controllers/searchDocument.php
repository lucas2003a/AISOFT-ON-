<?php
// Datos
$token = "kQjHE7ODyi7jRDDeH0oEvWVXIowht87CS9RpHoQdBLs1LuIzSA6wylTRpMUaBLf5";
$tokenDEV = "7e172115e78fb88fd9dd583208f04b1628ba0caeb441c47b3f58fc7e275f9069";

if (isset($_GET["action"])) {


  $responseData = [
    "message" => "",
    "data" => ""
  ];

  switch ($_GET["action"]) {

    case "searchDNI":

      $numDoc = $_GET["documento_nro"];

      $params = json_encode(["dni" => $numDoc]);

      $curl = curl_init();
      curl_setopt_array($curl, array(
        CURLOPT_URL => "https://apiperu.dev/api/dni",
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_CUSTOMREQUEST => "POST",
        CURLOPT_SSL_VERIFYPEER => false,
        CURLOPT_POSTFIELDS => $params,
        CURLOPT_HTTPHEADER => [
          'Accept: application/json',
          'Content-Type: application/json',
          'Authorization: Bearer ' . $tokenDEV
        ],
      ));

      $response = curl_exec($curl);
      $data = json_decode($response);

      $err = curl_error($curl);
      curl_close($curl);

      if ($err) {
        echo "cURL Error #:" . $err;
        $responseData["message"] = "Documento no encontrado";
        $responseData["status"] = false;
      } else {

        $responseData["message"] = "Documento encontrado";
        $responseData["status"] = true;
        $responseData["data"] = $data;
      }

      echo json_encode($responseData);
      break;

    case "searchRUC":
      $numDoc = $_GET["documento_nro"];

      $params = json_encode(["ruc" => $numDoc]);

      $curl = curl_init();
      curl_setopt_array($curl, [
        CURLOPT_URL => "https://apiperu.dev/api/ruc",
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_CUSTOMREQUEST => "POST",
        CURLOPT_SSL_VERIFYPEER => false,
        CURLOPT_POSTFIELDS => $params,
        CURLOPT_HTTPHEADER => [
          'Accept: application/json',
          'Content-Type: application/json',
          'Authorization: Bearer ' . $tokenDEV
        ],
      ]);

      $response = curl_exec($curl);
      $data = json_decode($response);

      $err = curl_error($curl);
      curl_close($curl);

      if ($err) {
        echo "cURL Error #:" . $err;
        $responseData["message"] = "Documento no encontrado";
      } else {

        $responseData["message"] = "Documento encontrado";
        $responseData["data"] = $data;
      }

      echo json_encode($responseData);

      break;

    case "searchRpRUC":

      $numDoc = $_GET["documento_nro"];

      $params = json_encode(["ruc" => $numDoc]);

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
          'Authorization: Bearer ' . $tokenDEV
        ],
      ]);

      $response = curl_exec($curl);
      $data = json_decode($response);

      $err = curl_error($curl);
      curl_close($curl);

      if ($err) {
        echo "cURL Error #:" . $err;
        $responseData["message"] = "Documento no encontrado";
      } else {

        $responseData["message"] = "Documento encontrado";
        $responseData["data"] = $data;
      }

      echo json_encode($responseData);
      break;

    case "searchCE":
      $numDoc = $_GET["documento_nro"];

      $url = "https://api.sunat.dev/ce/{$numDoc}?apikey={$token}";

      try {

        $response = file_get_contents($url);
        $data = json_decode($response);

        if ($data !== null) {

          $dataResponse["message"] = "Documento encontrado";
          $dataResponse["data"] = $data;
        } else {
          $dataResponse["message"] = "Documento no encontrado";
        }

        echo json_encode($dataResponse);
      } catch (Exception $e) {
        die($e->getMessage());
      }
      break;
    case "searchTC":
      $fecha = $_GET["fecha"];

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
          'Authorization: Bearer ' . $tokenDEV
        ],
      ]);
      $response = curl_exec($curl);
      $data = json_decode($response);

      $err = curl_error($curl);
      curl_close($curl);
      if ($err) {
        echo "cURL Error #:" . $err;
        $responseData["message"] = "Sin datos";
      } else {
        $responseData["message"] = "Datos encontrados";
        $responseData["data"] = $data;
      }

      echo json_encode($responseData);

      break;
  }
}
