<?php

require_once "Conection.php";

class Quota extends Conection{

    private $conection;

    public function __construct(){

        $this->conection = parent::getConection();
    }

    /**
     * Método que lista los contratos por su idcontrato
     */
    public function listQuotasIdcontract($idcontrato = 0){
        try{

            $query = $this->conection->prepare("CALL spu_list_quotas_idcontrato(?)");
            $query->execute(array($idcontrato));

            return $query->fetchAll(PDO::FETCH_ASSOC);
        }
        catch(Exception $e){
            die($e->getMessage());
        }
    }
}
?>