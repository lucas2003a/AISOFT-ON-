<?php
// Datos
$token = "kQjHE7ODyi7jRDDeH0oEvWVXIowht87CS9RpHoQdBLs1LuIzSA6wylTRpMUaBLf5";
$tokenDEV = "7e172115e78fb88fd9dd583208f04b1628ba0caeb441c47b3f58fc7e275f9069";

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

    case "searchRUC": 
      
      $url = "https://api.sunat.dev/ruc-premium/{$numDoc}?apikey={$token}";

      $response = file_get_contents($url);

      $data = json_decode($response);

      try{

        if($data !== null){
          
          $responseData["message"] = "Documento encontrado";
          $responseData["data"] = $data;
  
        }else{
  
          $responseData["message"] = "Documento no encontrado";
        }
  
        echo json_encode($responseData);
      
      }catch(Exception $e){

        die($e->getMessage());
      }
      
      break;

    case "searchRpRUC": 
    
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
              'Authorization: Bearer '.$tokenDEV
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

    case "searchCT": 
       
      $url = "https://api.sunat.dev/ce/{$numDoc}?apikey={$token}";

      try{

        $response = file_get_contents($url);
        $data = json_decode($response);

        if($data !== null){

          $data["message"] = "Documento encontrado";
          $data["data"] = $data;

        }else{
          $data["message"] = "Documento no encontrado";
        }

        echo json_encode($data);

      }catch(Exception $e){
        die($e->getMessage());
      }
      break;
  }
}

?>