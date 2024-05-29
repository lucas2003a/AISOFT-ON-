<?php

require_once "Conection.php";

class Quota extends Conection{

    private $conection;

    public function __construct(){

        $this->conection = parent::getConection();
    }

    /**
     * Método que lista los las cuotas por su idcontrato
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

    /**
     * Método que obtiene una cuota por su propio id
     */
    public function getQuotaId($idcuota = 0){
        try{
            $query = $this->conection->prepare("CALL spu_list_quotas_ById(?)");
            $query->execute(array($idcuota));

            return $query->fetch(PDO::FETCH_ASSOC);
        }
        catch(Exception $e){
            die($e->getMessage());
        }
    }

    /**
     * Método que obtiene las cuotas, de acuerdo al estado
     */
    public function getQuotasState($dataQuotas = []){
        try {
            $query = $this->conection->prepare("CALL spu_list_quotas_estado(?,?)");
            $query->execute(
                array(
                    $dataQuotas['idcontrato'],
                    $dataQuotas['estado']
                )
            );

            return $query->fetchAll(PDO::FETCH_ASSOC);
        } catch (Exception $e) {
            die($e->getMessage());
        }
    }

    /**
     * Metodo que obitne las cuotas de acuerdo al estado y la fecha de vencimiento
     */
    public function getQuotasStateDate($dataQuotas = []){

        try {
            
            $query = $this->conection->prepare("CALL spu_list_quotas_estado_fven(?,?,?)");
            $query->execute(
                array(
                    $dataQuotas['idcontrato'],
                    $dataQuotas['estado'],
                    $dataQuotas['fecha_vencimiento']
                )
            );

            return $query->fetchAll(PDO::FETCH_ASSOC);

        } catch (Exception $e) {
            die($e->getMessage());
        }
    }


}
?>